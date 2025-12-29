part of 'widget.dart';

class SuperEditorView extends HookWidget {
  final Editor editor;
  final Document document;
  final DocumentComposer composer;
  final List<ComponentBuilder>? componentBuilders;
  final Future<void> Function(SuperEditorContext editContext)? onPaste;
  final void Function(SuperEditorContext editContext)? onEvent;

  const SuperEditorView({
    super.key,
    required this.editor,
    required this.document,
    required this.composer,
    this.componentBuilders,
    this.onPaste,
    this.onEvent,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SuperEditor(
      editor: editor,
      inputSource: TextInputSource.ime,
      selectionStyle: SelectionStyles(
        selectionColor: colorScheme.tertiaryContainer.withValues(alpha: 0.5),
      ),
      imePolicies: SuperEditorImePolicies(
        openImeOnNonPrimaryFocusGain: false,
        closeImeOnNonPrimaryFocusLost: false,
      ),
      documentOverlayBuilders: [
        DefaultCaretOverlayBuilder(
          caretStyle: const CaretStyle(),
        ),
      ],
      stylesheet: defaultStylesheet.copyWith(
        inlineWidgetBuilders: [inlineWidgetBuilder],
        addRulesBefore: [
          StyleRule(
            BlockSelector.all,
            (doc, node) => {
              Styles.textStyle: TextStyle(
                fontFamily: 'Pretendard',
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Styles.padding: const CascadingPadding.only(top: 12.0),
            },
          ),
        ],
        addRulesAfter: [
          StyleRule(
            BlockSelector.all,
            (doc, node) => {
              Styles.textStyle: TextStyle(
                fontFamily: 'Pretendard',
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Styles.padding: const CascadingPadding.only(top: 12.0),
            },
          ),
        ],
      ),
      keyboardActions: [
        (
            {required SuperEditorContext editContext,
            required KeyEvent keyEvent}) {
          if (keyEvent is KeyDownEvent) {
            final isMac = defaultTargetPlatform == TargetPlatform.macOS;
            final isCmd = HardwareKeyboard.instance.isMetaPressed;
            final isCtrl = HardwareKeyboard.instance.isControlPressed;

            if ((isMac && isCmd || !isMac && isCtrl) &&
                keyEvent.logicalKey == LogicalKeyboardKey.keyV) {
              if (onPaste != null) {
                onPaste!(editContext);
                return ExecutionInstruction.haltExecution;
              }
            }
          }

          if (keyEvent is KeyUpEvent) {
            if (onEvent != null) onEvent!(editContext);
          }

          return ExecutionInstruction.continueExecution;
        },
        ...defaultImeKeyboardActions,
      ],
      componentBuilders: componentBuilders ?? defaultComponentBuilders,
    );
  }

  Widget? inlineWidgetBuilder(
      BuildContext context, TextStyle textStyle, Object placeholder) {
    if (placeholder is! Placeholder) {
      return null;
    }

    return Skeletonizer(
      child: Container(
        width: double.infinity,
        height: 300.0,
        color: Colors.red,
      ),
    );
  }
}

class ToolbarOverlayWidget extends HookWidget {
  final Editor editor;
  final Document document;
  final DocumentComposer composer;
  final GlobalKey toolbarKey;
  final GlobalKey overlayKey;
  final LeaderLink toolbarLink;
  final LeaderLink overlayLink;
  final OverlayPortalController linkOverlayController;
  final OverlayPortalController imageOverlayController;

  const ToolbarOverlayWidget({
    super.key,
    required this.editor,
    required this.document,
    required this.composer,
    required this.toolbarKey,
    required this.overlayKey,
    required this.toolbarLink,
    required this.overlayLink,
    required this.linkOverlayController,
    required this.imageOverlayController,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final boundary = WidgetFollowerBoundary(
      boundaryKey: toolbarKey,
      devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
    );

    final hasHistory = useState(editor.history.isNotEmpty);
    final hasFuture = useState(editor.future.isNotEmpty);

    useEffect(() {
      document.addListener((DocumentChangeLog event) {
        hasHistory.value = editor.history.isNotEmpty;
        hasFuture.value = editor.future.isNotEmpty;
      });

      return null;
    }, [document]);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 48.0,
      ),
      child: Follower.withOffset(
        link: toolbarLink,
        boundary: boundary,
        leaderAnchor: Alignment.topCenter,
        followerAnchor: Alignment.bottomCenter,
        repaintWhenLeaderChanges: true,
        child: Leader(
          link: overlayLink,
          child: Container(
            key: overlayKey,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              border: Border.all(
                color: colorScheme.surfaceContainerLow,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
                color: colorScheme.surfaceBright,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(right: 32.0),
                scrollDirection: Axis.horizontal,
                child: IntrinsicHeight(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ToolbarButton(
                          onTap: editor.history.isNotEmpty
                              ? () {
                                  editor.undo();
                                }
                              : null,
                          icon: Symbols.undo_rounded,
                        ),
                        ToolbarButton(
                          onTap: editor.future.isNotEmpty
                              ? () {
                                  editor.redo();
                                }
                              : null,
                          icon: Symbols.redo_rounded,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: VerticalDivider(),
                        ),
                        ToolbarButton(
                          onTap: () {
                            final selection = composer.selection;

                            if (selection == null) return;
                            if (selection.isCollapsed) return;

                            final selectedNode =
                                document.getNodeById(selection.extent.nodeId);
                            final type =
                                selectedNode?.getMetadataValue('blockType');

                            if (type == blockquoteAttribution) {
                              editor.execute([
                                ChangeParagraphBlockTypeRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                  blockType: paragraphAttribution,
                                ),
                              ]);
                            }

                            editor.execute([
                              ToggleTextAttributionsRequest(
                                documentRange: composer.selection!,
                                attributions: {boldAttribution},
                              ),
                            ]);
                          },
                          icon: Symbols.format_bold_rounded,
                        ),
                        ToolbarButton(
                          onTap: () {
                            final selection = composer.selection;

                            if (selection == null) return;
                            if (selection.isCollapsed) return;

                            final selectedNode =
                                document.getNodeById(selection.extent.nodeId);
                            final type =
                                selectedNode?.getMetadataValue('blockType');

                            if (type == blockquoteAttribution) {
                              editor.execute([
                                ChangeParagraphBlockTypeRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                  blockType: paragraphAttribution,
                                ),
                              ]);
                            }

                            editor.execute([
                              ToggleTextAttributionsRequest(
                                documentRange: composer.selection!,
                                attributions: {italicsAttribution},
                              ),
                            ]);
                          },
                          icon: Symbols.format_italic_rounded,
                        ),
                        ToolbarButton(
                          onTap: () {
                            final selectedNode = document
                                .getNodeById(composer.selection!.extent.nodeId);
                            final type =
                                selectedNode?.getMetadataValue('blockType');

                            if (selectedNode is ListItemNode) {
                              editor.execute([
                                ConvertListItemToParagraphRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                  paragraphMetadata: {
                                    'blockType': header3Attribution,
                                  },
                                ),
                              ]);
                              return;
                            }

                            if (selectedNode is TaskNode) {
                              editor.execute([
                                ConvertTaskToParagraphRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                  paragraphMetadata: {
                                    'blockType': header3Attribution,
                                  },
                                ),
                              ]);
                            }

                            Attribution? attribution;

                            if (type == paragraphAttribution) {
                              attribution = header3Attribution;
                            } else if (type == header3Attribution) {
                              attribution = header2Attribution;
                            } else if (type == header2Attribution) {
                              attribution = header1Attribution;
                            } else if (type == header1Attribution) {
                              attribution = paragraphAttribution;
                            } else if (type == blockquoteAttribution) {
                              attribution = paragraphAttribution;
                            } else {
                              attribution = null;
                            }

                            editor.execute([
                              ChangeParagraphBlockTypeRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                blockType: attribution,
                              ),
                            ]);
                          },
                          icon: Symbols.format_size_rounded,
                        ),
                        ToolbarButton(
                          onTap: () {
                            final selection = composer.selection;

                            if (selection == null) return;
                            if (selection.isCollapsed) return;

                            final selectedNode =
                                document.getNodeById(selection.extent.nodeId);
                            final type =
                                selectedNode?.getMetadataValue('blockType');

                            if (type == blockquoteAttribution) {
                              editor.execute([
                                ChangeParagraphBlockTypeRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                  blockType: paragraphAttribution,
                                ),
                              ]);
                            }

                            editor.execute([
                              ToggleTextAttributionsRequest(
                                documentRange: composer.selection!,
                                attributions: {strikethroughAttribution},
                              ),
                            ]);
                          },
                          icon: Symbols.strikethrough_s_rounded,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: VerticalDivider(),
                        ),
                        ToolbarButton(
                          onTap: () {
                            final selectedNode = document
                                .getNodeById(composer.selection!.extent.nodeId);

                            if (selectedNode is TaskNode) {
                              editor.execute([
                                ConvertTaskToParagraphRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                ),
                              ]);
                            }

                            EditRequest? request;

                            if (selectedNode is ListItemNode) {
                              switch (selectedNode.type) {
                                case ListItemType.ordered:
                                  request = ChangeListItemTypeRequest(
                                    nodeId: composer.selection!.extent.nodeId,
                                    newType: ListItemType.unordered,
                                  );
                                  break;
                                case ListItemType.unordered:
                                  request = ConvertListItemToParagraphRequest(
                                    nodeId: composer.selection!.extent.nodeId,
                                  );
                                  break;
                              }
                            } else {
                              request = ConvertParagraphToListItemRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                type: ListItemType.unordered,
                              );
                            }

                            editor.execute([request]);
                          },
                          icon: Symbols.format_list_bulleted_rounded,
                        ),
                        ToolbarButton(
                          onTap: () {
                            final selectedNode = document
                                .getNodeById(composer.selection!.extent.nodeId);

                            if (selectedNode is TaskNode) {
                              editor.execute([
                                ConvertTaskToParagraphRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                ),
                              ]);
                            }

                            EditRequest? request;

                            if (selectedNode is ListItemNode) {
                              switch (selectedNode.type) {
                                case ListItemType.unordered:
                                  request = ChangeListItemTypeRequest(
                                    nodeId: composer.selection!.extent.nodeId,
                                    newType: ListItemType.ordered,
                                  );
                                  break;
                                case ListItemType.ordered:
                                  request = ConvertListItemToParagraphRequest(
                                    nodeId: composer.selection!.extent.nodeId,
                                  );
                                  break;
                              }
                            } else {
                              request = ConvertParagraphToListItemRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                type: ListItemType.ordered,
                              );
                            }

                            editor.execute([request]);
                          },
                          icon: Symbols.format_list_numbered_rounded,
                        ),
                        ToolbarButton(
                          onTap: () {
                            final selectedNode = document
                                .getNodeById(composer.selection!.extent.nodeId);

                            if (selectedNode is ListItemNode) {
                              editor.execute([
                                ConvertListItemToParagraphRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                )
                              ]);
                            }

                            EditRequest? request;

                            if (selectedNode is TaskNode) {
                              request = ConvertTaskToParagraphRequest(
                                nodeId: composer.selection!.extent.nodeId,
                              );
                            } else {
                              request = ConvertParagraphToTaskRequest(
                                nodeId: composer.selection!.extent.nodeId,
                              );
                            }

                            editor.execute([request]);
                          },
                          icon: Symbols.checklist_rounded,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: VerticalDivider(),
                        ),
                        ToolbarButton(
                          onTap: () {
                            final selection = composer.selection;

                            if (selection == null) return;
                            if (selection.isCollapsed) return;

                            final selectedNode =
                                document.getNodeById(selection.extent.nodeId);
                            final type =
                                selectedNode?.getMetadataValue('blockType');

                            if (selectedNode is ListItemNode) {
                              editor.execute([
                                ConvertListItemToParagraphRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                  paragraphMetadata: {
                                    'blockType': blockquoteAttribution,
                                  },
                                ),
                              ]);
                              return;
                            }

                            if (selectedNode is TaskNode) {
                              editor.execute([
                                ConvertTaskToParagraphRequest(
                                  nodeId: composer.selection!.extent.nodeId,
                                  paragraphMetadata: {
                                    'blockType': blockquoteAttribution,
                                  },
                                ),
                              ]);
                            }

                            Attribution? attribution;

                            if (type == blockquoteAttribution) {
                              attribution = paragraphAttribution;
                            } else {
                              attribution = blockquoteAttribution;
                            }

                            editor.execute([
                              ChangeParagraphBlockTypeRequest(
                                nodeId: composer.selection!.extent.nodeId,
                                blockType: attribution,
                              ),
                            ]);
                          },
                          icon: Symbols.format_quote_rounded,
                        ),
                        ToolbarButton(
                          onTap: null,
                          icon: Symbols.code_rounded,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: VerticalDivider(),
                        ),
                        ToolbarButton(
                          onTap: () {
                            final selection = composer.selection;
                            if (selection == null) return;

                            final selectedNode = document
                                .getNodeById(composer.selection!.extent.nodeId);
                            if (selectedNode is! ParagraphNode) return;

                            final startOffset = (selection.base.nodePosition
                                    as TextNodePosition)
                                .offset;
                            final endOffset =
                                (selection.end.nodePosition as TextNodePosition)
                                    .offset;

                            if (endOffset - startOffset == 0) return;

                            linkOverlayController.toggle();
                            imageOverlayController.hide();
                          },
                          icon: Symbols.link_rounded,
                        ),
                        ToolbarButton(
                          onTap: () {
                            imageOverlayController.toggle();
                            linkOverlayController.hide();
                          },
                          icon: Symbols.image_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LinkOverlayWidget extends HookWidget {
  final Editor editor;
  final Document document;
  final DocumentComposer composer;
  final GlobalKey overlayKey;
  final LeaderLink link;
  final OverlayPortalController linkOverlayController;

  const LinkOverlayWidget({
    super.key,
    required this.editor,
    required this.document,
    required this.composer,
    required this.overlayKey,
    required this.link,
    required this.linkOverlayController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final urlController = useTextEditingController();
    final titleController = useTextEditingController();

    final urlFocus = useFocusNode();
    final titleFocus = useFocusNode();

    useEffect(() {
      if (linkOverlayController.isShowing) {
        urlFocus.requestFocus();

        if (composer.selection == null) return;

        final selection = composer.selection!;
        final baseOffset = (selection.base.nodePosition as TextPosition).offset;
        final extentOffset =
            (selection.extent.nodePosition as TextPosition).offset;
        final start = min(baseOffset, extentOffset);
        final end = max(baseOffset, extentOffset);

        final nodeId = selection.extent.nodeId;
        final node = document.getNodeById(nodeId);
        if (node is! TextNode) return null;

        final attributedText = node.text;
        titleController.text = attributedText.toPlainText();

        final spans = attributedText.getAttributionSpansInRange(
          attributionFilter: (attr) => attr is LinkAttribution,
          range: SpanRange(start, end - 1), // end-1 은 exclusive 보정
        );

        if (spans.isNotEmpty) {
          final linkAttr = spans.first.attribution as LinkAttribution;
          final uri = linkAttr.plainTextUri; // LinkAttribution 의 uri 프로퍼티

          urlController.text = uri;
        }
      }
      return null;
    }, [linkOverlayController]);

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => linkOverlayController.hide(),
            child: const SizedBox.expand(), // 투명한 배경
          ),
        ),
        Follower.withOffset(
          link: link,
          leaderAnchor: Alignment.bottomCenter,
          followerAnchor: Alignment.topCenter,
          repaintWhenLeaderChanges: true,
          child: Material(
            elevation: 1.0,
            color: Theme.of(context).colorScheme.surfaceBright,
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: 320.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Intl.message('issue_form_link_1'),
                    style: textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4.0),
                  TextField(
                    focusNode: urlFocus,
                    controller: urlController,
                    style: textTheme.bodySmall,
                    decoration: InputDecoration(
                      filled: true,
                    ),
                    onSubmitted: (value) => titleFocus.requestFocus(),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    Intl.message('issue_form_link_2'),
                    style: textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4.0),
                  TextField(
                    focusNode: titleFocus,
                    controller: titleController,
                    style: textTheme.bodySmall,
                    decoration: InputDecoration(
                      filled: true,
                    ),
                    onSubmitted: (value) {
                      final url = Uri.tryParse(urlController.text.trim());

                      if (url == null) return;

                      final selection = composer.selection!;
                      final nodeId = selection.extent.nodeId;

                      final baseOffset =
                          (selection.base.nodePosition as TextNodePosition)
                              .offset;
                      final extentOffset =
                          (selection.extent.nodePosition as TextNodePosition)
                              .offset;

                      final start =
                          baseOffset < extentOffset ? baseOffset : extentOffset;
                      final end =
                          baseOffset > extentOffset ? baseOffset : extentOffset;

                      final newText = titleController.text;

                      final rawUrl = urlController.text.trim();
                      final linkUrl = Uri.tryParse(rawUrl);
                      if (linkUrl == null) {
                        return;
                      }
                      final linkAttribution = LinkAttribution.fromUri(linkUrl);

                      editor.execute([
                        DeleteContentRequest(
                          documentRange: DocumentRange(
                            start: DocumentPosition(
                                nodeId: nodeId,
                                nodePosition: TextNodePosition(offset: start)),
                            end: DocumentPosition(
                                nodeId: nodeId,
                                nodePosition: TextNodePosition(offset: end)),
                          ),
                        ),
                        InsertTextRequest(
                          documentPosition: DocumentPosition(
                              nodeId: nodeId,
                              nodePosition: TextNodePosition(offset: start)),
                          textToInsert: newText,
                          attributions: {linkAttribution},
                        ),
                      ]);

                      linkOverlayController.hide();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageOverlayWidget extends StatelessWidget {
  final Editor editor;
  final Document document;
  final DocumentComposer composer;
  final GlobalKey overlayKey;
  final LeaderLink link;
  final OverlayPortalController imageOverlayController;

  const ImageOverlayWidget({
    super.key,
    required this.editor,
    required this.document,
    required this.composer,
    required this.overlayKey,
    required this.link,
    required this.imageOverlayController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final userAgent = window.navigator.userAgent.toLowerCase();
    final isMobile = userAgent.contains('android') ||
        userAgent.contains('iphone') ||
        userAgent.contains('ipad') ||
        userAgent.contains('mobile');

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => imageOverlayController.hide(),
            child: const SizedBox.expand(), // 투명한 배경
          ),
        ),
        Follower.withOffset(
          link: link,
          leaderAnchor: Alignment.bottomCenter,
          followerAnchor: Alignment.topCenter,
          repaintWhenLeaderChanges: true,
          child: Material(
            elevation: 1.0,
            color: Theme.of(context).colorScheme.surfaceBright,
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: 320.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Intl.message('issue_form_image_1'),
                    style: textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4.0),
                  if (!isMobile)
                    _DesktopWidget(
                      editor: editor,
                      imageOverlayController: imageOverlayController,
                    )
                  else
                    _MobileWidget(
                      editor: editor,
                      imageOverlayController: imageOverlayController,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final Editor editor;
  final OverlayPortalController imageOverlayController;

  const _DesktopWidget({
    required this.editor,
    required this.imageOverlayController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final maxImageSize = Functions(context).maxImageSize;

    final dragged = useState(false);

    Future<void> processFiles(List<XFile> files) async {
      LoadingOverlay.show(context);

      try {
        for (var file in files) {
          final bytes = await file.readAsBytes();
          final mimeType = lookupMimeType(file.path, headerBytes: bytes);

          if (mimeType == null || !mimeType.startsWith('image/')) {
            ref.read(toastProvider).showToast(
                  child: Toast(
                    type: ToastType.alert,
                    message: Intl.message(
                      'issue_form_image_invalid',
                      args: [file.name],
                    ),
                  ),
                );
            continue; // 유효하지 않은 포맷이므로 다음 파일로 넘어감
          }

          if (await file.length() > maxImageSize) {
            ref.read(toastProvider).showToast(
                  child: Toast(
                    type: ToastType.alert,
                    message: Intl.message(
                      'issue_form_file_size_limit',
                      args: [file.name, maxImageSize ~/ (1024 * 1024)],
                    ),
                  ),
                );
            continue;
          }

          final base64Data = base64Encode(bytes);
          final dataUrl = 'data:$mimeType;base64,$base64Data';

          final imageNode = ImageNode(
            id: Editor.createNodeId(),
            imageUrl: dataUrl,
          );

          editor.execute([
            InsertNodeAtCaretRequest(
              node: imageNode,
            ),
          ]);
        }
      } finally {
        LoadingOverlay.hide();
        imageOverlayController.hide();
      }
    }

    return DropTarget(
      onDragDone: (details) async {
        await processFiles(details.files);
      },
      onDragEntered: (details) => dragged.value = true,
      onDragExited: (details) => dragged.value = false,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInQuad,
        padding: EdgeInsets.symmetric(vertical: 24.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: dragged.value
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)
                : Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          color: dragged.value
              ? Theme.of(context)
                  .colorScheme
                  .tertiaryContainer
                  .withValues(alpha: 0.5)
              : Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    Symbols.photo_prints_rounded,
                    size: 32.0,
                    color: colorScheme.primary,
                  ),
                ),
                Positioned(
                  bottom: 4.0,
                  right: 4.0,
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: colorScheme.primary,
                    ),
                    child: Icon(
                      Symbols.upload_rounded,
                      size: 12.0,
                      weight: 600.0,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(
              Intl.message('issue_form_image_drop'),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () async {
                const XTypeGroup group = XTypeGroup(mimeTypes: ['image/*']);

                final List<XFile> files = await openFiles(
                  acceptedTypeGroups: <XTypeGroup>[group],
                );

                await processFiles(files);
              },
              child: Text(
                Intl.message('issue_form_image_upload'),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileWidget extends ConsumerWidget {
  final Editor editor;
  final OverlayPortalController imageOverlayController;

  const _MobileWidget({
    required this.editor,
    required this.imageOverlayController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxImageSize = Functions(context).maxImageSize;

    return Center(
      child: SizedBox(
        width: double.infinity,
        child: WebFileSelector(
          onData: WebFileSelector.isIOSWeb
              ? (files) async {
                  LoadingOverlay.show(context);

                  for (var file in files) {
                    final mimeType = file.mimeType;

                    if (mimeType == null || !mimeType.startsWith('image/')) {
                      ref.read(toastProvider).showToast(
                            child: Toast(
                              type: ToastType.alert,
                              message: Intl.message(
                                'issue_form_image_invalid',
                                args: [file.name],
                              ),
                            ),
                          );
                      continue; // 유효하지 않은 포맷이므로 다음 파일로 넘어감
                    }

                    if (await file.length() > maxImageSize) {
                      ref.read(toastProvider).showToast(
                            child: Toast(
                              type: ToastType.alert,
                              message: Intl.message(
                                'issue_form_file_size_limit',
                                args: [
                                  file.name,
                                  maxImageSize ~/ (1024 * 1024)
                                ],
                              ),
                            ),
                          );
                      continue;
                    }

                    final bytes = await file.readAsBytes();

                    final base64Data = base64Encode(bytes);
                    final dataUrl = 'data:$mimeType;base64,$base64Data';

                    final imageNode = ImageNode(
                      id: Editor.createNodeId(),
                      imageUrl: dataUrl,
                    );

                    editor.execute([
                      InsertNodeAtCaretRequest(
                        node: imageNode,
                      ),
                    ]);
                  }

                  LoadingOverlay.hide();
                  imageOverlayController.hide();
                }
              : null,
          accept: 'image/*',
          multiple: true,
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                if (WebFileSelector.isIOSWeb) return;

                const XTypeGroup group = XTypeGroup(mimeTypes: ['image/*']);

                final List<XFile> files = await openFiles(
                  acceptedTypeGroups: <XTypeGroup>[group],
                );

                for (var file in files) {
                  final bytes = await file.readAsBytes();
                  final mimeType =
                      lookupMimeType(file.path, headerBytes: bytes);

                  if (mimeType == null) return;

                  final base64Data = base64Encode(bytes);
                  final dataUrl = 'data:$mimeType;base64,$base64Data';

                  final imageNode = ImageNode(
                    id: Editor.createNodeId(),
                    imageUrl: dataUrl,
                  );

                  editor.execute([
                    InsertNodeAtCaretRequest(
                      node: imageNode,
                    ),
                  ]);
                }
              },
              icon: Icon(Symbols.drive_folder_upload_rounded),
              label: Text(
                Intl.message('issue_form_image_2'),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBlockquoteComponentBuilder implements ComponentBuilder {
  const CustomBlockquoteComponentBuilder();

  @override
  SingleColumnLayoutComponentViewModel? createViewModel(
    Document document,
    DocumentNode node,
  ) {
    if (node is! ParagraphNode) return null;

    final blockType = node.getMetadataValue('blockType');
    if (blockType != blockquoteAttribution) return null;

    return BlockquoteComponentViewModel(
      text: node.text,
      textStyleBuilder: (attributions) => defaultStyleBuilder(attributions),
      nodeId: node.id,
      // 실제 selectionColor/backgroundColor/borderRadius는 createComponent에서 사용하므로
      // 여기에선 기본값만 주셔도 됩니다.
      selectionColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
    );
  }

  @override
  Widget? createComponent(
    SingleColumnDocumentComponentContext componentContext,
    SingleColumnLayoutComponentViewModel componentViewModel,
  ) {
    if (componentViewModel is! BlockquoteComponentViewModel) return null;

    final theme = Theme.of(componentContext.context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4,
              color: colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextComponent(
                  key: componentContext.componentKey,
                  text: componentViewModel.text,
                  textStyleBuilder: (attributions) =>
                      textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  textDirection: componentViewModel.textDirection,
                  textAlign: componentViewModel.textAlignment,
                  textSelection: componentViewModel.selection,
                  selectionColor:
                      colorScheme.tertiaryContainer.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTaskComponentBuilder implements ComponentBuilder {
  const CustomTaskComponentBuilder(this.editor);

  final Editor editor;

  @override
  SingleColumnLayoutComponentViewModel? createViewModel(
    Document document,
    DocumentNode node,
  ) {
    if (node is! TaskNode) return null;

    return TaskComponentViewModel(
      nodeId: node.id,
      padding: EdgeInsets.zero,
      isComplete: node.isComplete,
      setComplete: (value) {
        editor.execute(
            [ChangeTaskCompletionRequest(nodeId: node.id, isComplete: value)]);
      },
      text: node.text,
      textStyleBuilder: (attributions) => defaultStyleBuilder(attributions),
      selectionColor: Colors.transparent,
    );
  }

  @override
  Widget? createComponent(SingleColumnDocumentComponentContext componentContext,
      SingleColumnLayoutComponentViewModel componentViewModel) {
    if (componentViewModel is! TaskComponentViewModel) return null;

    final theme = Theme.of(componentContext.context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        SizedBox(
          width: componentViewModel.indentCalculator(
            componentViewModel.textStyleBuilder({}),
            componentViewModel.indent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 4.0),
          child: CustomToggleButton(
            value: componentViewModel.isComplete,
            onChanged: (value) =>
                componentViewModel.setComplete!(value ?? false),
          ),
        ),
        Expanded(
          child: TextComponent(
            key: componentContext.componentKey,
            text: componentViewModel.text,
            textStyleBuilder: componentViewModel.textStyleBuilder,
            textSelection: componentViewModel.selection,
            selectionColor:
                colorScheme.tertiaryContainer.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
