part of 'widget.dart';

class EditorWidget extends HookConsumerWidget {
  final EditorState editorState;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;

  const EditorWidget({
    super.key,
    required this.editorState,
    this.maxWidth = 600.0,
    this.minHeight = 240.0,
    this.maxHeight = 400.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final maxImageSize = Functions(context).maxImageSize;

    final editorScrollController = useMemoized(
      () => EditorScrollController(editorState: editorState, shrinkWrap: true),
    );

    Future<void> insertImageBytes(Uint8List bytes) async {
      if (bytes.lengthInBytes > maxImageSize) {
        final image = img.decodeImage(bytes);

        if (image != null) {
          final resized = img.copyResize(image, width: 960);

          bytes = Uint8List.fromList(img.encodeJpg(resized, quality: 80));
        }
      }

      final base64Data = base64Encode(bytes);

      final selection = editorState.selection;
      if (selection == null || !selection.isCollapsed) {
        return;
      }
      final node = editorState.getNodeAtPath(selection.end.path);
      if (node == null) {
        return;
      }

      final transaction = editorState.transaction;

      transaction.beforeSelection = selection;

      final imagePath =
          node.type == ParagraphBlockKeys.type && (node.delta?.isEmpty ?? false)
          ? node.path
          : node.path.next;

      transaction.insertNode(imagePath, imageNode(url: base64Data));

      if (node.type == ParagraphBlockKeys.type &&
          (node.delta?.isEmpty ?? false)) {
        transaction.deleteNode(node);
      }

      final newLinePath = imagePath.next;
      transaction.insertNode(newLinePath, paragraphNode());

      transaction.afterSelection = Selection.collapsed(
        Position(path: newLinePath, offset: 0),
      );

      await editorState.apply(transaction);
    }

    Future<void> handleImagePaste() async {
      final clipboard = SystemClipboard.instance;
      if (clipboard == null) return;

      final reader = await clipboard.read();

      // 이미지가 있는지 확인
      ImageExtension? image;
      for (final e in ImageExtension.values) {
        if (reader.canProvide(e.format)) {
          image = e;
          break;
        }
      }

      // 이미지가 없으면 그냥 종료 (기본 텍스트 붙여넣기는 이미 ignored를 통해 실행됨)
      if (image == null) return;

      // 이미지 처리 로직 실행... (기존에 작성하신 로직)
      reader.getFile(image.format, (file) async {
        try {
          final stream = file.getStream();

          final completer = Completer<Uint8List>();
          final chunks = <int>[];

          stream.listen(
            (chunk) => chunks.addAll(chunk),
            onDone: () => completer.complete(Uint8List.fromList(chunks)),
            onError: completer.completeError,
            cancelOnError: true,
          );

          await insertImageBytes(await completer.future);
        } catch (e) {
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.alert,
                  message: Intl.message('error_clipboard_image_paste'),
                ),
              );
        }
      });
    }

    Future<void> pickAndInsertImage() async {
      try {
        final file = await openFile(
          acceptedTypeGroups: [
            XTypeGroup(
              label: 'Images',
              extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
              mimeTypes: ['image/*'],
            ),
          ],
        );
        if (file == null) return;

        await insertImageBytes(await file.readAsBytes());
      } catch (_) {
        ref
            .read(toastProvider)
            .showToast(
              child: Toast(
                type: ToastType.alert,
                message: Intl.message('error_clipboard_image_paste'),
              ),
            );
      }
    }

    final pasteImageCommand = CommandShortcutEvent(
      key: 'paste_image',
      command: 'ctrl+v',
      macOSCommand: 'cmd+v',
      getDescription: () => '',
      handler: (editorState) {
        handleImagePaste();

        return KeyEventResult.ignored;
      },
    );

    // BlockComponentBuilders 설정
    final blockComponentBuilders = useMemoized(() {
      final map = {...standardBlockComponentBuilderMap};

      map.forEach((key, value) {
        value.showActions = (_) => true;
        value.actionBuilder = (context, actionState) {
          return DragToReorderAction(
            blockComponentContext: context,
            builder: value,
          );
        };
      });
      return map;
    });

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerWidget(
              constraints: BoxConstraints(
                maxWidth: maxWidth,
                minHeight: minHeight,
                maxHeight: maxHeight,
              ),
              borderRadius: BorderRadius.circular(8.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Focus(
                  onKeyEvent: (node, event) {
                    // Check if the key pressed is Space
                    if (event.logicalKey == LogicalKeyboardKey.space) {
                      // Return handled to prevent further propagation to the scroll view
                      return KeyEventResult.skipRemainingHandlers;
                    }
                    return KeyEventResult.ignored;
                  },

                  child: AppFlowyEditor(
                    shrinkWrap: true,
                    editorState: editorState,
                    blockComponentBuilders: blockComponentBuilders,
                    commandShortcutEvents: [
                      pasteImageCommand,
                      ...standardCommandShortcutEvents,
                    ],
                    editorScrollController: editorScrollController,
                    editorStyle: EditorStyle.desktop(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      textStyleConfiguration: TextStyleConfiguration(
                        text: textTheme.bodyLarge!,
                        code: textTheme.bodyMedium!.copyWith(
                          fontFamily: 'SpaceMono',
                          color: colorScheme.error,
                        ),
                        bold: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    dropTargetStyle: const AppFlowyDropTargetStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ToolbarOverlayWidget(
          editorState: editorState,
          onPickImage: pickAndInsertImage,
          maxWidth: maxWidth,
        ),
      ],
    );
  }
}

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
