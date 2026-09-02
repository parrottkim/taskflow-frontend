part of '../data.dart';

class ProjectDataSource implements ProjectRepository {
  final ProjectService _service;

  ProjectDataSource({required ProjectService service}) : _service = service;

  @override
  Future<ProjectItemCount> getProjectItemCount({required int id}) =>
      _service.getProjectItemCount(id: id);

  @override
  Future<Project> getProjectForEdit({required int id}) =>
      _service.getProjectForEdit(id: id);
  @override
  Future<Project> getProject({required int id}) => _service.getProject(id: id);

  @override
  Future<Result<ProjectListItem>> getProjects({
    int page = 1,
    int limit = 40,
    String? view,
    String? sort,
    String? order,
    String? search,
    String? bookmark,
    String? clients,
    String? categories,
  }) => _service.getProjects(
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
      _service.createProject(request: request);

  @override
  Future<Project> updateProject({
    required int id,
    required UpdateProjectRequest request,
  }) => _service.updateProject(id: id, request: request);

  @override
  Future<Project> closeProject({
    required int id,
    required CloseProjectRequest request,
  }) => _service.closeProject(id: id, request: request);

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
