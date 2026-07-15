import 'dart:convert';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_folder_selector_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DocumentEditDialog extends ConsumerWidget {
  final int? documentId;

  const DocumentEditDialog({super.key, this.documentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
      documentFormControllerProvider(documentId: documentId),
    );

    return switch (form) {
      AsyncData(:final value) => _DialogWidget(
        documentId: documentId,
        value: value,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorDialog(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DialogWidget(
          documentId: documentId,
          value: DocumentFormState(),
        ),
      ),
    };
  }
}

class _DialogWidget extends HookConsumerWidget {
  final int? documentId;
  final DocumentFormState value;

  const _DialogWidget({this.documentId, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleController = useTextEditingController(text: value.title);
    final isFolderEmpty = useState(false);
    final isTitleEmpty = useState(false);
    final editorState = useMemoized(() {
      return value.content == null || value.content!.isEmpty
          ? EditorState.blank(withInitialText: true)
          : EditorState(document: markdownToDocument(value.content!));
    }, []);

    Future<void> serializeAndSetContent() async {
      final document = editorState.document;
      final Map<Node, MultipartFile> map = {};
      final imageNodes = <Node>[];

      // 1. 문서의 모든 노드를 순회하여 이미지 노드 찾기
      void traverseNodes(Node node) {
        if (node.type == ImageBlockKeys.type) {
          final imageUrl = node.attributes[ImageBlockKeys.url] as String?;
          if (imageUrl != null) {
            imageNodes.add(node);
          }
        }

        // 자식 노드 순회
        for (final child in node.children) {
          traverseNodes(child);
        }
      }

      // 루트 노드부터 순회 시작
      for (final node in document.root.children) {
        traverseNodes(node);
      }

      // 2. base64 이미지 추출 및 파일 생성
      for (final node in imageNodes) {
        try {
          final imageUrl = node.attributes[ImageBlockKeys.url] as String;
          final base64 = imageUrl.split(',').last;
          final bytes = base64Decode(base64);
          final mimeType =
              lookupMimeType('', headerBytes: bytes) ??
              'application/octet-stream';

          final extension = extensionFromMime(mimeType) ?? 'jpeg';
          final filename = '${node.id}.$extension';

          final multipartFile = MultipartFile.fromBytes(
            bytes,
            filename: filename,
            contentType: MediaType.parse(mimeType),
          );

          map[node] = multipartFile;
        } catch (e) {
          debugPrint('Image processing failed for node: ${node.id}, error: $e');
        }
      }

      // 3. 이미지 파일 일괄 업로드
      final files = map.values.toList();

      if (files.isNotEmpty) {
        try {
          final uploadResults = await ref
              .read(sftpRepositoryProvider)
              .uploadInlineImage(path: 'document', files: files);

          // 4. 업로드된 URL로 노드 업데이트
          final originalNodes = map.keys.toList();

          for (
            int i = 0;
            i < uploadResults.length && i < originalNodes.length;
            i++
          ) {
            final originalNode = originalNodes[i];
            final uploadedUrl = uploadResults[i].url;

            // AppflowY Editor에서 노드의 attributes 업데이트
            originalNode.updateAttributes({ImageBlockKeys.url: uploadedUrl});
          }
        } catch (e) {
          debugPrint('Batch image upload failed, error: $e');
        }
      }

      // 5. 최종 문서를 Markdown으로 직렬화
      final markdown = documentToMarkdown(document);

      // 6. Controller에 최종 content 전달
      ref
          .read(documentFormControllerProvider(documentId: documentId).notifier)
          .setContent(content: markdown);
    }

    Future<void> submit() async {
      isFolderEmpty.value = value.folderId == null;
      isTitleEmpty.value = value.title == null || value.title!.trim().isEmpty;

      if (isFolderEmpty.value || isTitleEmpty.value) {
        return;
      }

      await serializeAndSetContent();

      if (documentId == null) {
        await ref
            .read(documentSubmitControllerProvider.notifier)
            .createDocument();
      } else {
        await ref
            .read(documentSubmitControllerProvider.notifier)
            .updateDocument(documentId: documentId!);
      }
    }

    return BaseDialog(
      title: documentId != null && value.title != null
          ? '${Intl.message('document_edit_title')}: ${value.title!}'
          : Intl.message('document_add'),
      maxWidth: 648.0,
      maxHeight: 820.0,
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Intl.message('document_form_3'),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            CustomToggleButton(
              value: value.fixed,
              onChanged: (fixed) {
                ref
                    .read(
                      documentFormControllerProvider(
                        documentId: documentId,
                      ).notifier,
                    )
                    .setFixed(fixed: fixed ?? false);
              },
              child: Text(Intl.message('document_form_4')),
            ),
            const SizedBox(height: 24.0),
            Text(
              Intl.message('document_form_1'),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            Skeleton.unite(
              child: DocumentFolderSelectorWidget(
                folderId: value.folderId,
                isFolderEmpty: isFolderEmpty,
                onChanged: (folderId) {
                  ref
                      .read(
                        documentFormControllerProvider(
                          documentId: documentId,
                        ).notifier,
                      )
                      .setFolder(folderId: folderId);
                },
              ),
            ),
            InvalidWidget(
              visible: isFolderEmpty.value,
              text: Intl.message('document_folder_required'),
            ),
            const SizedBox(height: 24.0),
            Text(
              Intl.message('document_form_2'),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: Intl.message('document_title_hint'),
              ),
              onChanged: (value) {
                isTitleEmpty.value = false;

                ref
                    .read(
                      documentFormControllerProvider(
                        documentId: documentId,
                      ).notifier,
                    )
                    .setTitle(title: value);
              },
            ),
            InvalidWidget(
              visible: isTitleEmpty.value,
              text: Intl.message('document_title_required'),
            ),
            const SizedBox(height: 24.0),
            Text(
              Intl.message('document_content'),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            EditorWidget(
              editorState: editorState,
              maxWidth: double.infinity,
              minHeight: 260.0,
              maxHeight: 420.0,
            ),
            AttachmentUploadWidget<DocumentAttachment>(
              title: Intl.message('document_attachment'),
              attachments: value.attachments,
              files: value.files,
              path: 'document',
              onAddFile: (file) {
                ref
                    .read(
                      documentFormControllerProvider(
                        documentId: documentId,
                      ).notifier,
                    )
                    .addFile(file: file);
              },
              onRemoveFile: (file) {
                ref
                    .read(
                      documentFormControllerProvider(
                        documentId: documentId,
                      ).notifier,
                    )
                    .removeFile(file: file);
              },
              onRemoveAttachment: (attachment) {
                ref
                    .read(
                      documentFormControllerProvider(
                        documentId: documentId,
                      ).notifier,
                    )
                    .removeAttachment(attachment: attachment);
              },
            ),
          ],
        ),
      ),
      actions: [
        Skeleton.unite(
          child: ElevatedButton(
            onPressed: () => context.pop(),
            child: Text(Intl.message('common_cancel')),
          ),
        ),
        Skeleton.unite(
          child: ElevatedButton(
            onPressed: submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
            ),
            child: Text(
              Intl.message('저장', name: 'common_save'),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
