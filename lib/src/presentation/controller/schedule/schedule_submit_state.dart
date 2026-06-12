part of '../controller.dart';

@freezed
sealed class ScheduleSubmitState with _$ScheduleSubmitState {
  factory ScheduleSubmitState.idle() = ScheduleSubmitIdle;
  factory ScheduleSubmitState.pending() = ScheduleSubmitPending;
  factory ScheduleSubmitState.created(Schedule schedule) =
      ScheduleSubmitCreated;
  factory ScheduleSubmitState.edited(Schedule schedule) = ScheduleSubmitEdited;
  factory ScheduleSubmitState.deleted() = ScheduleSubmitDeleted;
  factory ScheduleSubmitState.failure(String message) = ScheduleSubmitFailure;
}
