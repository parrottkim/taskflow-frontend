import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_folder_selector_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

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

    Future<void> submit() async {
      isFolderEmpty.value = value.folderId == null;
      isTitleEmpty.value = value.title == null || value.title!.trim().isEmpty;

      if (isFolderEmpty.value || isTitleEmpty.value) {
        return;
      }

      if (documentId == null) {
        await ref
            .read(documentSubmitControllerProvider.notifier)
            .createDocument(editorState: editorState);
      } else {
        await ref
            .read(documentSubmitControllerProvider.notifier)
            .updateDocument(documentId: documentId!, editorState: editorState);
      }
    }

    final dialogTitle = documentId != null && value.title != null
        ? '${Intl.message('document_edit_title')}: ${value.title!}'
        : Intl.message('document_add');

    Widget buildDialog({required bool fullScreen}) => BaseDialog(
      title: dialogTitle,
      maxWidth: 648.0,
      maxHeight: 820.0,
      fullScreen: fullScreen,
      showTitle: !fullScreen,
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

    return Responsive(
      desktop: buildDialog(fullScreen: false),
      mobile: FullScreenDialogLayout(
        title: dialogTitle,
        child: buildDialog(fullScreen: true),
      ),
    );
  }
}
