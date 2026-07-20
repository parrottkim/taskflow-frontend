part of '../data.dart';

@RestApi()
abstract class DocumentFolderService {
  factory DocumentFolderService(Dio dio, {String baseUrl}) =
      _DocumentFolderService;

  @GET('document-folder')
  Future<List<DocumentFolder>> getAllFolders();

  @PUT('document-folder')
  Future<List<DocumentFolder>> syncFolders({
    @Body() required SyncDocumentFoldersRequest body,
  });
}
