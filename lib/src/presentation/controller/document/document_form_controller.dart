part of '../controller.dart';

@riverpod
class DocumentFormController extends _$DocumentFormController {
  @override
  FutureOr<DocumentFormState> build({int? documentId}) => _init();

  Future<DocumentFormState> _init() async {
    if (documentId == null) {
      return DocumentFormState();
    }

    final result = await ref
        .read(documentRepositoryProvider)
        .getDocumentForEdit(id: documentId!);

    return DocumentFormState(
      title: result.title,
      content: result.content,
      folderId: result.folderId,
      fixed: result.fixed,
      attachments: result.attachments,
    );
  }

  void setFolder({required int? folderId}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(folderId: folderId));
  }

  void setTitle({required String title}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(title: title));
  }

  void setContent({required String content}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(content: content));
  }

  void setFixed({required bool fixed}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(fixed: fixed));
  }

  Future<void> removeAttachment({
    required DocumentAttachment attachment,
  }) async {
    final value = state.requireValue;
    if (documentId == null) return;

    await ref
        .read(documentRepositoryProvider)
        .deleteAttachment(documentId: documentId!, fileId: attachment.id);

    state = AsyncData(
      value.copyWith(
        attachments: value.attachments
            .where((item) => item.id != attachment.id)
            .toList(),
      ),
    );
  }

  void addFile({required XFile file}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(files: [...value.files, file]));
  }

  void removeFile({required XFile file}) {
    final value = state.requireValue;

    state = AsyncData(
      value.copyWith(
        files: [...value.files.where((item) => item.path != file.path)],
      ),
    );
  }

  DocumentDraftPayload toDraftPayload() {
    final value = state.requireValue;

    return DocumentDraftPayload(
      folderId: value.folderId,
      title: value.title,
      content: value.content,
      fixed: value.fixed,
    );
  }

  void restoreDraftPayload(
    DocumentDraftPayload payload, {
    List<XFile> files = const [],
  }) {
    state = AsyncData(
      state.requireValue.copyWith(
        folderId: payload.folderId,
        title: payload.title,
        content: payload.content,
        fixed: payload.fixed,
        files: files,
      ),
    );
  }
}
