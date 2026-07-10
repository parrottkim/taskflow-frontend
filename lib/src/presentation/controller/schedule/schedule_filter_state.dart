part of '../controller.dart';

@freezed
abstract class ScheduleFilterState with _$ScheduleFilterState {
  factory ScheduleFilterState({
    String? search,
    List<int>? departments,
    required DateTime start,
    required DateTime end,
  }) = _ScheduleFilterState;
}
