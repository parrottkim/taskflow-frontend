part of '../data.dart';

abstract class DocumentFolderRepository {
  Future<List<DocumentFolder>> getAllFolders();

  Future<List<DocumentFolder>> syncFolders({
    required SyncDocumentFoldersDto body,
  });
}
