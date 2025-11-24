part of '../controller.dart';

@freezed
sealed class ScheduleSubmitState with _$ScheduleSubmitState {
  factory ScheduleSubmitState.idle() = ScheduleSubmitIdle;
  factory ScheduleSubmitState.pending() = ScheduleSubmitPending;
  factory ScheduleSubmitState.success(Schedule schedule) =
      ScheduleSubmitSuccess;
  factory ScheduleSubmitState.deleted() = ScheduleSubmitDeleted;
  factory ScheduleSubmitState.failure(String message) = ScheduleSubmitFailure;
}
