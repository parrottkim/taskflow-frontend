part of '../controller.dart';

@freezed
abstract class DocumentFormState with _$DocumentFormState {
  factory DocumentFormState({
    String? title,
    String? content,
    int? folderId,
    @Default(false) bool fixed,
    @Default(<DocumentAttachment>[]) List<DocumentAttachment> attachments,
    @Default(<XFile>[]) List<XFile> files,
  }) = _DocumentFormState;
}
