part of '../controller.dart';

@riverpod
class ScheduleListController extends _$ScheduleListController {
  @override
  FutureOr<ScheduleListState> build({required int projectId}) async {
    return _init(projectId: projectId);
  }

  Future<ScheduleListState> _init({required int projectId}) async {
    final filter = await ref.watch(scheduleFilterControllerProvider.future);

    final result = await ref.read(scheduleRepositoryProvider).getSchedules(
          projectId: projectId,
          search: filter.search,
          start: filter.start,
          end: filter.end,
        );

    return ScheduleListState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }

  Future<void> load() async {
    final filter = await ref.watch(scheduleFilterControllerProvider.future);

    final value = state.valueOrNull;

    if (value == null) return;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref.read(scheduleRepositoryProvider).getSchedules(
            page: value.page + 1,
            projectId: projectId,
            search: filter.search,
            start: filter.start,
            end: filter.end,
          );

      return value.copyWith(
        items: [...value.items, ...result.items],
        page: result.page,
        total: result.total,
        hasReachEnd: value.items.length + result.items.length >= value.total,
      );
    });
  }
}
