part of '../data.dart';

@freezed
abstract class Document with _$Document {
  factory Document({
    required int id,
    required String title,
    required String content,
    required int folderId,
    required bool fixed,
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
