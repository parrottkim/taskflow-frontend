part of '../controller.dart';

@riverpod
Future<DailyAllowancePreview> dailyAllowancePreview(
  Ref ref, {
  required int scheduleId,
  List<ScheduleHoliday>? holidays,
  List<TripActualExpense>? expenses,
}) {
  return ref
      .read(reportRepositoryProvider)
      .previewDailyAllowance(
        scheduleId: scheduleId,
        holidays: holidays,
        expenses: expenses,
      );
}
