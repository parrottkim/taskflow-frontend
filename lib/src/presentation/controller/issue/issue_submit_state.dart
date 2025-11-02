part of '../controller.dart';

@freezed
sealed class IssueSubmitState with _$IssueSubmitState {
  const factory IssueSubmitState.idle() = IssueSubmitIdle;
  const factory IssueSubmitState.pending() = IssueSubmitPending;
  const factory IssueSubmitState.success(Issue issue) = IssueSubmitSuccess;
  const factory IssueSubmitState.deleted() = IssueSubmitDeleted;
  const factory IssueSubmitState.failure(String message) = IssueSubmitFailure;
}
