part of '../widget.dart';

class ImageDetailDialog extends HookConsumerWidget {
  final String imageUrl;

  const ImageDetailDialog({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final controller = useTransformationController();
    final viewerKey = useMemoized(GlobalKey.new);
    final doubleTapPosition = useRef<Offset?>(null);
    final isDownloading = useState(false);
    final isCopying = useState(false);
    final isDesktop =
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.windows;
    useListenable(controller);

    final currentScale = controller.value.getMaxScaleOnAxis();
    final isMinScale = currentScale <= 0.100001;
    final isMaxScale = currentScale >= 3.999999;

    bool isModifierPressed() {
      final keyboard = HardwareKeyboard.instance;

      return keyboard.isControlPressed || keyboard.isMetaPressed;
    }

    void zoomAt({required Offset position, required double zoomFactor}) {
      final currentScale = controller.value.getMaxScaleOnAxis();
      final nextScale = (currentScale * zoomFactor).clamp(0.1, 4.0);
      if (nextScale == currentScale) return;

      // Keep the same point in the image under the mouse cursor while zooming.
      final scenePosition = controller.toScene(position);
      final matrix = controller.value.clone()
        ..setEntry(0, 0, nextScale)
        ..setEntry(1, 1, nextScale)
        // getMaxScaleOnAxis() also includes the Z axis. Keep all three scale
        // components equal so values below 100% are reported correctly.
        ..setEntry(2, 2, nextScale)
        ..setEntry(0, 3, position.dx - scenePosition.dx * nextScale)
        ..setEntry(1, 3, position.dy - scenePosition.dy * nextScale);

      controller.value = matrix;
    }

    void resetTransformation() {
      controller.value = Matrix4.identity();
    }

    Offset viewerCenter() {
      final renderObject = viewerKey.currentContext?.findRenderObject();
      if (renderObject is RenderBox) {
        return renderObject.size.center(Offset.zero);
      }

      return MediaQuery.sizeOf(context).center(Offset.zero);
    }

    void zoomFromCenter(double zoomFactor) {
      zoomAt(position: viewerCenter(), zoomFactor: zoomFactor);
    }

    Future<void> downloadImage() async {
      if (isDownloading.value) return;

      isDownloading.value = true;
      try {
        final uri = Uri.parse(imageUrl);
        final decodedName = uri.pathSegments.isEmpty
            ? ''
            : Uri.decodeComponent(uri.pathSegments.last);
        final sanitizedName = decodedName
            .replaceAll(RegExp(r'[\\/:*?"<>|]'), '_')
            .trim();
        final filename = sanitizedName.isEmpty ? 'image' : sanitizedName;
        final saveLocation = await getSaveLocation(suggestedName: filename);
        if (saveLocation == null) return;

        final response = await Dio().get<List<int>>(
          imageUrl,
          options: Options(responseType: ResponseType.bytes),
        );
        final bytes = response.data;
        if (bytes == null || bytes.isEmpty) {
          throw StateError('Downloaded image is empty.');
        }

        final mimeType = response.headers
            .value(Headers.contentTypeHeader)
            ?.split(';')
            .first
            .trim();
        final file = XFile.fromData(
          Uint8List.fromList(bytes),
          mimeType: mimeType,
          name: filename,
        );

        await file.saveTo(saveLocation.path);
      } catch (error, stackTrace) {
        debugPrint('Failed to download image: $error');
        debugPrintStack(stackTrace: stackTrace);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Intl.message('error_unexpected'))),
          );
        }
      } finally {
        if (context.mounted) isDownloading.value = false;
      }
    }

    Future<void> handleImageAction() async {
      if (isCopying.value) return;

      isCopying.value = true;
      try {
        final response = await Dio().get<List<int>>(
          imageUrl,
          options: Options(responseType: ResponseType.bytes),
        );
        final sourceBytes = response.data;
        if (sourceBytes == null || sourceBytes.isEmpty) {
          throw StateError('Downloaded image is empty.');
        }

        final decodedImage = img.decodeImage(Uint8List.fromList(sourceBytes));
        if (decodedImage == null) {
          throw FormatException('Failed to decode image.');
        }

        // The web Clipboard API guarantees image/png support, so normalize the
        // source image before writing it to the system clipboard.
        final pngBytes = Uint8List.fromList(img.encodePng(decodedImage));
        if (isDesktop) {
          final copied = await writeImageToClipboard(pngBytes);
          if (!copied) {
            throw UnsupportedError(
              'Image clipboard is unavailable on this platform.',
            );
          }

          if (!context.mounted) return;

          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('common_image_copied'),
                ),
              );
          return;
        }

        // Mobile platforms use the native share sheet with the actual image
        // file instead of attempting a clipboard write.
        final uri = Uri.parse(imageUrl);
        final sourceName = uri.pathSegments.isEmpty
            ? 'image'
            : Uri.decodeComponent(uri.pathSegments.last);
        final filename = '${path.basenameWithoutExtension(sourceName)}.png';
        await SharePlus.instance.share(
          ShareParams(
            files: [
              XFile.fromData(pngBytes, mimeType: 'image/png', name: filename),
            ],
            fileNameOverrides: [filename],
          ),
        );
      } catch (error, stackTrace) {
        debugPrint('Failed to copy or share image: $error');
        debugPrintStack(stackTrace: stackTrace);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Intl.message('error_unexpected'))),
          );
        }
      } finally {
        if (context.mounted) isCopying.value = false;
      }
    }

    void handleDoubleTap() {
      if (currentScale > 1.000001) {
        resetTransformation();
        return;
      }

      zoomAt(
        position: doubleTapPosition.value ?? viewerCenter(),
        zoomFactor: 2.0,
      );
    }

    KeyEventResult handleKeyEvent(FocusNode _, KeyEvent event) {
      if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
        return KeyEventResult.ignored;
      }

      switch (event.logicalKey) {
        case LogicalKeyboardKey.equal:
        case LogicalKeyboardKey.numpadAdd:
          zoomFromCenter(1.1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.minus:
        case LogicalKeyboardKey.numpadSubtract:
          zoomFromCenter(1 / 1.1);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.digit0:
        case LogicalKeyboardKey.numpad0:
          resetTransformation();
          return KeyEventResult.handled;
        case LogicalKeyboardKey.escape:
          Navigator.of(context).pop();
          return KeyEventResult.handled;
        default:
          return KeyEventResult.ignored;
      }
    }

    return Focus(
      autofocus: true,
      onKeyEvent: handleKeyEvent,
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                bottom: 24.0,
                child: Listener(
                  key: viewerKey,
                  behavior: HitTestBehavior.opaque,

                  // Ctrl / Cmd + mouse wheel
                  onPointerSignal: (event) {
                    if (!isModifierPressed()) return;

                    if (event is PointerScrollEvent) {
                      final zoomFactor = event.scrollDelta.dy < 0
                          ? 1.1
                          : 1 / 1.1;

                      zoomAt(
                        position: event.localPosition,
                        zoomFactor: zoomFactor,
                      );
                    }
                  },

                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onDoubleTapDown: (details) {
                      doubleTapPosition.value = details.localPosition;
                    },
                    onDoubleTap: handleDoubleTap,
                    child: InteractiveViewer(
                      transformationController: controller,

                      // Dragging never requires a modifier key. Desktop zoom is
                      // handled above; touch devices keep native pinch gestures.
                      panEnabled: true,
                      scaleEnabled: !isDesktop,
                      boundaryMargin: const EdgeInsets.all(double.infinity),

                      minScale: 0.1,
                      maxScale: 4.0,

                      child: Center(
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;

                            return const CircularProgressIndicator.adaptive();
                          },
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Symbols.broken_image_rounded,
                            size: 48.0,
                            color: colorScheme.onSurface.muted,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 24.0,
                child: ContentContainer(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  color: colorScheme.surfaceBright.strong,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Tooltip(
                          message: Intl.message('image_detail_zoom_in_tooltip'),
                          child: AppIconButton(
                            onTap: isMaxScale
                                ? null
                                : () => zoomFromCenter(1.1),
                            borderRadius: BorderRadius.circular(8.0),
                            icon: Icon(Symbols.add_rounded),
                          ),
                        ),
                        SizedBox(
                          width: 52.0,
                          child: Text(
                            '${(currentScale * 100).round()}%',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        Tooltip(
                          message: Intl.message(
                            'image_detail_zoom_out_tooltip',
                          ),
                          child: AppIconButton(
                            onTap: isMinScale
                                ? null
                                : () => zoomFromCenter(1 / 1.1),
                            borderRadius: BorderRadius.circular(8.0),
                            icon: Icon(Symbols.remove_rounded),
                          ),
                        ),
                        VerticalDivider(width: 24.0),
                        Tooltip(
                          message: Intl.message('image_detail_reset_tooltip'),
                          child: AppIconButton(
                            onTap: resetTransformation,
                            borderRadius: BorderRadius.circular(8.0),
                            size: 20.0,
                            weight: 600.0,
                            icon: Icon(Symbols.refresh_rounded),
                          ),
                        ),
                        VerticalDivider(width: 24.0),
                        Tooltip(
                          message: Intl.message(
                            isDesktop
                                ? 'image_detail_clipboard_tooltip'
                                : 'common_share',
                          ),
                          child: AppIconButton(
                            onTap: isCopying.value ? null : handleImageAction,
                            borderRadius: BorderRadius.circular(8.0),
                            size: 16.0,
                            weight: 700.0,
                            icon: isCopying.value
                                ? const SizedBox.square(
                                    dimension: 18.0,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                    ),
                                  )
                                : Icon(
                                    isDesktop
                                        ? Symbols.content_copy_rounded
                                        : Symbols.share_rounded,
                                  ),
                          ),
                        ),
                        SizedBox(width: 4.0),
                        Tooltip(
                          message: Intl.message(
                            'image_detail_download_tooltip',
                          ),
                          child: AppIconButton(
                            onTap: isDownloading.value ? null : downloadImage,
                            borderRadius: BorderRadius.circular(8.0),
                            size: 20.0,
                            weight: 500.0,
                            icon: isDownloading.value
                                ? const SizedBox.square(
                                    dimension: 18.0,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                    ),
                                  )
                                : Icon(Symbols.download_rounded),
                          ),
                        ),
                        VerticalDivider(width: 24.0),
                        Tooltip(
                          message: Intl.message('image_detail_close_tooltip'),
                          child: AppIconButton(
                            onTap: () => Navigator.of(context).pop(),
                            borderRadius: BorderRadius.circular(8.0),
                            size: 20.0,
                            weight: 500.0,
                            icon: Icon(Symbols.close_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
