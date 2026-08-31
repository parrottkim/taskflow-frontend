part of '../controller.dart';

@riverpod
Future<DashboardSearchResult> navigationSearch(Ref ref) async {
  final filter = ref.watch(navigationFilterControllerProvider);

  return ref.read(dashboardRepositoryProvider).search(search: filter.search);
}
