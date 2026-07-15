part of '../data.dart';

@freezed
abstract class DocumentListItem with _$DocumentListItem {
  factory DocumentListItem({
    required int id,
    required String title,
    required int folderId,
    required bool fixed,
    required User createdBy,
    required int attachmentCount,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _DocumentListItem;

  factory DocumentListItem.fromJson(Map<String, dynamic> json) =>
      _$DocumentListItemFromJson(json);

  factory DocumentListItem.fromDocument(Document document) {
    return DocumentListItem(
      id: document.id,
      title: document.title,
      folderId: document.folderId,
      fixed: document.fixed,
      createdBy: document.createdBy,
      attachmentCount: document.attachments.length,
      createdAt: document.createdAt,
      updatedAt: document.updatedAt,
      deletedAt: document.deletedAt,
    );
  }

  factory DocumentListItem.dummy() => DocumentListItem(
    id: 0,
    title: 'Temporary Document Title',
    folderId: 0,
    fixed: false,
    createdBy: User.dummy(),
    attachmentCount: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

@freezed
abstract class Document with _$Document {
  factory Document({
    required int id,
    required String title,
    required String content,
    required int folderId,
    required bool fixed,
    required int views,
    required User createdBy,
    User? updatedBy,
    @Default([]) List<DocumentAttachment> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  factory Document.dummy() => Document(
    id: 0,
    title: 'Temporary Document Title',
    content: 'content',
    folderId: 0,
    fixed: false,
    views: 0,
    createdBy: User.dummy(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

@freezed
abstract class DocumentFolder with _$DocumentFolder {
  factory DocumentFolder({
    required int id,
    required String name,
    int? parentId,
    @Default(0) int sort,
    @Default(false) bool fixed,
    @Default(<DocumentFolder>[]) List<DocumentFolder> children,
  }) = _DocumentFolder;

  factory DocumentFolder.fromJson(Map<String, dynamic> json) =>
      _$DocumentFolderFromJson(json);
}

@freezed
abstract class DocumentAttachment with _$DocumentAttachment {
  factory DocumentAttachment({
    required int id,
    required String filename,
    required int size,
    required String path,
    required DateTime createdAt,
  }) = _DocumentAttachment;

  factory DocumentAttachment.fromJson(Map<String, dynamic> json) =>
      _$DocumentAttachmentFromJson(json);
}
