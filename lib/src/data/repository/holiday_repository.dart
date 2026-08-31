part of '../data.dart';

abstract class HolidayRepository {
  Future<List<KoreanHoliday>> getDaysOffBetween({
    DateTime? start,
    DateTime? end,
  });
}
