part of '../controller.dart';

@freezed
abstract class ScheduleHolidayFormState with _$ScheduleHolidayFormState {
  factory ScheduleHolidayFormState({
    required String type,
    required DateTime date,
    String? name,
    @Default(false) bool isTravelOnly,
    DateTime? compensatoryLeaveDate,
  }) = _ScheduleHolidayFormState;
}
