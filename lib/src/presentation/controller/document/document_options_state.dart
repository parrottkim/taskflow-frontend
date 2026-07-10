part of '../controller.dart';

@freezed
abstract class DocumentOptionsState with _$DocumentOptionsState {
  factory DocumentOptionsState({
    @Default([]) List<DocumentFolder> folderItems,
  }) = _DocumentOptionsState;
}
