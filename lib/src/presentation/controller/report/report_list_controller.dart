part of '../controller.dart';

@riverpod
class ReportListController extends _$ReportListController {
  @override
  FutureOr<ReportListState> build({required int projectId}) async {
    return await _init();
  }

  Future<ReportListState> _init() async {
    final result = await ref.read(reportRepositoryProvider).getReports(
          projectId: projectId,
        );

    return ReportListState(
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
      final result = await ref.read(reportRepositoryProvider).getReports(
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

  Future<void> addListItem({required Report item}) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedReports = [item, ...value.items];

    state = AsyncValue.data(value.copyWith(items: updatedReports));

    ref
        .read(projectDetailControllerProvider(projectId: projectId).notifier)
        .increaseReportsCount();
  }

  Future<void> updateListItem(Report updatedItem) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedReports = value.items.map((issue) {
      return issue.id == updatedItem.id ? updatedItem : issue;
    }).toList();

    state = AsyncValue.data(value.copyWith(items: updatedReports));
  }

  Future<void> removeListItem({required int id}) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedReports =
        value.items.where((project) => project.id != id).toList();

    state = AsyncValue.data(value.copyWith(items: updatedReports));

    ref
        .read(projectDetailControllerProvider(projectId: projectId).notifier)
        .decreaseReportsCount();
  }
}
