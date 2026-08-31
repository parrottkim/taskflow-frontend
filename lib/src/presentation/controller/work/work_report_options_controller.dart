part of '../controller.dart';

@riverpod
Future<WorkReportOptionsState> workReportOptions(Ref ref) async {
  final clients = await ref
      .read(projectClientRepositoryProvider)
      .getAllClients();
  final categories = await ref
      .read(scheduleRepositoryProvider)
      .getAllCategories();

  return WorkReportOptionsState(
    clientItems: clients,
    categoryItems: categories,
    maxClientDepth: clients.map((group) => group.depth).toSet().length,
  );
}
