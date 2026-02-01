part of '../controller.dart';

@riverpod
class ScheduleFilterController extends _$ScheduleFilterController {
  @override
  FutureOr<ScheduleFilterState> build() async {
    return _init();
  }

  Future<ScheduleFilterState> _init() async {
    final categories = await ref
        .read(scheduleRepositoryProvider)
        .getAllCategories();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final defaultStart = today.subtract(const Duration(days: 28));
    final defaultEnd = today.add(const Duration(days: 28));

    return ScheduleFilterState(
      categoryItems: categories,
      start: defaultStart,
      end: defaultEnd,
    );
  }

  void setSearch({String? search}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(search: search));
  }

  void setDateRange({DateTime? start, DateTime? end}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(start: start ?? value.start, end: end ?? value.end),
    );
  }
}
