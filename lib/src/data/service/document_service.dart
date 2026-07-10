part of '../data.dart';

@RestApi()
abstract class DocumentService {
  factory DocumentService(Dio dio, {String baseUrl}) = _DocumentService;

  @GET('document/{id}/edit')
  Future<Document> getDocumentForEdit({@Path() required int id});

  @GET('document')
  Future<Result<Document>> getDocuments({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('folder_id') required int folderId,
    @Query('sort') String? sort,
    @Query('order') String? order,
    @Query('search') String? search,
  });

  @POST('document')
  Future<Document> createDocument({@Body() required CreateDocumentDto request});

  @PATCH('document/{id}')
  Future<Document> updateDocument({
    @Path() required int id,
    @Body() required CreateDocumentDto request,
  });

  @DELETE('document/{id}')
  Future<void> deleteDocument({@Path() required int id});

  @POST('document/{document_id}/attachments')
  @MultiPart()
  Future<List<DocumentAttachment>> uploadAttachments({
    @Path('document_id') required int documentId,
    @Part() required List<MultipartFile> files,
  });

  @DELETE('document/{document_id}/attachments/{file_id}')
  Future<void> deleteAttachment({
    @Path('document_id') required int documentId,
    @Path('file_id') required int fileId,
  });
}
