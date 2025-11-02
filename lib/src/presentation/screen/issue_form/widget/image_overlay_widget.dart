import 'dart:convert';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_file_selector/flutter_web_file_selector.dart';
import 'package:follow_the_leader/follow_the_leader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mime/mime.dart';
import 'package:super_editor/super_editor.dart';
import 'package:taskflow/src/presentation/widget/overlay.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:universal_html/html.dart';
import 'package:desktop_drop/desktop_drop.dart';

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
