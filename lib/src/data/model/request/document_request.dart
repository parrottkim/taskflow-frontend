part of '../../data.dart';

@freezed
abstract class SyncDocumentFolderRequest with _$SyncDocumentFolderRequest {
  const factory SyncDocumentFolderRequest({
    int? id,
    required String name,
    int? parentId,
    @Default(0) int sort,
    @Default(false) bool fixed,
    @Default([]) List<SyncDocumentFolderRequest> children,
  }) = _SyncDocumentFolderRequest;

  factory SyncDocumentFolderRequest.fromJson(Map<String, dynamic> json) =>
      _$SyncDocumentFolderRequestFromJson(json);

  factory SyncDocumentFolderRequest.fromDocumentFolder(DocumentFolder folder) {
    return SyncDocumentFolderRequest(
      id: folder.id > 0 ? folder.id : null,
      name: folder.name,
      parentId: folder.parentId != null && folder.parentId! > 0
          ? folder.parentId
          : null,
      sort: folder.sort,
      fixed: folder.fixed,
      children: folder.children
          .map(SyncDocumentFolderRequest.fromDocumentFolder)
          .toList(),
    );
  }
}

@freezed
abstract class SyncDocumentFoldersRequest with _$SyncDocumentFoldersRequest {
  const factory SyncDocumentFoldersRequest({
    required List<SyncDocumentFolderRequest> items,
  }) = _SyncDocumentFoldersRequest;

  factory SyncDocumentFoldersRequest.fromJson(Map<String, dynamic> json) =>
      _$SyncDocumentFoldersRequestFromJson(json);
}

@freezed
abstract class CreateDocumentRequest with _$CreateDocumentRequest {
  factory CreateDocumentRequest({
    required String title,
    required String content,
    required int folderId,
    @Default(false) bool fixed,
    required List<DocumentAttachment> attachments,
  }) = _CreateDocumentRequest;

  factory CreateDocumentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateDocumentRequestFromJson(json);
}
