part of '../controller.dart';

@riverpod
class NavigationSearchController extends _$NavigationSearchController {
  @override
  Future<NavigationSearchState> build() async {
    return _init();
  }

  Future<NavigationSearchState> _init() async {
    final filter = ref.watch(navigationFilterControllerProvider);

    final result = await ref
        .read(projectRepositoryProvider)
        .getProjects(search: filter.search, limit: 5);

    return NavigationSearchState(projects: result.items);
  }
}
