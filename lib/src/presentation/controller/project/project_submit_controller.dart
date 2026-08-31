part of '../controller.dart';

@riverpod
class ProjectSubmitController extends _$ProjectSubmitController {
  @override
  ProjectSubmitState build() => ProjectSubmitState.idle();

  Future<void> createProject() async {
    final value = ref.read(projectFormControllerProvider()).requireValue;

    state = const ProjectSubmitState.pending();

    try {
      final request = CreateProjectRequest(
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
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .addListItem(item: ProjectListItem.fromProject(project));

      state = ProjectSubmitState.created(project);
    } catch (e) {
      state = ProjectSubmitState.failure(e.toString());
    }
  }

  Future<void> updateProject({required int projectId}) async {
    final value = ref
        .read(projectFormControllerProvider(projectId: projectId))
        .requireValue;

    state = const ProjectSubmitState.pending();

    try {
      final request = UpdateProjectRequest(
        managerId: value.manager?.id,
        clientId: value.clients!.last.id,
        projectCode: value.code!,
        projectName: value.name!,
        isPreexecuted: value.isPreexecuted,
      );

      final project = await ref
          .read(projectRepositoryProvider)
          .updateProject(id: projectId, request: request);

      ref
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .updateListItem(item: ProjectListItem.fromProject(project));
      ref
          .read(projectDetailControllerProvider(projectId: project.id).notifier)
          .updateProject(project: project);

      state = ProjectSubmitState.updated(project);
    } catch (e) {
      state = ProjectSubmitState.failure(e.toString());
    }
  }

  Future<void> closeProject({
    required int projectId,
    required String closureMessage,
  }) async {
    state = const ProjectSubmitState.pending();

    try {
      final request = UpdateProjectRequest(
        isClosed: true,
        closureMessage: closureMessage,
      );

      final project = await ref
          .read(projectRepositoryProvider)
          .updateProject(id: projectId, request: request);

      ref
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .updateListItem(item: ProjectListItem.fromProject(project));
      ref
          .read(projectDetailControllerProvider(projectId: project.id).notifier)
          .updateProject(project: project);

      state = ProjectSubmitState.closed(project);
    } catch (e) {
      state = ProjectSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteProject({required int projectId}) async {
    state = const ProjectSubmitState.pending();

    try {
      await ref.read(projectRepositoryProvider).deleteProject(id: projectId);
      ref
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .removeListItem(id: projectId);

      state = ProjectSubmitState.deleted();
    } catch (e) {
      state = ProjectSubmitState.failure(e.toString());
    }
  }
}
