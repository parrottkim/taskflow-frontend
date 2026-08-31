part of '../controller.dart';

@riverpod
Future<Result<ProjectStats>> projectStats(
  Ref ref, {
  required DateTime start,
  required DateTime end,
}) async {
  return ref
      .watch(dashboardRepositoryProvider)
      .getProjectStats(start: start, end: end);
}
