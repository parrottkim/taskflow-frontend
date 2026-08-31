import 'dart:async';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_draft_recovery_widget.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_folder_select_widget.dart';
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

    final formProvider = documentFormControllerProvider(documentId: documentId);
    final draftAutosaveProvider = documentDraftAutosaveControllerProvider(
      documentId: documentId,
    );

    final titleController = useTextEditingController(text: value.title);
    final isFolderEmpty = useState(false);
    final isTitleEmpty = useState(false);
    final editorState = useState(_createEditorState(value.content));

    useEffect(() {
      final lifecycleListener = AppLifecycleListener(
        onInactive: () => _flushDraft(ref, documentId),
        onPause: () => _flushDraft(ref, documentId),
        onHide: () => _flushDraft(ref, documentId),
      );

      Future<void>(() async {
        await ref.read(documentDraftControllerProvider.future);
        if (!context.mounted) return;

        ref.read(documentDraftControllerProvider.notifier).clearSelection();
      });

      return () {
        lifecycleListener.dispose();
        editorState.value.dispose();
      };
    }, [documentId]);

    ref.listen(draftAutosaveProvider, (_, next) {
      if (next is! ReportDraftAutosaveSaved) return;

      ref
          .read(toastProvider)
          .showToast(
            child: Toast(
              type: ToastType.saving,
              message: Intl.message('draft_saving'),
            ),
          );
    });

    ref.listen<AsyncValue<DocumentFormState>>(formProvider, (previous, next) {
      if (previous == null || !previous.hasValue || !next.hasValue) return;
      if (previous.requireValue == next.requireValue) return;

      ref.read(draftAutosaveProvider.notifier).schedule();
    });

    Future<void> selectDraft(String draftId) async {
      await ref.read(draftAutosaveProvider.notifier).flush();
      if (!context.mounted) return;

      final restored = await ref
          .read(draftRestoreControllerProvider.notifier)
          .restoreDocument(draftId);
      if (!context.mounted) return;

      if (restored == null) {
        if (ref.read(draftRestoreControllerProvider) is DraftRestoreInvalid) {
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.alert,
                  message: Intl.message('draft_restore_failed'),
                ),
              );
        }
        return;
      }

      ref
          .read(formProvider.notifier)
          .restoreDraftPayload(restored.payload, files: restored.files);
      titleController.text = restored.payload.title ?? '';
      isFolderEmpty.value = false;
      isTitleEmpty.value = false;

      final previousEditorState = editorState.value;
      editorState.value = _createEditorState(restored.payload.content);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        previousEditorState.dispose();
      });
    }

    Future<void> close() async {
      await ref.read(draftAutosaveProvider.notifier).flush();
      if (!context.mounted) return;

      context.pop();
    }

    Future<void> submit() async {
      isFolderEmpty.value = value.folderId == null;
      isTitleEmpty.value = value.title == null || value.title!.trim().isEmpty;

      if (isFolderEmpty.value || isTitleEmpty.value) {
        return;
      }

      await ref.read(draftAutosaveProvider.notifier).flush();
      if (!context.mounted) return;

      if (documentId == null) {
        await ref
            .read(documentSubmitControllerProvider.notifier)
            .createDocument(editorState: editorState.value);
      } else {
        await ref
            .read(documentSubmitControllerProvider.notifier)
            .updateDocument(
              documentId: documentId!,
              editorState: editorState.value,
            );
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
            DocumentDraftRecoveryWidget(
              documentId: documentId,
              onSelected: selectDraft,
            ),
            Text(
              Intl.message('document_form_3'),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            AppToggleButton(
              value: value.fixed,
              onChanged: (fixed) {
                ref
                    .read(
                      documentFormControllerProvider(
                        documentId: documentId,
                      ).notifier,
                    )
                    .setFixed(fixed: fixed);
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
              child: DocumentFolderSelectWidget(
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
            ValidationErrorMessage(
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
            ValidationErrorMessage(
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
            RichTextEditor(
              editorState: editorState.value,
              onChanged: (content) {
                ref
                    .read(
                      documentFormControllerProvider(
                        documentId: documentId,
                      ).notifier,
                    )
                    .setContent(content: content);
              },
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
            onPressed: close,
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

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) _flushDraft(ref, documentId);
      },
      child: Responsive(
        desktop: buildDialog(fullScreen: false),
        mobile: FullScreenDialogLayout(
          title: dialogTitle,
          child: buildDialog(fullScreen: true),
        ),
      ),
    );
  }
}

EditorState _createEditorState(String? content) {
  return content == null || content.isEmpty
      ? EditorState.blank(withInitialText: true)
      : EditorState(document: markdownToDocument(content));
}

void _flushDraft(WidgetRef ref, int? documentId) {
  unawaited(
    ref
        .read(
          documentDraftAutosaveControllerProvider(
            documentId: documentId,
          ).notifier,
        )
        .flush(),
  );
}
