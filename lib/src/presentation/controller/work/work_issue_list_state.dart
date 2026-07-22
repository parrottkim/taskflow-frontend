part of '../controller.dart';

@freezed
abstract class WorkIssueListState with _$WorkIssueListState {
  factory WorkIssueListState({
    @Default([]) List<WorkIssueListItem> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _WorkIssueListState;
}
