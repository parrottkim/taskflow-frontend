part of '../controller.dart';

@riverpod
class DocumentSubmitController extends _$DocumentSubmitController {
  @override
  DocumentSubmitState build() => DocumentSubmitState.idle();

  Future<void> createDocument({
    required appflowy.EditorState editorState,
  }) async {
    final value = ref.read(documentFormControllerProvider()).requireValue;

    state = const DocumentSubmitState.pending();

    try {
      final initialContent = value.content ?? '';
      final request = CreateDocumentRequest(
        title: value.title ?? '',
        content: initialContent,
        folderId: value.folderId!,
        fixed: value.fixed,
        attachments: value.attachments,
      );

      Document document = await ref
          .read(documentRepositoryProvider)
          .createDocument(request: request);

      final content = await _uploadInlineImages(
        editorState: editorState,
        resourceId: document.id,
      );
      if (content != initialContent) {
        document = await ref
            .read(documentRepositoryProvider)
            .updateDocument(
              id: document.id,
              request: request.copyWith(content: content),
            );
      }

      if (value.files.isNotEmpty) {
        List<MultipartFile> files = [];
        for (final file in value.files) {
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

      try {
        await ref
            .read(documentDraftControllerProvider.notifier)
            .deleteCurrent();
      } catch (error, stackTrace) {
        debugPrint('Document draft cleanup failed: $error');
        debugPrintStack(stackTrace: stackTrace);
      }

      state = DocumentSubmitState.documentCreated();
    } catch (e) {
      state = DocumentSubmitState.failure(e.toString());
    }
  }

  Future<void> updateDocument({
    required int documentId,
    required appflowy.EditorState editorState,
  }) async {
    final value = ref
        .read(documentFormControllerProvider(documentId: documentId))
        .requireValue;

    state = const DocumentSubmitState.pending();

    try {
      final content = await _uploadInlineImages(
        editorState: editorState,
        resourceId: documentId,
      );
      final request = CreateDocumentRequest(
        title: value.title ?? '',
        content: content,
        folderId: value.folderId!,
        fixed: value.fixed,
        attachments: value.attachments,
      );

      Document document = await ref
          .read(documentRepositoryProvider)
          .updateDocument(id: documentId, request: request);

      if (value.files.isNotEmpty) {
        List<MultipartFile> files = [];
        for (final file in value.files) {
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
      ref.invalidate(documentDetailProvider(documentId: documentId));

      try {
        await ref
            .read(documentDraftControllerProvider.notifier)
            .deleteCurrent();
      } catch (error, stackTrace) {
        debugPrint('Document draft cleanup failed: $error');
        debugPrintStack(stackTrace: stackTrace);
      }

      state = DocumentSubmitState.documentUpdated();
    } catch (e) {
      state = DocumentSubmitState.failure(e.toString());
    }
  }

  Future<String> _uploadInlineImages({
    required appflowy.EditorState editorState,
    required int resourceId,
  }) async {
    final document = editorState.document;
    final map = <appflowy.Node, MultipartFile>{};

    void traverseNodes(appflowy.Node node) {
      if (node.type == appflowy.ImageBlockKeys.type) {
        final imageUrl =
            node.attributes[appflowy.ImageBlockKeys.url] as String?;
        if (imageUrl != null &&
            (imageUrl.startsWith('data:') ||
                !(Uri.tryParse(imageUrl)?.hasScheme ?? false))) {
          try {
            final bytes = base64Decode(imageUrl.split(',').last);
            final mimeType =
                lookupMimeType('', headerBytes: bytes) ??
                'application/octet-stream';
            final extension = extensionFromMime(mimeType) ?? 'jpeg';
            map[node] = MultipartFile.fromBytes(
              bytes,
              filename: '${node.id}.$extension',
              contentType: MediaType.parse(mimeType),
            );
          } catch (error) {
            debugPrint(
              'Image processing failed for node: ${node.id}, error: $error',
            );
          }
        }
      }

      for (final child in node.children) {
        traverseNodes(child);
      }
    }

    for (final node in document.root.children) {
      traverseNodes(node);
    }

    if (map.isNotEmpty) {
      final uploadResults = await ref
          .read(sftpRepositoryProvider)
          .uploadInlineImage(
            path: 'document',
            resourceId: resourceId,
            files: map.values.toList(),
          );
      final nodes = map.keys.toList();

      for (
        var index = 0;
        index < uploadResults.length && index < nodes.length;
        index++
      ) {
        nodes[index].updateAttributes({
          appflowy.ImageBlockKeys.url: uploadResults[index].url,
        });
      }
    }

    return appflowy.documentToMarkdown(document);
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
      final request = SyncDocumentFoldersRequest(
        items: folders
            .map(SyncDocumentFolderRequest.fromDocumentFolder)
            .toList(),
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

    final request = SendMailRequest(
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
