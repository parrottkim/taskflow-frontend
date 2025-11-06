part of '../controller.dart';

@riverpod
class ProjectDetailController extends _$ProjectDetailController {
  @override
  FutureOr<ProjectDetailState> build({required int projectId}) async {
    return _init();
  }

  Future<ProjectDetailState> _init() async {
    if (projectId == 0) return ProjectDetailState(project: Project.dummy());

    final result =
        await ref.read(projectRepositoryProvider).getProject(id: projectId);

    return ProjectDetailState(project: result);
  }

  void updateProject(Project project) {
    state = AsyncValue.data(ProjectDetailState(project: project));
  }

  Future<void> toggleBookmark({required bool bookmarked}) async {
    final value = state.valueOrNull;
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
    final value = state.valueOrNull;

    if (value == null) return;

    await ref.read(projectRepositoryProvider).deleteProject(id: projectId);
    ref
        .read(projectListControllerProvider.notifier)
        .removeListItem(id: projectId);
  }
}
