part of '../controller.dart';

@riverpod
class DocumentSubmitController extends _$DocumentSubmitController {
  @override
  DocumentSubmitState build() => DocumentSubmitState.idle();

  Future<void> createDocument() async {
    final value = ref.read(documentFormControllerProvider()).value;

    if (value == null) return;

    state = const DocumentSubmitState.pending();

    try {
      final request = CreateDocumentDto(
        title: value.title ?? '',
        content: value.content ?? '',
        folderId: value.folderId!,
        fixed: value.fixed,
        attachments: value.attachments ?? [],
      );

      Document document = await ref
          .read(documentRepositoryProvider)
          .createDocument(request: request);

      if (value.files != null && value.files!.isNotEmpty) {
        List<MultipartFile> files = [];
        for (final file in value.files!) {
          final bytes = await file.readAsBytes();
          final mimeType =
              lookupMimeType('', headerBytes: bytes) ??
              'application/octet-stream';
          files.add(
            MultipartFile.fromBytes(
              bytes,
              filename: file.name,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }

        final newAttachments = await ref
            .read(documentRepositoryProvider)
            .uploadAttachments(documentId: document.id, files: files);

        document = document.copyWith(
          attachments: [...document.attachments, ...newAttachments],
        );
      }

      ref
          .read(documentListControllerProvider.notifier)
          .addListItem(item: DocumentListItem.fromDocument(document));

      state = DocumentSubmitState.documentCreated();
    } catch (e) {
      state = DocumentSubmitState.failure(e.toString());
    }
  }

  Future<void> updateDocument({required int documentId}) async {
    final value = ref
        .read(documentFormControllerProvider(documentId: documentId))
        .value;

    if (value == null) return;

    state = const DocumentSubmitState.pending();

    try {
      final request = CreateDocumentDto(
        title: value.title ?? '',
        content: value.content ?? '',
        folderId: value.folderId!,
        fixed: value.fixed,
        attachments: value.attachments ?? [],
      );

      Document document = await ref
          .read(documentRepositoryProvider)
          .updateDocument(id: documentId, request: request);

      if (value.files != null && value.files!.isNotEmpty) {
        List<MultipartFile> files = [];
        for (final file in value.files!) {
          final bytes = await file.readAsBytes();
          final mimeType =
              lookupMimeType('', headerBytes: bytes) ??
              'application/octet-stream';
          files.add(
            MultipartFile.fromBytes(
              bytes,
              filename: file.name,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }

        final newAttachments = await ref
            .read(documentRepositoryProvider)
            .uploadAttachments(documentId: document.id, files: files);

        document = document.copyWith(
          attachments: [...document.attachments, ...newAttachments],
        );
      }

      ref
          .read(documentListControllerProvider.notifier)
          .updateListItem(item: DocumentListItem.fromDocument(document));
      ref.invalidate(documentDetailControllerProvider(documentId: documentId));

      state = DocumentSubmitState.documentUpdated();
    } catch (e) {
      state = DocumentSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteDocument({required int documentId}) async {
    state = const DocumentSubmitState.pending();

    try {
      await ref.read(documentRepositoryProvider).deleteDocument(id: documentId);

      ref
          .read(documentListControllerProvider.notifier)
          .removeListItem(id: documentId);

      state = DocumentSubmitState.documentDeleted();
    } catch (e) {
      state = DocumentSubmitState.failure(e.toString());
    }
  }

  Future<void> syncFolders({required List<DocumentFolder> folders}) async {
    state = const DocumentSubmitState.pending();

    try {
      final request = SyncDocumentFoldersDto(
        items: folders.map(SyncDocumentFolderDto.fromDocumentFolder).toList(),
      );

      final result = await ref
          .read(documentFolderRepositoryProvider)
          .syncFolders(body: request);

      ref
          .read(documentOptionsControllerProvider.notifier)
          .setFolderItems(items: result);

      state = DocumentSubmitState.folderSuccess();
    } catch (e) {
      state = DocumentSubmitState.failure(e.toString());
    }
  }

  Future<void> sendEmail({
    required int documentId,
    required List<User> users,
    required bool isAllSelected,
  }) async {
    state = const DocumentSubmitState.pending();

    final request = SendMailDto(
      userIds: isAllSelected
          ? null
          : users.map((element) => element.id).toList(),
    );

    try {
      await ref
          .read(documentRepositoryProvider)
          .sendMail(id: documentId, request: request);

      state = DocumentSubmitState.mailed();
    } catch (e) {
      state = DocumentSubmitState.failure(e.toString());
    }
  }
}
