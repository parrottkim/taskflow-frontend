part of '../widget.dart';

class PaletteOverlayWidget extends HookWidget {
  final void Function(String? color) onTextColorSelected;
  final void Function(String? color) onHighlightColorSelected;
  final String? currentTextColor;
  final String? currentHighlightColor;
  final List<ColorOption> textColorOptions;
  final List<ColorOption> highlightColorOptions;

  const PaletteOverlayWidget({
    super.key,
    required this.onTextColorSelected,
    required this.onHighlightColorSelected,
    required this.currentTextColor,
    required this.currentHighlightColor,
    required this.textColorOptions,
    required this.highlightColorOptions,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selectedTextColor = useState<String?>(currentTextColor);
    final selectedHighlightColor = useState<String?>(currentHighlightColor);

    return ContainerWidget(
      width: 170.0,
      padding: const EdgeInsets.all(8.0),
      borderRadius: BorderRadius.circular(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intl.message('text_color'),
            style: textTheme.labelSmall?.copyWith(color: colorScheme.outline),
          ),
          SizedBox(height: 8.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: textColorOptions
                .map(
                  (option) => ColorItem(
                    onTap: () {
                      selectedTextColor.value = option.colorHex;
                      onTextColorSelected(option.colorHex);
                    },
                    option: option,
                    isSelected: option.colorHex == selectedTextColor.value,
                    type: ColorItemType.text,
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 16.0),
          Text(
            Intl.message('highlight_color'),
            style: textTheme.labelSmall?.copyWith(color: colorScheme.outline),
          ),
          SizedBox(height: 8.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: highlightColorOptions
                .map(
                  (option) => ColorItem(
                    onTap: () {
                      selectedHighlightColor.value = option.colorHex;
                      onHighlightColorSelected(option.colorHex);
                    },
                    option: option,
                    isSelected: option.colorHex == selectedHighlightColor.value,
                    type: ColorItemType.highlight,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

enum ColorItemType { text, highlight }

class ColorItem extends HookWidget {
  final ColorOption option;
  final bool isSelected;
  final VoidCallback onTap;
  final ColorItemType type;

  const ColorItem({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // 호버 상태 관리를 위한 Hook
    final isHovered = useState(false);
    final baseColor = option.colorHex.tryToColor() ?? Colors.transparent;

    final isTransparent =
        baseColor == Colors.transparent ||
        option.colorHex == Colors.transparent.toHex();

    final showBackground = type == ColorItemType.highlight;
    final showTextIcon = type == ColorItemType.text;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 24,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              border: Border.all(
                color: isTransparent
                    ? Theme.of(context).colorScheme.outline
                    : baseColor.withValues(alpha: 0.6),
                width: (isHovered.value || isSelected) ? 2.5 : 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
              color: showBackground && !isTransparent
                  ? baseColor.withValues(alpha: 0.2)
                  : Colors.transparent,
            ),
            child: showTextIcon
                ? Center(
                    child: Icon(
                      Symbols.title_rounded,
                      size: 16.0,
                      color: baseColor,
                    ),
                  )
                : (isSelected
                      ? Icon(
                          Icons.check,
                          size: 14,
                          color: baseColor.withValues(alpha: 0.8),
                        )
                      : null),
          ),
        ),
      ),
    );
  }
}

void showLinkOverlay(
  BuildContext context,
  EditorState editorState,
  Selection selection, {
  required LayerLink layerLink,
}) {
  OverlayEntry? overlay;

  void dismiss() {
    keepEditorFocusNotifier.decrease();
    overlay?.remove();
    overlay = null;
  }

  keepEditorFocusNotifier.increase();
  overlay = OverlayEntry(
    builder: (context) => Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: dismiss,
          ),
        ),
        CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          targetAnchor: Alignment.bottomLeft,
          followerAnchor: Alignment.topLeft,
          child: LinkOverlayWidget(
            onSubmitted: (insert, attributes) async {
              // 1. 포커스 해제 (에러 방지 핵심)
              FocusManager.instance.primaryFocus?.unfocus();
              await Future.delayed(Duration.zero);

              // 2. 트랜잭션 수동 시작
              final transaction = editorState.transaction;
              final path = selection.start.path;
              final node = editorState.getNodeAtPath(path);
              if (node == null) return;

              final startOffset = selection.startIndex;

              // 3. 기존 선택 영역 삭제 (있다면)
              if (!selection.isCollapsed) {
                transaction.deleteText(node, startOffset, selection.length);
              }

              // 4. 새로운 텍스트 삽입
              transaction.insertText(node, startOffset, insert);

              // 5. 삽입된 영역에만 링크 속성 적용
              transaction.formatText(node, startOffset, insert.length, {
                BuiltInAttributeKey.href: attributes,
              });

              // 6. 커서 위치를 삽입된 텍스트 뒤로 설정
              transaction.afterSelection = Selection.collapsed(
                Position(path: path, offset: startOffset + insert.length),
              );

              // 7. 딱 한 번만 적용! (Assertion Error 발생 확률 0%에 수렴)
              await editorState.apply(transaction);

              dismiss();
            },
            onRemoved: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              await Future.delayed(Duration.zero);

              final node = editorState.getNodeAtPath(selection.start.path);
              if (node == null || selection.length <= 0) return;

              final transaction = editorState.transaction;
              transaction.formatText(
                node,
                selection.startIndex,
                selection.length,
                {BuiltInAttributeKey.href: null},
              );
              transaction.afterSelection = selection;

              await editorState.apply(transaction);

              dismiss();
            },
            editorState: editorState,
            selection: selection,
          ),
        ),
      ],
    ),
  );

  Overlay.of(context, rootOverlay: true).insert(overlay!);
}
