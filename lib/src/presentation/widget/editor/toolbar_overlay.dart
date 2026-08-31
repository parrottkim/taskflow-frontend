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

    final toolbarRevision = useState(0);

    useEffect(() {
      void updateToolbar() {
        // Text input advances the selection through transactions. Rebuilding
        // the toolbar for those updates causes unnecessary repainting while a
        // Web IME composition is active.
        if (editorState.selectionUpdateReason !=
            SelectionUpdateReason.transaction) {
          toolbarRevision.value++;
        }
      }

      editorState.selectionNotifier.addListener(updateToolbar);
      return () => editorState.selectionNotifier.removeListener(updateToolbar);
    }, [editorState]);

    // Register this build as a consumer of the revision.
    toolbarRevision.value;

    // 현재 상태를 직접 참조 (null이어도 상관 없음)
    final selection = editorState.selection;
    final node = selection != null
        ? editorState.getNodeAtPath(selection.start.path)
        : null;
    final nodes = selection != null
        ? editorState.getNodesInSelection(selection)
        : null;
    bool hasContent(Node selectedNode) =>
        selectedNode.delta?.toPlainText().trim().isNotEmpty ?? false;

    final textNodes =
        nodes?.where((selectedNode) => selectedNode.delta != null).toList() ??
        const <Node>[];
    final nonEmptyTextNodes = textNodes.where(hasContent).toList();

    String? textColorHex;
    String? highlightColorHex;

    final layerLink = useMemoized(() => LayerLink());
    final canFormatTextBlock = selection != null && textNodes.isNotEmpty;
    final canFormatHeading = selection != null && nonEmptyTextNodes.isNotEmpty;
    final canInsertImage = selection?.isCollapsed == true && node != null;

    ToolbarButton toolbarButton({
      required IconData icon,
      required VoidCallback? onTap,
      bool isHighlight = false,
    }) {
      return ToolbarButton(
        onTap: onTap == null
            ? null
            : () {
                onTap();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  toolbarRevision.value++;
                });
              },
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

    bool hasEveryTextBlock(
      String type, {
      Map<String, dynamic> attributes = const {},
      bool skipEmpty = false,
    }) {
      final targetNodes = skipEmpty ? nonEmptyTextNodes : textNodes;

      return targetNodes.isNotEmpty &&
          targetNodes.every(
            (selectedNode) =>
                selectedNode.type == type &&
                attributes.entries.every(
                  (entry) => selectedNode.attributes[entry.key] == entry.value,
                ),
          );
    }

    void formatTextBlock({
      required String type,
      Map<String, dynamic> attributes = const {},
      bool toggleToParagraph = true,
      bool skipEmpty = false,
    }) {
      final selection = editorState.selection;
      if (selection == null) return;

      final currentTextNodes = editorState
          .getNodesInSelection(selection)
          .where((selectedNode) => selectedNode.delta != null)
          .toList();
      final targetNodes = skipEmpty
          ? currentTextNodes.where(hasContent).toList()
          : currentTextNodes;
      if (targetNodes.isEmpty) return;

      final shouldToggleToParagraph =
          toggleToParagraph &&
          targetNodes.every(
            (selectedNode) =>
                selectedNode.type == type &&
                attributes.entries.every(
                  (entry) => selectedNode.attributes[entry.key] == entry.value,
                ),
          );
      final targetType = shouldToggleToParagraph
          ? ParagraphBlockKeys.type
          : type;
      final transaction = editorState.transaction;

      for (final selectedNode in targetNodes) {
        final formattedNode = selectedNode.copyWith(
          type: targetType,
          attributes: {
            if (targetType != ParagraphBlockKeys.type) ...attributes,
            blockComponentDelta: (selectedNode.delta ?? Delta()).toJson(),
            blockComponentBackgroundColor:
                selectedNode.attributes[blockComponentBackgroundColor],
            blockComponentTextDirection:
                selectedNode.attributes[blockComponentTextDirection],
            blockComponentAlign: selectedNode.attributes[blockComponentAlign],
          },
        );

        transaction
          ..insertNode(selectedNode.path, formattedNode)
          ..deleteNode(selectedNode);
      }

      transaction.afterSelection = transaction.beforeSelection;
      editorState.apply(transaction);
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
            border: Border.all(color: colorScheme.outline.subtle),
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
                      onTap: canFormatTextBlock
                          ? () => formatTextBlock(
                              type: ParagraphBlockKeys.type,
                              toggleToParagraph: false,
                            )
                          : null,
                      isHighlight: hasEveryTextBlock(ParagraphBlockKeys.type),
                      icon: Symbols.match_case_rounded,
                    ),
                    toolbarButton(
                      onTap: canFormatHeading
                          ? () => formatTextBlock(
                              type: HeadingBlockKeys.type,
                              attributes: {HeadingBlockKeys.level: 1},
                              skipEmpty: true,
                            )
                          : null,
                      icon: Symbols.format_h1_rounded,
                      isHighlight: hasEveryTextBlock(
                        HeadingBlockKeys.type,
                        attributes: {HeadingBlockKeys.level: 1},
                        skipEmpty: true,
                      ),
                    ),
                    toolbarButton(
                      onTap: canFormatHeading
                          ? () => formatTextBlock(
                              type: HeadingBlockKeys.type,
                              attributes: {HeadingBlockKeys.level: 2},
                              skipEmpty: true,
                            )
                          : null,
                      icon: Symbols.format_h2_rounded,
                      isHighlight: hasEveryTextBlock(
                        HeadingBlockKeys.type,
                        attributes: {HeadingBlockKeys.level: 2},
                        skipEmpty: true,
                      ),
                    ),
                    toolbarButton(
                      onTap: canFormatHeading
                          ? () => formatTextBlock(
                              type: HeadingBlockKeys.type,
                              attributes: {HeadingBlockKeys.level: 3},
                              skipEmpty: true,
                            )
                          : null,
                      icon: Symbols.format_h3_rounded,
                      isHighlight: hasEveryTextBlock(
                        HeadingBlockKeys.type,
                        attributes: {HeadingBlockKeys.level: 3},
                        skipEmpty: true,
                      ),
                    ),
                    divider(),
                    toolbarButton(
                      onTap: () {
                        if (editorState.selection == null) return;

                        editorState.toggleAttribute('bold');
                      },
                      icon: Symbols.format_bold_rounded,
                      isHighlight: hasEveryAttribute('bold'),
                    ),
                    toolbarButton(
                      onTap: () {
                        if (editorState.selection == null) return;

                        editorState.toggleAttribute('italic');
                      },
                      icon: Symbols.format_italic_rounded,
                      isHighlight: hasEveryAttribute('italic'),
                    ),
                    toolbarButton(
                      onTap: () {
                        if (editorState.selection == null) return;

                        editorState.toggleAttribute('underline');
                      },
                      icon: Symbols.format_underlined_rounded,
                      isHighlight: hasEveryAttribute('underline'),
                    ),
                    toolbarButton(
                      onTap: () {
                        if (editorState.selection == null) return;

                        editorState.toggleAttribute('strikethrough');
                      },
                      icon: Symbols.format_strikethrough_rounded,
                      isHighlight: hasEveryAttribute('strikethrough'),
                    ),
                    toolbarButton(
                      onTap: () {
                        if (editorState.selection == null) return;

                        editorState.toggleAttribute('code');
                      },
                      icon: Symbols.code_rounded,
                      isHighlight: hasEveryAttribute('code'),
                    ),
                    divider(),
                    toolbarButton(
                      onTap: canFormatTextBlock
                          ? () => formatTextBlock(
                              type: BulletedListBlockKeys.type,
                            )
                          : null,
                      icon: Symbols.format_list_bulleted_rounded,
                      isHighlight: hasEveryTextBlock(
                        BulletedListBlockKeys.type,
                      ),
                    ),
                    toolbarButton(
                      onTap: canFormatTextBlock
                          ? () => formatTextBlock(
                              type: NumberedListBlockKeys.type,
                            )
                          : null,
                      icon: Symbols.format_list_numbered_rounded,
                      isHighlight: hasEveryTextBlock(
                        NumberedListBlockKeys.type,
                      ),
                    ),
                    toolbarButton(
                      onTap: canFormatTextBlock
                          ? () => formatTextBlock(type: QuoteBlockKeys.type)
                          : null,
                      icon: Symbols.format_quote_rounded,
                      isHighlight: hasEveryTextBlock(QuoteBlockKeys.type),
                    ),
                    divider(),
                    toolbarButton(
                      onTap: () {
                        final currentSelection = editorState.selection;
                        if (currentSelection == null) return;

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
                              final currentSelection = editorState.selection;
                              if (currentSelection == null) return;

                              showLinkOverlay(
                                context,
                                editorState,
                                currentSelection,
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
                      onTap: canInsertImage ? onPickImage : null,
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
    // The scroll service resolves providers through its BuildContext. During
    // route teardown that context may already be deactivated, so stop the
    // state-owned auto scroller directly instead.
    editorState.autoScroller?.stopAutoScroll();
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
          globalPosition = null;
          editorState.scrollService?.stopAutoScroll();
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
          editorState.scrollService?.stopAutoScroll();
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
          globalPosition = null;
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
  final color = Theme.of(context).colorScheme.primary.muted;

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
