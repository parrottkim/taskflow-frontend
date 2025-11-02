part of '../controller.dart';

@riverpod
class ProjectDetailController extends _$ProjectDetailController {
  @override
  FutureOr<ProjectDetailState> build({required int projectId}) async {
    return _init(projectId: projectId);
  }

  Future<ProjectDetailState> _init({required int projectId}) async {
    final result =
        await ref.read(projectRepositoryProvider).getProject(id: projectId);

    return ProjectDetailState(item: result);
  }

  void updateProject(Project project) {
    state = AsyncValue.data(ProjectDetailState(item: project));
  }

  Future<void> toggleBookmark({required bool bookmarked}) async {
    final value = state.valueOrNull;
    if (value == null) return;

    final updatedItem = value.item.copyWith(isBookmarked: bookmarked);

    state = AsyncValue.data(value.copyWith(item: updatedItem));

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
