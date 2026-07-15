part of '../data.dart';

abstract class ProjectRepository {
  Future<ProjectItemCount> getProjectItemCount({required int id});

  Future<Project> getProjectForEdit({required int id});

  Future<Project> getProject({required int id});

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
  });

  Future<Project> createProject({required CreateProjectDto request});

  Future<Project> updateProject({
    required int id,
    required UpdateProjectDto request,
  });

  Future<void> deleteProject({required int id});

  Future<Project> restoreProject({required int id});
}
