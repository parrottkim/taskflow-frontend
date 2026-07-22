part of '../widget.dart';

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

    final deleteImageCommand = CommandShortcutEvent(
      key: 'delete_image_with_backspace',
      command: 'backspace, shift+backspace',
      getDescription: () => '',
      handler: (editorState) {
        final selection = editorState.selection;
        if (selection == null || !selection.isCollapsed) {
          return KeyEventResult.ignored;
        }

        final currentNode = editorState.getNodeAtPath(selection.start.path);
        if (currentNode == null) {
          return KeyEventResult.ignored;
        }

        final imageNode = currentNode.type == ImageBlockKeys.type
            ? currentNode
            : selection.start.offset == 0 &&
                  currentNode.previous?.type == ImageBlockKeys.type
            ? currentNode.previous
            : null;
        if (imageNode == null) {
          return KeyEventResult.ignored;
        }

        final imagePath = imageNode.path;
        final nextNode = imageNode.next;
        final previousNode = imageNode.previous;
        final transaction = editorState.transaction..deleteNode(imageNode);

        if (currentNode != imageNode || nextNode != null) {
          transaction.afterSelection = Selection.collapsed(
            Position(path: imagePath, offset: 0),
          );
        } else if (previousNode?.delta != null) {
          transaction.afterSelection = Selection.collapsed(
            Position(
              path: previousNode!.path,
              offset: previousNode.delta!.length,
            ),
          );
        } else {
          transaction
            ..insertNode(imagePath, paragraphNode())
            ..afterSelection = Selection.collapsed(
              Position(path: imagePath, offset: 0),
            );
        }

        editorState.apply(transaction);
        return KeyEventResult.handled;
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
                      deleteImageCommand,
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
