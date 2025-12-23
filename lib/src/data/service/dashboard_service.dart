part of '../data.dart';

@RestApi()
abstract class DashboardService {
  factory DashboardService(Dio dio, {String baseUrl}) = _DashboardService;

  @GET('dashboard/project/stats')
  Future<Result<ProjectStats>> getProjectStats({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('start')
    @DateTimeConverter(format: 'yyyy-MM-dd')
    required DateTime start,
    @Query('end')
    @DateTimeConverter(format: 'yyyy-MM-dd')
    required DateTime end,
  });

  @GET('dashboard/project/summary')
  Future<ProjectSummary> getProjectSummary({
    @Query('start')
    @DateTimeConverter(format: 'yyyy-MM-dd')
    required DateTime start,
    @Query('end')
    @DateTimeConverter(format: 'yyyy-MM-dd')
    required DateTime end,
  });

  @GET('dashboard/schedule/today')
  Future<List<TodaySchedule>> getTodaysSchedule();
}
