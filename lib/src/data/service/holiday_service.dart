part of '../data.dart';

@RestApi()
abstract class HolidayService {
  factory HolidayService(Dio dio, {String baseUrl}) = _HolidayService;

  @GET('holiday/days-off')
  Future<List<KoreanHoliday>> getDaysOffBetween({
    @Query('start') @DateTimeConverter(format: 'yyyy-MM-dd') DateTime? start,
    @Query('end') @DateTimeConverter(format: 'yyyy-MM-dd') DateTime? end,
  });
}
