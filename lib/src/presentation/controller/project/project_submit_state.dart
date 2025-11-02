part of '../controller.dart';

@freezed
sealed class ProjectSubmitState with _$ProjectSubmitState {
  const factory ProjectSubmitState.idle() = ProjectSubmitIdle;
  const factory ProjectSubmitState.pending() = ProjectSubmitPending;
  const factory ProjectSubmitState.success(Project project) =
      ProjectSubmitSuccess;
  const factory ProjectSubmitState.deleted() = ProjectSubmitDeleted;
  const factory ProjectSubmitState.failure(String message) =
      ProjectSubmitFailure;
}
