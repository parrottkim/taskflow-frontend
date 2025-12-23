import 'dart:async';
import 'dart:convert';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:follow_the_leader/follow_the_leader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart';
import 'package:intl/intl.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:super_editor/super_editor.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/attachment.dart';
import 'package:taskflow/src/presentation/widget/super_editor_overlay.dart';
import 'package:taskflow/src/presentation/widget/super_editor_view.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/super_editor.dart';

class DescriptionWidget extends HookConsumerWidget {
  final int projectId;
  final int? reportId;
  final String? description;
  final List<ReportAttachment>? attachments;
  final List<XFile>? files;
  final MutableDocument document;

  const DescriptionWidget({
    super.key,
    required this.projectId,
    this.reportId,
    this.description,
    this.attachments,
    this.files,
    required this.document,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final validation = ref.watch(reportValidationControllerProvider);
    final isDescriptionInvalid = validation.contentInvalid;

    final maxImageSize = Functions(context).maxImageSize;

    final toolbarKey = GlobalKey();
    final overlayKey = GlobalKey();

    final toolbarLink = LeaderLink();
    final overlayLink = LeaderLink();

    final linkOverlayController = useOverlayPortalController();
    final imageOverlayController = useOverlayPortalController();

    final composer = useRef(MutableDocumentComposer()).value;

    final editor = useRef(createDefaultDocumentEditor(
      document: document,
      composer: composer,
      isHistoryEnabled: true,
    )).value;

    Future<void> handlePaste(SuperEditorContext editContext) async {
      final clipboard = SystemClipboard.instance;
      if (clipboard == null) return;

      final reader = await clipboard.read();
      final extentNodeId = composer.selection?.base.nodeId;
      if (extentNodeId == null) return;

      ImageExtension? image;
      for (final e in ImageExtension.values) {
        if (reader.canProvide(e.format)) {
          image = e;
          break;
        }
      }

      if (image == null) {
        if (reader.canProvide(Formats.plainText)) {
          final text = await reader.readValue(Formats.plainText);
          if (text != null && text.isNotEmpty) {
            editContext.commonOps.insertCharacter(text);
          }
        }
        return;
      }

      editor.execute([
        InsertInlinePlaceholderAtCaretRequest(Placeholder()),
      ]);

      if (reader.canProvide(image.format)) {
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

            var bytes = await completer.future;

            if (bytes.lengthInBytes > maxImageSize) {
              final image = decodeImage(bytes);

              if (image != null) {
                final resized = copyResize(
                  image,
                  width: 960,
                );

                bytes = Uint8List.fromList(encodeJpg(resized, quality: 80));
              }
            }

            final base64Data = base64Encode(bytes);
            final mimeType = image!.mime.first;
            final dataUrl = 'data:$mimeType;base64,$base64Data';

            final imageNode = ImageNode(
              id: Editor.createNodeId(),
              imageUrl: dataUrl,
            );

            editContext.commonOps.deleteUpstream();

            editor.execute([
              InsertNodeAtCaretRequest(
                node: imageNode,
              ),
            ]);
            return;
          } catch (e) {
            editContext.commonOps.deleteUpstream();

            ref.read(toastProvider).showToast(
                  child: Toast(
                    type: ToastType.alert,
                    message: Intl.message('error_clipboard_image_paste'),
                  ),
                );
          }
        });
      }
    }

    void handleEvent(SuperEditorContext editContext) {
      final selection = composer.selection;
      if (selection == null || !selection.isCollapsed) return;

      final nodeId = selection.extent.nodeId;
      final node = document.getNodeById(nodeId);

      final fullText = switch (node) {
        ParagraphNode() => node.text.toPlainText().trimLeft(),
        ListItemNode() => node.text.toPlainText().trimLeft(),
        _ => null,
      };

      if (fullText == null || fullText.isEmpty) return;

      final prefixPattern = RegExp(
          r'^((?:[-*]?\s*\[(?: |x|X)\]\s)|(?:[-*]\s)|(?:\d+[.)]\s)|(?:>\s))(.*)$');

      final prefixMatch = prefixPattern.firstMatch(fullText);
      if (prefixMatch == null) return;

      final prefix = prefixMatch.group(1)!;

      final taskMatch =
          RegExp(r'^[-*]?\s*\[( |x|X)\]\s+(.*)$').firstMatch(fullText);
      final unorderedListMatch = RegExp(r'^[-*]\s+(.*)$').firstMatch(fullText);
      final orderdListMatch = RegExp(r'^\d+[.)]\s+(.*)$').firstMatch(fullText);
      final blockquoteMatch = RegExp(r'^>\s+(.*)$').firstMatch(fullText);

      for (int i = 0; i < prefix.length; i++) {
        editContext.commonOps.deleteUpstream();
      }

      if (taskMatch != null) {
        final isComplete = taskMatch.group(1)!.toLowerCase() == 'x';

        if (node is ParagraphNode) {
          editor.execute([
            ConvertParagraphToTaskRequest(
              nodeId: nodeId,
              isComplete: isComplete,
            ),
          ]);
        }

        if (node is ListItemNode) {
          editor.execute([
            ConvertListItemToParagraphRequest(nodeId: nodeId),
            ConvertParagraphToTaskRequest(
              nodeId: nodeId,
              isComplete: isComplete,
            ),
          ]);
        }
        return;
      }

      if (unorderedListMatch != null && node is ParagraphNode) {
        editor.execute([
          ConvertParagraphToListItemRequest(
              nodeId: nodeId, type: ListItemType.unordered),
        ]);
        return;
      }

      if (orderdListMatch != null && node is ParagraphNode) {
        editor.execute([
          ConvertParagraphToListItemRequest(
              nodeId: nodeId, type: ListItemType.ordered),
        ]);
        return;
      }

      if (blockquoteMatch != null && node is ParagraphNode) {
        editor.execute([
          ChangeParagraphBlockTypeRequest(
            nodeId: composer.selection!.extent.nodeId,
            blockType: blockquoteAttribution,
          ),
        ]);
        return;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: OverlayPortal(
            controller: linkOverlayController,
            overlayChildBuilder: (context) => LinkOverlayWidget(
              editor: editor,
              document: document,
              composer: composer,
              overlayKey: overlayKey,
              link: overlayLink,
              linkOverlayController: linkOverlayController,
            ),
            child: SafeArea(
              child: OverlayPortal(
                controller: imageOverlayController,
                overlayChildBuilder: (context) => ImageOverlayWidget(
                  editor: editor,
                  document: document,
                  composer: composer,
                  overlayKey: overlayKey,
                  link: overlayLink,
                  imageOverlayController: imageOverlayController,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Intl.message('report_form_description_1'),
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 8.0),
                            Leader(
                              link: toolbarLink,
                              child: ContainerWidget(
                                key: toolbarKey,
                                padding: EdgeInsets.only(top: 40.0),
                                constraints: BoxConstraints(maxWidth: 600.0),
                                child: BoxToSliverAdapter(
                                  child: SuperEditorView(
                                    editor: editor,
                                    document: document,
                                    composer: composer,
                                    componentBuilders: [
                                      CustomBlockquoteComponentBuilder(),
                                      CustomTaskComponentBuilder(editor),
                                      ...defaultComponentBuilders,
                                    ],
                                    onPaste: handlePaste,
                                    onEvent: handleEvent,
                                  ),
                                ),
                              ),
                            ),
                            InvalidWidget(
                              visible: isDescriptionInvalid,
                              text: Intl.message('report_form_invalid_5'),
                            ),
                            SizedBox(height: 24.0),
                            AttachmentUploadWidget<ReportAttachment>(
                              title: Intl.message('report_form_attachment'),
                              downloadType: 'report',
                              attachments: attachments ?? [],
                              files: files ?? [],
                              onAddFile: (file) {
                                ref
                                    .read(reportFormControllerProvider(
                                      projectId: projectId,
                                      reportId: reportId,
                                    ).notifier)
                                    .addFile(file);
                              },
                              onRemoveFile: (index) {
                                ref
                                    .read(reportFormControllerProvider(
                                      projectId: projectId,
                                      reportId: reportId,
                                    ).notifier)
                                    .removeFile(index);
                              },
                              onRemoveAttachment: (attachmentId) {
                                ref
                                    .read(reportFormControllerProvider(
                                      projectId: projectId,
                                      reportId: reportId,
                                    ).notifier)
                                    .removeAttachment(attachmentId);
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 600.0),
                        child: ToolbarOverlayWidget(
                          editor: editor,
                          document: document,
                          composer: composer,
                          toolbarKey: toolbarKey,
                          overlayKey: overlayKey,
                          toolbarLink: toolbarLink,
                          overlayLink: overlayLink,
                          linkOverlayController: linkOverlayController,
                          imageOverlayController: imageOverlayController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
