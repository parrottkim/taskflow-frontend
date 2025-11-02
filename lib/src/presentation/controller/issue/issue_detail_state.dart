part of '../controller.dart';

@freezed
abstract class IssueDetailState with _$IssueDetailState {
  factory IssueDetailState({
    required Issue issue,
  }) = _IssueDetailState;
}
