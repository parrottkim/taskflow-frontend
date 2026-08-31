part of '../controller.dart';

@riverpod
class WorkIssueListController extends _$WorkIssueListController {
  @override
  FutureOr<WorkIssueListState> build() async => _init();

  Future<WorkIssueListState> _init() async {
    final filter = ref.watch(workIssueFilterControllerProvider);

    final result = await ref
        .read(workRepositoryProvider)
        .getIssues(
          sort: filter.sort?.key,
          order: filter.order?.key,
          search: filter.search,
          clients: filter.clients?.join(','),
          categories: filter.categories?.join(','),
        );

    return WorkIssueListState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }

  Future<void> load() async {
    final filter = ref.watch(workIssueFilterControllerProvider);

    if (!state.hasValue) return;
    final value = state.requireValue;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(workRepositoryProvider)
          .getIssues(
            page: value.page + 1,
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
