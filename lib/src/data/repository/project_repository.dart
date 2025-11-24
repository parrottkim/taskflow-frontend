part of '../data.dart';

abstract class ProjectRepository {
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

  Future<Project> getProject({required int id});

  Future<Project> getProjectForEdit({required int id});

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
  });

  Future<Project> createProject({
    required CreateProjectRequest request,
  });

  Future<Project> updateProject({
    required int id,
    required UpdateProjectRequest request,
  });

  Future<void> deleteProject({required int id});

  Future<Project> restoreProject({required int id});
}
