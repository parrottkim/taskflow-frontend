part of '../data.dart';

class WorkDataSource implements WorkRepository {
  final WorkService _service;

  WorkDataSource({required WorkService service}) : _service = service;

  @override
  Future<Result<WorkProjectListItem>> getProjects({
    int page = 1,
    int limit = 20,
    String? status,
    String? sort,
    String? order,
    String? search,
    String? clients,
    String? categories,
  }) => _service.getProjects(
    page: page,
    limit: limit,
    status: status,
    sort: sort,
    order: order,
    search: search,
    clients: clients,
    categories: categories,
  );

  @override
  Future<Result<WorkIssueListItem>> getIssues({
    int page = 1,
    int limit = 20,
    String? sort,
    String? order,
    String? search,
    String? clients,
    String? categories,
  }) => _service.getIssues(
    page: page,
    limit: limit,
    sort: sort,
    order: order,
    search: search,
    clients: clients,
    categories: categories,
  );

  @override
  Future<Result<WorkReportListItem>> getReports({
    int page = 1,
    int limit = 20,
    String? sort,
    String? order,
    String? search,
    String? clients,
    String? categories,
    DateTime? start,
    DateTime? end,
  }) => _service.getReports(
    page: page,
    limit: limit,
    sort: sort,
    order: order,
    search: search,
    clients: clients,
    categories: categories,
    start: start,
    end: end,
  );
}

@riverpod
WorkRepository workRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return WorkDataSource(service: WorkService(dio));
}
