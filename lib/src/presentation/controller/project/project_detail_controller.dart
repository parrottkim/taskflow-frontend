part of '../controller.dart';

@riverpod
class ProjectDetailController extends _$ProjectDetailController {
  @override
  FutureOr<ProjectDetailState> build({required int projectId}) async => _init();

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
    if (!state.hasValue) return;
    final value = state.requireValue;

    state = AsyncValue.data(value.copyWith(project: project));
  }

  Future<void> toggleBookmark({required bool bookmarked}) async {
    if (!state.hasValue) return;
    final value = state.requireValue;

    final updatedItem = value.project.copyWith(isBookmarked: bookmarked);

    state = AsyncValue.data(value.copyWith(project: updatedItem));

    ref
        .read(
          projectListControllerProvider(
            ProjectFilterScope.projectPage,
          ).notifier,
        )
        .updateListItem(item: ProjectListItem.fromProject(updatedItem));

    final repository = ref.read(bookmarkRepositoryProvider);
    if (bookmarked) {
      await repository.addBookmark(id: projectId);
    } else {
      await repository.deleteBookmark(id: projectId);
    }
  }

  Future<void> delete() async {
    state.requireValue;

    await ref.read(projectRepositoryProvider).deleteProject(id: projectId);
    ref
        .read(
          projectListControllerProvider(
            ProjectFilterScope.projectPage,
          ).notifier,
        )
        .removeListItem(id: projectId);
  }

  void increaseContractsCount() {
    if (!state.hasValue) return;
    final value = state.requireValue;

    state = AsyncValue.data(value.copyWith(contracts: value.contracts + 1));
  }

  // issueCount를 1 감소시키는 함수 (최소 0 유지)
  void decreaseContractsCount() {
    if (!state.hasValue) return;
    final value = state.requireValue;

    state = AsyncValue.data(
      value.copyWith(
        contracts: (value.contracts > 0) ? value.contracts - 1 : 0,
      ),
    );
  }

  void increaseApprovalsCount() {
    if (!state.hasValue) return;
    final value = state.requireValue;

    state = AsyncValue.data(value.copyWith(approvals: value.approvals + 1));
  }

  // issueCount를 1 감소시키는 함수 (최소 0 유지)
  void decreaseApprovalsCount() {
    if (!state.hasValue) return;
    final value = state.requireValue;

    state = AsyncValue.data(
      value.copyWith(
        approvals: (value.approvals > 0) ? value.approvals - 1 : 0,
      ),
    );
  }

  void increaseProcurementsCount() {
    if (!state.hasValue) return;
    final value = state.requireValue;

    state = AsyncValue.data(
      value.copyWith(procurements: value.procurements + 1),
    );
  }

  // issueCount를 1 감소시키는 함수 (최소 0 유지)
  void decreaseProcurementsCount() {
    if (!state.hasValue) return;
    final value = state.requireValue;

    state = AsyncValue.data(
      value.copyWith(
        procurements: (value.procurements > 0) ? value.procurements - 1 : 0,
      ),
    );
  }

  void increaseReportsCount() {
    if (!state.hasValue) return;
    final value = state.requireValue;

    state = AsyncValue.data(value.copyWith(reports: value.reports + 1));
  }

  // issueCount를 1 감소시키는 함수 (최소 0 유지)
  void decreaseReportsCount() {
    if (!state.hasValue) return;
    final value = state.requireValue;

    state = AsyncValue.data(
      value.copyWith(reports: (value.reports > 0) ? value.reports - 1 : 0),
    );
  }
}
