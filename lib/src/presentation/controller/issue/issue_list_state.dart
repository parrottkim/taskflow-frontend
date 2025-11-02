part of '../controller.dart';

@freezed
abstract class IssueListState with _$IssueListState {
  factory IssueListState({
    @Default([]) List<Issue> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _IssueListState;
}
