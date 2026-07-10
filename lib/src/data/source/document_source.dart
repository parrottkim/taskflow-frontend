part of '../data.dart';

class DocumentDataSource implements DocumentRepository {
  final DocumentService _service;

  DocumentDataSource({required DocumentService service}) : _service = service;

  @override
  Future<Document> getDocumentForEdit({required int id}) =>
      _service.getDocumentForEdit(id: id);

  @override
  Future<Result<Document>> getDocuments({
    int page = 1,
    int limit = 20,
    required int folderId,
    String? sort,
    String? order,
    String? search,
  }) => _service.getDocuments(
    page: page,
    limit: limit,
    folderId: folderId,
    sort: sort,
    order: order,
    search: search,
  );

  @override
  Future<Document> createDocument({required CreateDocumentDto request}) =>
      _service.createDocument(request: request);

  @override
  Future<Document> updateDocument({
    required int id,
    required CreateDocumentDto request,
  }) => _service.updateDocument(id: id, request: request);

  @override
  Future<void> deleteDocument({required int id}) =>
      _service.deleteDocument(id: id);

  @override
  Future<List<DocumentAttachment>> uploadAttachments({
    required int documentId,
    required List<MultipartFile> files,
  }) => _service.uploadAttachments(documentId: documentId, files: files);

  @override
  Future<void> deleteAttachment({
    required int documentId,
    required int fileId,
  }) => _service.deleteAttachment(documentId: documentId, fileId: fileId);
}

@riverpod
DocumentRepository documentRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return DocumentDataSource(service: DocumentService(dio));
}
