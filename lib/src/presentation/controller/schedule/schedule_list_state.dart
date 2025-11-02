part of '../controller.dart';

@freezed
abstract class ScheduleListState with _$ScheduleListState {
  factory ScheduleListState({
    @Default([]) List<Schedule> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _ScheduleListState;
}
