part of '../data.dart';

abstract class DocumentRepository {
  Future<Document> getDocumentForEdit({required int id});

  Future<Result<Document>> getDocuments({
    int page = 1,
    int limit = 10,
    required int folderId,
    String? sort,
    String? order,
    String? search,
  });

  Future<Document> createDocument({required CreateDocumentDto request});

  Future<Document> updateDocument({
    required int id,
    required CreateDocumentDto request,
  });

  Future<void> deleteDocument({required int id});

  Future<List<DocumentAttachment>> uploadAttachments({
    required int documentId,
    required List<MultipartFile> files,
  });

  Future<void> deleteAttachment({required int documentId, required int fileId});
}
