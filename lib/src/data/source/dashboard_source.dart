part of '../data.dart';

class DashboardDataSource implements DashboardRepository {
  final DashboardService _service;

  DashboardDataSource({required DashboardService service}) : _service = service;

  @override
  Future<Result<ProjectStats>> getProjectStats({
    int page = 1,
    int limit = 20,
    required DateTime start,
    required DateTime end,
  }) =>
      _service.getProjectStats(
          page: page, limit: limit, start: start, end: end);

  @override
  Future<ProjectSummary> getProjectSummary({
    required DateTime start,
    required DateTime end,
  }) =>
      _service.getProjectSummary(start: start, end: end);

  @override
  Future<List<TodaySchedule>> getTodaysSchedule() =>
      _service.getTodaysSchedule();
}

@riverpod
DashboardRepository dashboardRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return DashboardDataSource(service: DashboardService(dio));
}
