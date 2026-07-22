part of '../controller.dart';

@riverpod
class WorkReportOptionsController extends _$WorkReportOptionsController {
  @override
  FutureOr<WorkReportOptionsState> build() async {
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
}
