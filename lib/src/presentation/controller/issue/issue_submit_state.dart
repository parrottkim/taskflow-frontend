part of '../controller.dart';

@freezed
sealed class IssueSubmitState with _$IssueSubmitState {
  const factory IssueSubmitState.idle() = IssueSubmitIdle;
  const factory IssueSubmitState.pending() = IssueSubmitPending;
  const factory IssueSubmitState.created(Issue issue) = IssueSubmitCreated;
  const factory IssueSubmitState.edited(Issue issue) = IssueSubmitEdited;
  const factory IssueSubmitState.deleted() = IssueSubmitDeleted;
  const factory IssueSubmitState.mailed() = IssueSubmitMailed;
  const factory IssueSubmitState.failure(String message) = IssueSubmitFailure;
}
