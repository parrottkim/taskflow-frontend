part of '../widget.dart';

class LinkOverlayWidget extends HookWidget {
  final EditorState editorState;
  final Selection selection;
  final void Function(String insert, String attributes) onSubmitted;
  final VoidCallback? onRemoved;

  const LinkOverlayWidget({
    super.key,
    required this.editorState,
    required this.selection,
    required this.onSubmitted,
    this.onRemoved,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final node = editorState.getNodeAtPath(selection.end.path);
    final nodeText = node?.delta?.toPlainText() ?? "";
    final isSingleNodeSelection = selection.start.path.equals(
      selection.end.path,
    );
    final plainText = isSingleNodeSelection && !selection.isCollapsed
        ? nodeText.substring(
            min(selection.startIndex, nodeText.length),
            min(selection.endIndex, nodeText.length),
          )
        : "";

    final initialHref = editorState.getDeltaAttributeValueInSelection<String>(
      BuiltInAttributeKey.href,
      selection,
    );

    final String initialValue = useMemoized(() {
      return _normalizeEditorUrl(initialHref ?? plainText) ?? '';
    }, [initialHref, plainText]);

    // 2. 가공된 initialValue를 컨트롤러에 전달
    final attributesController = useTextEditingController(text: initialValue);
    final insertController = useTextEditingController(text: plainText);

    // 입력 실시간 감지를 위해 useValueListenable 사용
    final attributes = useValueListenable(attributesController);
    final insert = useValueListenable(insertController);

    final hasLink = initialHref != null && initialHref.isNotEmpty;
    final canSubmit =
        insert.text.trim().isNotEmpty &&
        _normalizeEditorUrl(attributes.text) != null;

    void submit() {
      final href = _normalizeEditorUrl(attributes.text);
      if (insert.text.trim().isEmpty || href == null) return;
      onSubmitted(insert.text.trim(), href);
    }

    return ContainerWidget(
      width: 240.0,
      padding: const EdgeInsets.all(4.0),
      borderRadius: BorderRadius.circular(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
            child: Text(
              Intl.message('issue_form_link_1'),
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.outline,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0),
            child: TextField(
              controller: attributesController,
              style: textTheme.labelLarge,
              onSubmitted: (_) => submit(),
              decoration: InputDecoration(
                hintText: 'https://example.com',
                contentPadding: EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 6.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
              ),
            ),
          ),
          if (!hasLink && plainText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Material(
                borderRadius: BorderRadius.circular(4.0),
                color: colorScheme.surfaceContainerHigh,
                child: InkWell(
                  onTap: canSubmit ? submit : null,
                  borderRadius: BorderRadius.circular(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Symbols.globe_rounded, size: 16.0),
                        SizedBox(width: 6.0),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _normalizeEditorUrl(attributes.text) ??
                                  attributes.text,
                              style: textTheme.labelLarge,
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              Intl.message('issue_form_link_3'),
                              style: textTheme.labelMedium?.copyWith(
                                color: colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          if (hasLink)
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0),
              child: Text(
                Intl.message('issue_form_link_2'),
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.outline,
                ),
              ),
            ),
          if (hasLink)
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0),
              child: TextField(
                controller: insertController,
                style: textTheme.labelLarge,
                onSubmitted: (_) => submit(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 6.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                ),
              ),
            ),
          if (hasLink)
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0),
              child: TextButton.icon(
                onPressed: onRemoved,
                icon: Icon(Symbols.link_off_rounded, size: 16.0),
                label: Text(Intl.message('remove_link')),
              ),
            ),
        ],
      ),
    );
  }
}

String? _normalizeEditorUrl(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;

  final normalized =
      trimmed.startsWith('http://') || trimmed.startsWith('https://')
      ? trimmed
      : 'https://$trimmed';

  final uri = Uri.tryParse(normalized);
  if (uri == null || !uri.hasScheme || uri.host.isEmpty) return null;

  return normalized;
}

void showImageOverlay(
  BuildContext context,
  EditorState editorState,
  Selection selection, {
  required LayerLink layerLink,
}) {}
