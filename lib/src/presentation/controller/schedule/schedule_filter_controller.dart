part of '../controller.dart';

@riverpod
class ScheduleFilterController extends _$ScheduleFilterController {
  @override
  FutureOr<ScheduleFilterState> build() async {
    return _init();
  }

  Future<ScheduleFilterState> _init() async {
    final categories =
        await ref.read(scheduleRepositoryProvider).getAllCategories();

    return ScheduleFilterState(categoryItems: categories);
  }

  void setSearch({String? search}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(search: search));
  }

  void setDateRange({DateTime? start, DateTime? end}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(start: start, end: end));
  }
}
