part of '../controller.dart';

@riverpod
class WorkReportListController extends _$WorkReportListController {
  @override
  FutureOr<WorkReportListState> build() => _init();

  Future<WorkReportListState> _init() async {
    final filter = ref.watch(workReportFilterControllerProvider);

    final result = await ref
        .read(workRepositoryProvider)
        .getReports(
          sort: filter.sort?.key,
          order: filter.order?.key,
          search: filter.search,
          clients: filter.clients?.join(','),
          categories: filter.categories?.join(','),
          start: filter.start,
          end: filter.end,
        );

    return WorkReportListState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }

  Future<void> load() async {
    final filter = ref.watch(workReportFilterControllerProvider);

    final value = state.value;

    if (value == null) return;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(workRepositoryProvider)
          .getReports(
            page: value.page + 1,
            sort: filter.sort?.key,
            order: filter.order?.key,
            search: filter.search,
            clients: filter.clients?.join(','),
            categories: filter.categories?.join(','),
            start: filter.start,
            end: filter.end,
          );

      return value.copyWith(
        items: [...value.items, ...result.items],
        page: result.page,
        total: result.total,
        hasReachEnd: value.items.length + result.items.length >= result.total,
      );
    });
  }
}
