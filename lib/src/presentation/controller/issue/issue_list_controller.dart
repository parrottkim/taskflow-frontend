part of '../controller.dart';

@riverpod
class IssueListController extends _$IssueListController {
  @override
  FutureOr<IssueListState> build({required int projectId}) async {
    return _init(projectId: projectId);
  }

  Future<IssueListState> _init({required int projectId}) async {
    final result =
        await ref.read(issueRepositoryProvider).getIssues(projectId: projectId);

    return IssueListState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }

  Future<void> load() async {
    final value = state.valueOrNull;

    if (value == null) return;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref.read(issueRepositoryProvider).getIssues(
            page: value.page + 1,
            projectId: projectId,
          );

      return value.copyWith(
        items: [...value.items, ...result.items],
        page: result.page,
        total: result.total,
        hasReachEnd: value.items.length + result.items.length >= value.total,
      );
    });
  }

  Future<void> addListItem({required Issue item}) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedIssues = [item, ...value.items];
    state = AsyncValue.data(value.copyWith(items: updatedIssues));
  }

  Future<void> updateListItem(Issue updatedItem) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedIssues = value.items.map((issue) {
      return issue.id == updatedItem.id ? updatedItem : issue;
    }).toList();

    state = AsyncValue.data(value.copyWith(items: updatedIssues));
  }

  Future<void> removeListItem({required int id}) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedIssues =
        value.items.where((project) => project.id != id).toList();

    state = AsyncValue.data(value.copyWith(items: updatedIssues));
  }
}
