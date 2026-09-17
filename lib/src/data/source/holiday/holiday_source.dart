part of '../../data.dart';

class HolidayDataSource implements HolidayRepository {
  final HolidayService _service;

  HolidayDataSource({required this._service});

  @override
  Future<List<KoreanHoliday>> getDaysOffBetween({
    DateTime? start,
    DateTime? end,
  }) => _service.getDaysOffBetween(start: start, end: end);
}

@riverpod
HolidayRepository holidayRepository(Ref ref) {
  final http = ref.watch(httpProvider);

  return HolidayDataSource(service: HolidayService(http));
}
