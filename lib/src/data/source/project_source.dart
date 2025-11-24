part of '../data.dart';

class ProjectDataSource implements ProjectRepository {
  final ProjectService _service;

  ProjectDataSource({required ProjectService service}) : _service = service;

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
  Future<Project> getProject({required int id}) => _service.getProject(id: id);

  @override
  Future<Project> getProjectForEdit({required int id}) =>
      _service.getProjectForEdit(id: id);

  @override
  Future<Result<Project>> getProjects({
    int page = 1,
    int limit = 40,
    String? view,
    String? sort,
    String? order,
    String? search,
    String? bookmark,
    String? clients,
    String? categories,
  }) =>
      _service.getProjects(
        page: page,
        limit: limit,
        view: view,
        sort: sort,
        order: order,
        search: search,
        bookmark: bookmark,
        clients: clients,
        categories: categories,
      );

  @override
  Future<Project> createProject({required CreateProjectRequest request}) =>
      _service.createProject(
        request: request,
      );

  @override
  Future<Project> updateProject({
    required int id,
    required UpdateProjectRequest request,
  }) =>
      _service.updateProject(
        id: id,
        request: request,
      );

  @override
  Future<void> deleteProject({required int id}) =>
      _service.deleteProject(id: id);

  @override
  Future<Project> restoreProject({required int id}) =>
      _service.restoreProject(id: id);
}

@riverpod
ProjectRepository projectRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return ProjectDataSource(service: ProjectService(dio));
}
