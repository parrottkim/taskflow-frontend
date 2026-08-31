part of '../data.dart';

@freezed
abstract class KoreanHoliday with _$KoreanHoliday {
  factory KoreanHoliday({required DateTime date, required String name}) =
      _KoreanHoliday;

  factory KoreanHoliday.fromJson(Map<String, dynamic> json) =>
      _$KoreanHolidayFromJson(json);
}

@freezed
abstract class ScheduleHoliday with _$ScheduleHoliday {
  factory ScheduleHoliday({
    int? id,
    required String type,
    required DateTime date,
    String? name,
    required bool isTravelOnly,
    DateTime? compensatoryLeaveDate,
  }) = _ScheduleHoliday;

  factory ScheduleHoliday.fromJson(Map<String, dynamic> json) =>
      _$ScheduleHolidayFromJson(json);
}
