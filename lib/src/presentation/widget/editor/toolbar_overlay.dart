part of '../widget.dart';

class ToolbarOverlayWidget extends HookWidget {
  final EditorState editorState;
  final VoidCallback onPickImage;
  final double maxWidth;

  const ToolbarOverlayWidget({
    super.key,
    required this.editorState,
    required this.onPickImage,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    useListenable(editorState.selectionNotifier);

    // 현재 상태를 직접 참조 (null이어도 상관 없음)
    final selection = editorState.selection;
    final node = selection != null
        ? editorState.getNodeAtPath(selection.start.path)
        : null;
    final nodes = selection != null
        ? editorState.getNodesInSelection(selection)
        : null;

    String? textColorHex;
    String? highlightColorHex;

    final layerLink = useMemoized(() => LayerLink());
    final canFormat = selection != null && node != null;

    ToolbarButton toolbarButton({
      required IconData icon,
      required VoidCallback? onTap,
      bool isHighlight = false,
    }) {
      return ToolbarButton(
        onTap: onTap == null ? null : () => onTap(),
        icon: icon,
        isHighlight: isHighlight,
      );
    }

    Widget divider() {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: VerticalDivider(),
      );
    }

    void formatTextBlock({
      required String type,
      Map<String, dynamic> attributes = const {},
      bool toggleToParagraph = true,
    }) {
      if (selection == null || node == null || node.delta == null) return;

      final delta = node.delta!.toJson();
      final isSameBlock =
          node.type == type &&
          attributes.entries.every(
            (entry) => node.attributes[entry.key] == entry.value,
          );

      editorState.formatNode(
        selection,
        (node) => node.copyWith(
          type: toggleToParagraph && isSameBlock
              ? ParagraphBlockKeys.type
              : type,
          attributes: {
            ...attributes,
            blockComponentDelta: delta,
            blockComponentBackgroundColor:
                node.attributes[blockComponentBackgroundColor],
            blockComponentTextDirection:
                node.attributes[blockComponentTextDirection],
          },
        ),
      );
    }

    bool hasEveryAttribute(String key) {
      return selection != null &&
          (nodes?.allSatisfyInSelection(
                selection,
                (d) => d.isNotEmpty && d.everyAttributes((a) => a[key] == true),
              ) ??
              false);
    }

    bool hasEveryNonNullAttribute(String key) {
      return selection != null &&
          (nodes?.allSatisfyInSelection(
                selection,
                (delta) => delta.everyAttributes((a) => a[key] != null),
              ) ??
              false);
    }

    return CompositedTransformTarget(
      link: layerLink,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.2),
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            color: colorScheme.surfaceBright,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(right: 32.0),
            scrollDirection: Axis.horizontal,
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  children: [
                    toolbarButton(
                      onTap: editorState.undoManager.undo,
                      icon: Symbols.undo_rounded,
                    ),
                    toolbarButton(
                      onTap: editorState.undoManager.redo,
                      icon: Symbols.redo_rounded,
                    ),
                    divider(),
                    toolbarButton(
                      onTap: canFormat
                          ? () => formatTextBlock(
                              type: ParagraphBlockKeys.type,
                              toggleToParagraph: false,
                            )
                          : null,
                      isHighlight: node?.type == ParagraphBlockKeys.type,
                      icon: Symbols.match_case_rounded,
                    ),
                    toolbarButton(
                      onTap: canFormat
                          ? () => formatTextBlock(
                              type: HeadingBlockKeys.type,
                              attributes: {HeadingBlockKeys.level: 1},
                            )
                          : null,
                      icon: Symbols.format_h1_rounded,
                      isHighlight:
                          node?.type == 'heading' &&
                          node?.attributes['level'] == 1,
                    ),
                    toolbarButton(
                      onTap: canFormat
                          ? () => formatTextBlock(
                              type: HeadingBlockKeys.type,
                              attributes: {HeadingBlockKeys.level: 2},
                            )
                          : null,
                      icon: Symbols.format_h2_rounded,
                      isHighlight:
                          node?.type == 'heading' &&
                          node?.attributes['level'] == 2,
                    ),
                    toolbarButton(
                      onTap: canFormat
                          ? () => formatTextBlock(
                              type: HeadingBlockKeys.type,
                              attributes: {HeadingBlockKeys.level: 3},
                            )
                          : null,
                      icon: Symbols.format_h3_rounded,
                      isHighlight:
                          node?.type == 'heading' &&
                          node?.attributes['level'] == 3,
                    ),
                    divider(),
                    toolbarButton(
                      onTap: () {
                        if (selection == null || node == null) return;

                        editorState.toggleAttribute('bold');
                      },
                      icon: Symbols.format_bold_rounded,
                      isHighlight: hasEveryAttribute('bold'),
                    ),
                    toolbarButton(
                      onTap: () {
                        if (selection == null || node == null) return;

                        editorState.toggleAttribute('italic');
                      },
                      icon: Symbols.format_italic_rounded,
                      isHighlight: hasEveryAttribute('italic'),
                    ),
                    toolbarButton(
                      onTap: () {
                        if (selection == null || node == null) return;

                        editorState.toggleAttribute('underline');
                      },
                      icon: Symbols.format_underlined_rounded,
                      isHighlight: hasEveryAttribute('underline'),
                    ),
                    toolbarButton(
                      onTap: () {
                        if (selection == null || node == null) return;

                        editorState.toggleAttribute('strikethrough');
                      },
                      icon: Symbols.format_strikethrough_rounded,
                      isHighlight: hasEveryAttribute('strikethrough'),
                    ),
                    toolbarButton(
                      onTap: () {
                        if (selection == null || node == null) return;

                        editorState.toggleAttribute('code');
                      },
                      icon: Symbols.code_rounded,
                      isHighlight: hasEveryAttribute('code'),
                    ),
                    divider(),
                    toolbarButton(
                      onTap: () {
                        if (selection == null || node == null) return;

                        editorState.formatNode(
                          selection,
                          (node) => node.copyWith(
                            type: node.type == 'bulleted_list'
                                ? 'paragraph'
                                : 'bulleted_list',
                          ),
                        );
                      },
                      icon: Symbols.format_list_bulleted_rounded,
                      isHighlight: node?.type == 'bulleted_list',
                    ),
                    toolbarButton(
                      onTap: () {
                        if (selection == null || node == null) return;

                        editorState.formatNode(
                          selection,
                          (node) => node.copyWith(
                            type: node.type == 'numbered_list'
                                ? 'paragraph'
                                : 'numbered_list',
                          ),
                        );
                      },
                      icon: Symbols.format_list_numbered_rounded,
                      isHighlight: node?.type == 'numbered_list',
                    ),
                    toolbarButton(
                      onTap: () {
                        if (selection == null || node == null) return;

                        editorState.formatNode(
                          selection,
                          (node) => node.copyWith(
                            type: node.type == 'quote' ? 'paragraph' : 'quote',
                          ),
                        );
                      },
                      icon: Symbols.format_quote_rounded,
                      isHighlight: node?.type == 'quote',
                    ),
                    divider(),
                    toolbarButton(
                      onTap: () {
                        if (selection == null || node == null) return;

                        showPaletteOverlay(
                          context,
                          editorState,
                          currentTextColor: textColorHex,
                          currentHighlightColor: highlightColorHex,
                          layerLink: layerLink,
                        );
                      },
                      icon: Symbols.palette_rounded,
                      isHighlight:
                          selection != null &&
                          (nodes?.allSatisfyInSelection(selection, (delta) {
                                return delta.everyAttributes((attr) {
                                  textColorHex =
                                      attr[AppFlowyRichTextKeys.textColor];

                                  return (textColorHex != null);
                                });
                              }) ??
                              false),
                    ),
                    toolbarButton(
                      onTap: nodes != null && nodes.length == 1
                          ? () {
                              if (selection == null || node == null) return;

                              showLinkOverlay(
                                context,
                                editorState,
                                selection,
                                layerLink: layerLink,
                              );
                            }
                          : null,
                      icon: Symbols.link_rounded,
                      isHighlight: hasEveryNonNullAttribute(
                        AppFlowyRichTextKeys.href,
                      ),
                    ),
                    toolbarButton(
                      onTap: canFormat ? onPickImage : null,
                      icon: Symbols.photo_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DragToReorderAction extends StatefulWidget {
  const DragToReorderAction({
    super.key,
    required this.blockComponentContext,
    required this.builder,
  });

  final BlockComponentContext blockComponentContext;
  final BlockComponentBuilder builder;

  @override
  State<DragToReorderAction> createState() => _DragToReorderActionState();
}

const _interceptorKey = 'drag_to_reorder_interceptor';

class _DragToReorderActionState extends State<DragToReorderAction> {
  late final Node node;
  late final BlockComponentContext blockComponentContext;
  late final EditorState editorState = context.read<EditorState>();

  Offset? globalPosition;

  late final gestureInterceptor = SelectionGestureInterceptor(
    key: _interceptorKey,
    canTap: (details) => !_isTapInBounds(details.globalPosition),
  );

  // the selection will be cleared when tap the option button
  // so we need to restore the selection after tap the option button
  Selection? beforeSelection;
  RenderBox? get renderBox => context.findRenderObject() as RenderBox?;

  @override
  void initState() {
    super.initState();

    editorState.service.selectionService.registerGestureInterceptor(
      gestureInterceptor,
    );

    // copy the node to avoid the node in document being updated
    node = widget.blockComponentContext.node.copyWith();
    blockComponentContext = BlockComponentContext(
      widget.blockComponentContext.buildContext,
      node,
    );
  }

  @override
  void dispose() {
    editorState.service.selectionService.unregisterGestureInterceptor(
      _interceptorKey,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, right: 4.0),
      child: Draggable<Node>(
        data: node,
        feedback: _buildFeedback(),
        onDragStarted: () {
          editorState.selectionService.removeDropTarget();
        },
        onDragUpdate: (details) {
          editorState.selectionService.renderDropTargetForOffset(
            details.globalPosition,
            builder: (context, data) => _buildDropArea(
              context,
              data,
              widget.blockComponentContext.node,
            ),
          );

          globalPosition = details.globalPosition;

          editorState.scrollService?.startAutoScroll(details.globalPosition);
        },
        onDragEnd: (details) {
          editorState.selectionService.removeDropTarget();

          if (globalPosition == null) {
            return;
          }

          final data = editorState.selectionService.getDropTargetRenderData(
            globalPosition!,
          );

          final acceptedPath = data?.dropPath;

          _moveNodeToNewPosition(
            widget.blockComponentContext.node,
            acceptedPath,
            globalPosition!,
          );
        },
        child: GestureDetector(
          onTap: _onTap,
          behavior: HitTestBehavior.translucent,
          child: const MouseRegion(
            cursor: SystemMouseCursors.grab,
            child: Icon(Symbols.drag_indicator_rounded, size: 18),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    final path = widget.blockComponentContext.node.path;

    if (beforeSelection != null && path.inSelection(beforeSelection)) {
      editorState.updateSelectionWithReason(
        beforeSelection,
        customSelectionType: SelectionType.block,
      );
    } else {
      final selection = Selection.collapsed(Position(path: path));
      editorState.updateSelectionWithReason(
        selection,
        customSelectionType: SelectionType.block,
      );
    }
  }

  bool _isTapInBounds(Offset offset) {
    if (renderBox == null) {
      return false;
    }

    final localPosition = renderBox!.globalToLocal(offset);
    final result = renderBox!.paintBounds.contains(localPosition);
    if (result) {
      beforeSelection = editorState.selection;
    } else {
      beforeSelection = null;
    }
    return result;
  }

  Future<void> _moveNodeToNewPosition(
    Node node,
    Path? acceptedPath,
    Offset dragOffset,
  ) async {
    final editorState = context.read<EditorState>();
    final realNode = widget.blockComponentContext.node;

    Path? newPath;

    if (acceptedPath != null) {
      final targetNode = editorState.getNodeAtPath(acceptedPath);
      if (targetNode != null) {
        final position = _getPosition(context, targetNode, dragOffset);
        if (position != null) {
          final (verticalPosition, _) = position;

          // 단순화: top이면 targetNode 위치(앞에), bottom이면 targetNode 뒤(다음)에 삽입
          if (verticalPosition == VerticalPosition.top) {
            newPath = targetNode.path;
          } else {
            newPath = targetNode.path.next;
          }
        }
      }
    }

    // acceptedPath로 새 경로를 못 구했을 때: 문서 끝으로 이동 (폴백)
    if (newPath == null) {
      final rootChildren = editorState.document.root.children;
      if (rootChildren.isNotEmpty) {
        final lastNode = rootChildren.last;
        newPath = lastNode.path.next; // 마지막 노드 뒤로
      } else {
        newPath = [0]; // 문서가 빈 경우 첫 위치
      }
    }

    // Drop 무시 조건 확인
    if (_shouldIgnoreDrop(realNode, newPath)) {
      return;
    }

    // 마지막으로 이동 실행
    final transaction = editorState.transaction;
    transaction.moveNode(newPath, realNode);
    await editorState.apply(transaction);
  }

  Widget _buildFeedback() {
    Widget child;
    if (node.type == TableBlockKeys.type) {
      // unable to render table block without provider/context
      // render a placeholder instead
      child = Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('Table'),
      );
    } else {
      child = IntrinsicWidth(
        child: IntrinsicHeight(
          child: Provider.value(
            value: editorState,
            child: widget.builder.build(blockComponentContext),
          ),
        ),
      );
    }

    return Opacity(
      opacity: 0.7,
      child: Material(color: Colors.transparent, child: child),
    );
  }
}

Widget _buildDropArea(
  BuildContext context,
  DragAreaBuilderData data,
  Node dragNode,
) {
  final targetNode = data.targetNode;
  if (_shouldIgnoreDrop(dragNode, targetNode.path)) {
    return const SizedBox.shrink();
  }

  final selectable = targetNode.selectable;
  final renderBox = selectable?.context.findRenderObject() as RenderBox?;
  if (selectable == null || renderBox == null) return const SizedBox.shrink();

  final pos = _getPosition(context, targetNode, data.dragOffset);
  if (pos == null) return const SizedBox.shrink();

  final (verticalPosition, rect) = pos;
  const indicatorHeight = 2.0;

  // top 계산
  final top = verticalPosition == VerticalPosition.top
      ? rect.top - indicatorHeight / 2
      : rect.bottom - indicatorHeight / 2;

  // left 계산: 블록 전체 너비 사용
  final left = rect.left;
  final width = rect.width; // 전체 블록 너비로 확장
  final color = Theme.of(context).colorScheme.primary.withValues(alpha: 0.4);

  return Positioned(
    top: top,
    left: left,
    child: Container(height: indicatorHeight, width: width, color: color),
  );
}

(VerticalPosition, Rect)? _getPosition(
  BuildContext context,
  Node dragTargetNode,
  Offset dragOffset,
) {
  final selectable = dragTargetNode.selectable;
  final renderBox = selectable?.context.findRenderObject() as RenderBox?;
  if (selectable == null || renderBox == null) return null;

  final globalBlockRect = renderBox.localToGlobal(Offset.zero) & renderBox.size;

  // Vertical position
  VerticalPosition verticalPosition =
      dragOffset.dy < globalBlockRect.top + globalBlockRect.height / 2
      ? VerticalPosition.top
      : VerticalPosition.bottom;

  return (verticalPosition, globalBlockRect);
}

bool _shouldIgnoreDrop(Node dragNode, Path? targetPath) {
  if (targetPath == null) {
    return true;
  }

  if (dragNode.path.equals(targetPath)) {
    return true;
  }

  if (dragNode.path.isAncestorOf(targetPath)) {
    return true;
  }

  return false;
}

enum VerticalPosition { top, middle, bottom }

void showPaletteOverlay(
  BuildContext context,
  EditorState editorState, {
  String? currentTextColor,
  String? currentHighlightColor,
  required LayerLink layerLink,
}) {
  final colorScheme = Theme.of(context).colorScheme;

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
            onTap: dismiss,
            behavior: HitTestBehavior.opaque,
          ),
        ),
        CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          targetAnchor: Alignment.bottomLeft,
          followerAnchor: Alignment.topLeft,
          child: PaletteOverlayWidget(
            onTextColorSelected: (color) {
              formatFontColor(editorState, editorState.selection, color);
            },
            onHighlightColorSelected: (color) {
              formatHighlightColor(editorState, editorState.selection, color);
            },
            currentTextColor: currentTextColor,
            currentHighlightColor: currentHighlightColor,
            textColorOptions: [
              ColorOption(
                colorHex: colorScheme.onSurface.toHex(),
                name: AppFlowyEditorL10n.current.fontColorDefault,
              ),
              ColorOption(
                colorHex: Colors.grey.toHex(),
                name: AppFlowyEditorL10n.current.fontColorGray,
              ),
              ColorOption(
                colorHex: Colors.brown.toHex(),
                name: AppFlowyEditorL10n.current.fontColorBrown,
              ),
              ColorOption(
                colorHex: Colors.orange.toHex(),
                name: AppFlowyEditorL10n.current.fontColorOrange,
              ),
              ColorOption(
                colorHex: Colors.yellow.toHex(),
                name: AppFlowyEditorL10n.current.fontColorYellow,
              ),
              ColorOption(
                colorHex: Colors.green.toHex(),
                name: AppFlowyEditorL10n.current.fontColorGreen,
              ),
              ColorOption(
                colorHex: Colors.blue.toHex(),
                name: AppFlowyEditorL10n.current.fontColorBlue,
              ),
              ColorOption(
                colorHex: Colors.purple.toHex(),
                name: AppFlowyEditorL10n.current.fontColorPurple,
              ),
              ColorOption(
                colorHex: Colors.pink.toHex(),
                name: AppFlowyEditorL10n.current.fontColorPink,
              ),
              ColorOption(
                colorHex: Colors.red.toHex(),
                name: AppFlowyEditorL10n.current.fontColorRed,
              ),
            ],
            highlightColorOptions: [
              ColorOption(
                colorHex: Colors.transparent.toHex(),
                name: AppFlowyEditorL10n.current.backgroundColorDefault,
              ),
              ColorOption(
                colorHex: Colors.grey.toHex(),
                name: AppFlowyEditorL10n.current.backgroundColorGray,
              ),
              ColorOption(
                colorHex: Colors.brown.toHex(),
                name: AppFlowyEditorL10n.current.backgroundColorBrown,
              ),
              ColorOption(
                colorHex: Colors.orange.toHex(),
                name: AppFlowyEditorL10n.current.backgroundColorOrange,
              ),
              ColorOption(
                colorHex: Colors.yellow.toHex(),
                name: AppFlowyEditorL10n.current.backgroundColorYellow,
              ),
              ColorOption(
                colorHex: Colors.green.toHex(),
                name: AppFlowyEditorL10n.current.backgroundColorGreen,
              ),
              ColorOption(
                colorHex: Colors.blue.toHex(),
                name: AppFlowyEditorL10n.current.backgroundColorBlue,
              ),
              ColorOption(
                colorHex: Colors.purple.toHex(),
                name: AppFlowyEditorL10n.current.backgroundColorPurple,
              ),
              ColorOption(
                colorHex: Colors.pink.toHex(),
                name: AppFlowyEditorL10n.current.backgroundColorPink,
              ),
              ColorOption(
                colorHex: Colors.red.toHex(),
                name: AppFlowyEditorL10n.current.backgroundColorRed,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Overlay.of(context, rootOverlay: true).insert(overlay!);
}
