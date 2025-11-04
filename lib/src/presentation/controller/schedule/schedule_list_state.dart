part of '../controller.dart';

@freezed
abstract class ScheduleListState with _$ScheduleListState {
  factory ScheduleListState({
    @Default([]) List<ScheduleGroup> items,
    @Default(false) bool hasNext,
    @Default(false) bool hasPrevious,
    required DateTime start,
    required DateTime end,
  }) = _ScheduleListState;
}
