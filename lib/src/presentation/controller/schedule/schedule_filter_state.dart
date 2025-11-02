part of '../controller.dart';

@freezed
abstract class ScheduleFilterState with _$ScheduleFilterState {
  factory ScheduleFilterState({
    String? search,
    DateTime? start,
    DateTime? end,
    @Default([]) List<ScheduleCategory> categoryItems,
  }) = _ScheduleFilterState;
}
