part of '../controller.dart';

@riverpod
class ProjectStatsController extends _$ProjectStatsController {
  @override
  FutureOr<ProjectStatsState> build({
    required DateTime start,
    required DateTime end,
  }) {
    return init(start: start, end: end);
  }

  Future<ProjectStatsState> init({
    required DateTime start,
    required DateTime end,
  }) async {
    final result = await ref
        .watch(dashboardRepositoryProvider)
        .getProjectStats(start: start, end: end);

    return ProjectStatsState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }
}
