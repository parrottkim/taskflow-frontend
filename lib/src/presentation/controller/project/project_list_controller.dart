part of '../controller.dart';

@riverpod
class ProjectListController extends _$ProjectListController {
  @override
  FutureOr<ProjectListState> build(ProjectFilterScope scope) {
    return _init();
  }

  Future<ProjectListState> _init() async {
    final filter = ref.watch(projectFilterControllerProvider(scope));

    final result = await ref
        .watch(projectRepositoryProvider)
        .getProjects(
          view: filter.view,
          sort: filter.sort?.key,
          order: filter.order?.key,
          search: filter.search,
          bookmark: filter.bookmark.toString(),
          clients: filter.clients?.join(','),
          categories: filter.categories?.join(','),
        );

    return ProjectListState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }

  Future<void> load() async {
    final filter = ref.watch(projectFilterControllerProvider(scope));

    if (!state.hasValue) return;
    final value = state.requireValue;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(projectRepositoryProvider)
          .getProjects(
            page: value.page + 1,
            view: filter.view,
            sort: filter.sort?.key,
            order: filter.order?.key,
            search: filter.search,
            bookmark: filter.bookmark.toString(),
            clients: filter.clients?.join(','),
            categories: filter.categories?.join(','),
          );

      return value.copyWith(
        items: [...value.items, ...result.items],
        page: result.page,
        total: result.total,
        hasReachEnd: value.items.length + result.items.length >= value.total,
      );
    });
  }

  Future<void> toggleBookmark({
    required int id,
    required bool bookmarked,
  }) async {
    if (!state.hasValue) return;
    final value = state.requireValue;

    final projects = value.items.map((project) {
      if (project.id == id) {
        return project.copyWith(isBookmarked: bookmarked);
      }
      return project;
    }).toList();

    state = AsyncValue.data(value.copyWith(items: projects));

    final repository = ref.read(bookmarkRepositoryProvider);
    if (bookmarked) {
      await repository.addBookmark(id: id);
    } else {
      await repository.deleteBookmark(id: id);
    }
  }

  void addListItem({required ProjectListItem item}) {
    if (!state.hasValue) return;
    final value = state.requireValue;

    final projects = [item, ...value.items];
    state = AsyncValue.data(value.copyWith(items: projects));
  }

  void updateListItem({required ProjectListItem item}) {
    if (!state.hasValue) return;
    final value = state.requireValue;

    final projects = value.items.map((project) {
      return project.id == item.id ? item : project;
    }).toList();

    state = AsyncValue.data(value.copyWith(items: projects));
  }

  void removeListItem({required int id}) {
    if (!state.hasValue) return;
    final value = state.requireValue;

    final projects = value.items.where((project) => project.id != id).toList();

    state = AsyncValue.data(value.copyWith(items: projects));
  }
}
