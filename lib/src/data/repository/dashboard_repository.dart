part of '../data.dart';

abstract class DashboardRepository {
  Future<Result<ProjectStats>> getProjectStats({
    int page = 1,
    int limit = 20,
    required DateTime start,
    required DateTime end,
  });

  Future<ProjectSummary> getProjectSummary({
    required DateTime start,
    required DateTime end,
  });

  Future<List<TodaySchedule>> getTodaysSchedule();

  Future<DashboardSearchResult> search({required String search, int limit = 5});
}
