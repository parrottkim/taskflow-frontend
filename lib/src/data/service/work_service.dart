part of '../data.dart';

@RestApi()
abstract class WorkService {
  factory WorkService(Dio dio, {String baseUrl}) = _WorkService;

  @GET('work/projects')
  Future<Result<WorkProjectListItem>> getProjects({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('status') String? status,
    @Query('sort') String? sort,
    @Query('order') String? order,
    @Query('search') String? search,
    @Query('clients') String? clients,
    @Query('categories') String? categories,
  });

  @GET('work/issues')
  Future<Result<WorkIssueListItem>> getIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('sort') String? sort,
    @Query('order') String? order,
    @Query('search') String? search,
    @Query('clients') String? clients,
    @Query('categories') String? categories,
  });

  @GET('work/reports')
  Future<Result<WorkReportListItem>> getReports({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('sort') String? sort,
    @Query('order') String? order,
    @Query('search') String? search,
    @Query('clients') String? clients,
    @Query('categories') String? categories,
    @Query('start') @DateTimeConverter(format: 'yyyy-MM-dd') DateTime? start,
    @Query('end') @DateTimeConverter(format: 'yyyy-MM-dd') DateTime? end,
  });
}
