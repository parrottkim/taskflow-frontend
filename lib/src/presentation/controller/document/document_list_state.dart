part of '../controller.dart';

@freezed
abstract class DocumentListState with _$DocumentListState {
  factory DocumentListState({
    @Default([]) List<DocumentListItem> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _DocumentListState;
}
