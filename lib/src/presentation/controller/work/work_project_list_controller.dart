part of '../controller.dart';

@riverpod
class WorkProjectListController extends _$WorkProjectListController {
  @override
  FutureOr<WorkProjectListState> build() async => _init();

  Future<WorkProjectListState> _init() async {
    final filter = ref.watch(workProjectFilterControllerProvider);

    final result = await ref
        .watch(workRepositoryProvider)
        .getProjects(
          status: filter.status.key,
          sort: filter.sort?.key,
          order: filter.order?.key,
          search: filter.search,
          clients: filter.clients?.join(','),
          categories: filter.categories?.join(','),
        );

    return WorkProjectListState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }

  Future<void> load() async {
    final filter = ref.watch(workProjectFilterControllerProvider);

    final value = state.value;

    if (value == null) return;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(workRepositoryProvider)
          .getProjects(
            page: value.page + 1,
            status: filter.status.key,
            sort: filter.sort?.key,
            order: filter.order?.key,
            search: filter.search,
            clients: filter.clients?.join(','),
            categories: filter.categories?.join(','),
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
