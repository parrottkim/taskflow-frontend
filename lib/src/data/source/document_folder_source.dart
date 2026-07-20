part of '../data.dart';

class DocumentFolderDataSource implements DocumentFolderRepository {
  final DocumentFolderService _service;

  DocumentFolderDataSource({required DocumentFolderService service})
    : _service = service;

  @override
  Future<List<DocumentFolder>> getAllFolders() => _service.getAllFolders();

  @override
  Future<List<DocumentFolder>> syncFolders({
    required SyncDocumentFoldersRequest body,
  }) => _service.syncFolders(body: body);
}

@riverpod
DocumentFolderRepository documentFolderRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return DocumentFolderDataSource(service: DocumentFolderService(dio));
}
