part of '../controller.dart';

@riverpod
Future<List<LatestIssue>> latestUpdate(Ref ref) async {
  final result = await ref.watch(issueRepositoryProvider).getLatestIssues();

  return result.items;
}
