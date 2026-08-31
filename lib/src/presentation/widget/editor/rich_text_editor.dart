part of '../widget.dart';

class RichTextEditor extends HookConsumerWidget {
  final EditorState editorState;
  final ValueChanged<String>? onChanged;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;

  const RichTextEditor({
    super.key,
    required this.editorState,
    this.onChanged,
    this.maxWidth = 600.0,
    this.minHeight = 240.0,
    this.maxHeight = 400.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final maxImageSize = Functions(context).maxImageSize;
    final imagePasteArmed = useRef(false);
    final imagePasteArmTimer = useRef<Timer?>(null);
    final imagePasteSelection = useRef<Selection?>(null);

    final editorScrollController = useMemoized(
      () => EditorScrollController(editorState: editorState, shrinkWrap: true),
      [editorState],
    );

    Future<void> insertImageBytes(
      Uint8List bytes, {
      Selection? selection,
    }) async {
      if (bytes.lengthInBytes > maxImageSize) {
        final image = img.decodeImage(bytes);

        if (image != null) {
          final resized = img.copyResize(image, width: 960);

          bytes = Uint8List.fromList(img.encodeJpg(resized, quality: 80));
        }
      }

      final base64Data = base64Encode(bytes);

      final targetSelection = selection ?? editorState.selection;
      if (targetSelection == null || !targetSelection.isCollapsed) {
        return;
      }
      final node = editorState.getNodeAtPath(targetSelection.end.path);
      if (node == null) {
        return;
      }

      final transaction = editorState.transaction;
      final delta = node.delta;

      transaction.beforeSelection = targetSelection;

      if (delta != null) {
        final offset = targetSelection.end.offset.clamp(0, delta.length);
        final before = delta.slice(0, offset);
        final after = delta.slice(offset, delta.length);
        final imagePath = before.isEmpty ? node.path : node.path.next;
        final afterPath = imagePath.next;
        final nodes = [
          if (before.isNotEmpty)
            node.copyWith(
              attributes: {
                ...node.attributes,
                ParagraphBlockKeys.delta: before.toJson(),
              },
              children: const [],
            ),
          imageNode(url: base64Data),
          after.isEmpty
              ? paragraphNode()
              : node.copyWith(
                  attributes: {
                    ...node.attributes,
                    ParagraphBlockKeys.delta: after.toJson(),
                  },
                  children: node.children.map((child) => child.deepCopy()),
                ),
        ];

        transaction
          ..insertNodes(node.path, nodes)
          ..deleteNode(node)
          ..afterSelection = Selection.collapsed(
            Position(path: afterPath, offset: 0),
          );
      } else {
        final imagePath = node.path.next;
        final newLinePath = imagePath.next;

        transaction
          ..insertNode(imagePath, imageNode(url: base64Data))
          ..insertNode(newLinePath, paragraphNode())
          ..afterSelection = Selection.collapsed(
            Position(path: newLinePath, offset: 0),
          );
      }

      await editorState.apply(transaction);
    }

    void showImagePasteError(Object _) {
      ref
          .read(toastProvider)
          .showToast(
            child: Toast(
              type: ToastType.alert,
              message: Intl.message('error_clipboard_image_paste'),
            ),
          );
    }

    useEffect(() {
      final cancelListener = listenForClipboardImages(
        shouldHandle: () {
          if (!imagePasteArmed.value) return false;

          imagePasteArmed.value = false;
          imagePasteArmTimer.value?.cancel();
          return true;
        },
        onImage: (bytes) async {
          final selection = imagePasteSelection.value;
          imagePasteSelection.value = null;
          await insertImageBytes(bytes, selection: selection);
        },
        onError: showImagePasteError,
      );

      return () {
        imagePasteArmTimer.value?.cancel();
        cancelListener();
      };
    }, [editorState, maxImageSize]);

    Future<void> pickAndInsertImage() async {
      final selection = editorState.selection;

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

        await insertImageBytes(await file.readAsBytes(), selection: selection);
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
        final selection = editorState.selection;
        imagePasteSelection.value = selection?.isCollapsed ?? false
            ? selection
            : null;
        imagePasteArmed.value = true;
        imagePasteArmTimer.value?.cancel();
        imagePasteArmTimer.value = Timer(const Duration(seconds: 1), () {
          imagePasteArmed.value = false;
          imagePasteSelection.value = null;
        });

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
      final headingBuilder = map[HeadingBlockKeys.type];

      if (headingBuilder != null) {
        map[HeadingBlockKeys.type] = HeadingBlockComponentBuilder(
          configuration: headingBuilder.configuration.copyWith(
            placeholderText: (_) => ' ',
          ),
        );
      }

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

    final onChangedRef = useRef<ValueChanged<String>?>(onChanged);
    onChangedRef.value = onChanged;

    useEffect(() {
      final subscription = editorState.transactionStream.listen((event) {
        final (time, _, _) = event;

        if (time != TransactionTime.after) return;

        onChangedRef.value?.call(documentToMarkdown(editorState.document));
      });

      return subscription.cancel;
    }, [editorState]);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContentContainer(
              constraints: BoxConstraints(
                maxWidth: maxWidth,
                minHeight: minHeight,
                maxHeight: maxHeight,
              ),
              borderRadius: BorderRadius.circular(8.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: AppFlowyEditor(
                  shrinkWrap: true,
                  editorState: editorState,
                  blockComponentBuilders: blockComponentBuilders,
                  commandShortcutEvents: [
                    if (kIsWeb) pasteImageCommand,
                    deleteImageCommand,
                    ...standardCommandShortcutEvents.where(
                      (event) => !kIsWeb || !identical(event, pasteCommand),
                    ),
                  ],
                  editorScrollController: editorScrollController,
                  editorStyle: EditorStyle.desktop(
                    padding: Responsive.isDesktop(context)
                        ? EdgeInsets.symmetric(horizontal: 24.0)
                        : EdgeInsets.zero,
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
