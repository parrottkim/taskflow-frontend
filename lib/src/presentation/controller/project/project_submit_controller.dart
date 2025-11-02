part of '../controller.dart';

@riverpod
class ProjectSubmitController extends _$ProjectSubmitController {
  @override
  ProjectSubmitState build() => ProjectSubmitState.idle();

  Future<void> createProject() async {
    final value = ref.read(projectFormControllerProvider()).valueOrNull;

    if (value == null) return;

    state = const ProjectSubmitState.pending();

    try {
      final request = ProjectRequest(
        managerId: value.manager?.id,
        clientId: value.clients!.last.id,
        projectCode: value.code!,
        projectName: value.name!,
        isPreexecuted: value.isPreexecuted,
      );

      final project = await ref
          .read(projectRepositoryProvider)
          .createProject(request: request);

      ref
          .read(projectListControllerProvider.notifier)
          .addListItem(item: project);
      ref
          .read(projectDetailControllerProvider(projectId: project.id).notifier)
          .updateProject(project);

      state = ProjectSubmitState.success(project);
    } catch (e) {
      state = ProjectSubmitState.failure(e.toString());
    }
  }

  Future<void> updateProject({required int projectId}) async {
    final value = ref
        .read(projectFormControllerProvider(projectId: projectId))
        .valueOrNull;

    if (value == null) return;

    state = const ProjectSubmitState.pending();

    try {
      final request = ProjectRequest(
        managerId: value.manager?.id,
        clientId: value.clients!.last.id,
        projectCode: value.code!,
        projectName: value.name!,
        isPreexecuted: value.isPreexecuted,
      );

      final project = await ref.read(projectRepositoryProvider).updateProject(
            id: projectId,
            request: request,
          );

      ref
          .read(projectListControllerProvider.notifier)
          .updateListItem(item: project);
      ref
          .read(projectDetailControllerProvider(projectId: project.id).notifier)
          .updateProject(project);

      state = ProjectSubmitState.success(project);
    } catch (e) {
      state = ProjectSubmitState.failure(e.toString());
    }
  }

  Future<void> closeProject(
      {required int projectId, required String closureMessage}) async {
    state = const ProjectSubmitState.pending();

    try {
      final request =
          ProjectRequest(isClosed: true, closureMessage: closureMessage);

      final project = await ref
          .read(projectRepositoryProvider)
          .updateProject(id: projectId, request: request);

      ref
          .read(projectListControllerProvider.notifier)
          .updateListItem(item: project);
      ref
          .read(projectDetailControllerProvider(projectId: project.id).notifier)
          .updateProject(project);

      state = ProjectSubmitState.success(project);
    } catch (e) {
      state = ProjectSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteProject({required int projectId}) async {
    state = const ProjectSubmitState.pending();

    try {
      await ref.read(projectRepositoryProvider).deleteProject(id: projectId);
      ref
          .read(projectListControllerProvider.notifier)
          .removeListItem(id: projectId);

      state = ProjectSubmitState.deleted();
    } catch (e) {
      state = ProjectSubmitState.failure(e.toString());
    }
  }
}
