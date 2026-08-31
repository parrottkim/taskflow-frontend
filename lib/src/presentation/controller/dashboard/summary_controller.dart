part of '../controller.dart';

@riverpod
Future<ProjectSummary> summary(
  Ref ref, {
  required DateTime start,
  required DateTime end,
}) async {
  return ref
      .read(dashboardRepositoryProvider)
      .getProjectSummary(start: start, end: end);
}
