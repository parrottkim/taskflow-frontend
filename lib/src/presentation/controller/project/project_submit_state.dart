part of '../controller.dart';

@freezed
sealed class ProjectSubmitState with _$ProjectSubmitState {
  const factory ProjectSubmitState.idle() = ProjectSubmitIdle;
  const factory ProjectSubmitState.pending() = ProjectSubmitPending;
  const factory ProjectSubmitState.created(Project project) =
      ProjectSubmitCreated;
  const factory ProjectSubmitState.updated(Project project) =
      ProjectSubmitUpdated;
  const factory ProjectSubmitState.deleted() = ProjectSubmitDeleted;
  const factory ProjectSubmitState.failure(String message) =
      ProjectSubmitFailure;
}
