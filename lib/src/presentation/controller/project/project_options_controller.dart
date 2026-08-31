part of '../controller.dart';

@riverpod
Future<ProjectOptionsState> projectOptions(Ref ref) async {
  final categories = await ref.read(issueRepositoryProvider).getAllCategories();
  final clients = await ref
      .read(projectClientRepositoryProvider)
      .getAllClients();

  return ProjectOptionsState(
    categoryItems: categories,
    clientItems: clients,
    maxClientDepth: clients.map((group) => group.depth).toSet().length,
  );
}
