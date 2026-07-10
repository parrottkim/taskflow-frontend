part of '../controller.dart';

@riverpod
class CalendarController extends _$CalendarController {
  @override
  FutureOr<CalendarState> build() async {
    final result = await ref
        .watch(dashboardRepositoryProvider)
        .getTodaysSchedule();
    final sortedItem = [...result]
      ..sort((a, b) => a.category.id.compareTo(b.category.id));
    return CalendarState(items: sortedItem);
  }
}
