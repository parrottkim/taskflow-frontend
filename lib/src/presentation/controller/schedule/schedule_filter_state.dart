part of '../controller.dart';

@freezed
abstract class ScheduleFilterState with _$ScheduleFilterState {
  factory ScheduleFilterState({
    String? view,
    String? search,
    List<int>? departments,
  }) = _ScheduleFilterState;
}
