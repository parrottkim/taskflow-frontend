part of '../controller.dart';

@riverpod
class ScheduleHolidayFormController extends _$ScheduleHolidayFormController {
  @override
  Future<List<ScheduleHolidayFormState>> build({
    required int categoryId,
    required DateTime? start,
    required DateTime? end,
    int? scheduleId,
  }) async {
    if (categoryId != 1 || start == null || end == null) return [];

    final initialSchedule = await ref.watch(
      scheduleFormInitialScheduleProvider(scheduleId: scheduleId).future,
    );

    if (initialSchedule != null &&
        _isSameDate(initialSchedule.start, start) &&
        _isSameDate(initialSchedule.end, end)) {
      return initialSchedule.holidays
          .map(
            (holiday) => ScheduleHolidayFormState(
              type: holiday.type,
              date: holiday.date,
              name: holiday.name,
              isTravelOnly: holiday.isTravelOnly,
              compensatoryLeaveDate: holiday.compensatoryLeaveDate,
            ),
          )
          .toList();
    }

    final daysOff = await ref
        .read(holidayRepositoryProvider)
        .getDaysOffBetween(start: start, end: end);

    return daysOff
        .map(
          (dayOff) => ScheduleHolidayFormState(
            type: _holidayType(dayOff.name),
            date: dayOff.date,
            name: dayOff.name,
          ),
        )
        .toList();
  }

  void setTravelOnly({required DateTime date, required bool isTravelOnly}) {
    _update(
      date: date,
      update: (holiday) => holiday.copyWith(isTravelOnly: isTravelOnly),
    );
  }

  void setCompensatoryLeaveDate({
    required DateTime date,
    DateTime? compensatoryLeaveDate,
  }) {
    _update(
      date: date,
      update: (holiday) =>
          holiday.copyWith(compensatoryLeaveDate: compensatoryLeaveDate),
    );
  }

  void _update({
    required DateTime date,
    required ScheduleHolidayFormState Function(ScheduleHolidayFormState holiday)
    update,
  }) {
    final holidays = state.requireValue;

    final index = holidays.indexWhere(
      (holiday) => _isSameDate(holiday.date, date),
    );

    if (index < 0) return;

    final updated = [...holidays];
    updated[index] = update(updated[index]);
    state = AsyncData(updated);
  }

  String _holidayType(String name) =>
      name == '토요일' || name == '일요일' ? 'WEEKEND' : 'PUBLIC_HOLIDAY';

  bool _isSameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
