part of '../controller.dart';

@riverpod
class ProjectDetailController extends _$ProjectDetailController {
  @override
  FutureOr<ProjectDetailState> build({required int projectId}) async {
    return _init();
  }

  Future<ProjectDetailState> _init() async {
    if (projectId == 0) {
      return ProjectDetailState(project: Project.dummy());
    }

    final result = await ref
        .read(projectRepositoryProvider)
        .getProject(id: projectId);
    final counts = await ref
        .read(projectRepositoryProvider)
        .getProjectItemCount(id: projectId);

    return ProjectDetailState(
      project: result,
      contracts: counts.contracts,
      approvals: counts.approvals,
      procurements: counts.procurements,
      reports: counts.reports,
    );
  }

  void updateProject({required Project project}) {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(value.copyWith(project: project));
  }

  Future<void> toggleBookmark({required bool bookmarked}) async {
    final value = state.value;
    if (value == null) return;

    final updatedItem = value.project.copyWith(isBookmarked: bookmarked);

    state = AsyncValue.data(value.copyWith(project: updatedItem));

    ref
        .read(projectListControllerProvider.notifier)
        .updateListItem(item: updatedItem);

    final repository = ref.read(bookmarkRepositoryProvider);
    if (bookmarked) {
      await repository.addBookmark(id: projectId);
    } else {
      await repository.deleteBookmark(id: projectId);
    }
  }

  Future<void> delete() async {
    final value = state.value;

    if (value == null) return;

    await ref.read(projectRepositoryProvider).deleteProject(id: projectId);
    ref
        .read(projectListControllerProvider.notifier)
        .removeListItem(id: projectId);
  }

  void increaseContractsCount() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(value.copyWith(contracts: value.contracts + 1));
  }

  // issueCount를 1 감소시키는 함수 (최소 0 유지)
  void decreaseContractsCount() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(
      value.copyWith(
        contracts: (value.contracts > 0) ? value.contracts - 1 : 0,
      ),
    );
  }

  void increaseApprovalsCount() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(value.copyWith(approvals: value.approvals + 1));
  }

  // issueCount를 1 감소시키는 함수 (최소 0 유지)
  void decreaseApprovalsCount() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(
      value.copyWith(
        approvals: (value.approvals > 0) ? value.approvals - 1 : 0,
      ),
    );
  }

  void increaseProcurementsCount() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(
      value.copyWith(procurements: value.procurements + 1),
    );
  }

  // issueCount를 1 감소시키는 함수 (최소 0 유지)
  void decreaseProcurementsCount() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(
      value.copyWith(
        procurements: (value.procurements > 0) ? value.procurements - 1 : 0,
      ),
    );
  }

  void increaseReportsCount() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(value.copyWith(reports: value.reports + 1));
  }

  // issueCount를 1 감소시키는 함수 (최소 0 유지)
  void decreaseReportsCount() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(
      value.copyWith(reports: (value.reports > 0) ? value.reports - 1 : 0),
    );
  }
}
