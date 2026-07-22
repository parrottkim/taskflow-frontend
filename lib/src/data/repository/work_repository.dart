part of '../data.dart';

abstract class WorkRepository {
  Future<Result<WorkProjectListItem>> getProjects({
    int page = 1,
    int limit = 20,
    String? status,
    String? sort,
    String? order,
    String? search,
    String? clients,
    String? categories,
  });

  Future<Result<WorkIssueListItem>> getIssues({
    int page = 1,
    int limit = 20,
    String? sort,
    String? order,
    String? search,
    String? clients,
    String? categories,
  });

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
  });
}
