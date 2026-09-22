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
      await ref
          .read(projectDetailControllerProvider(projectId: project.id).notifier)
          .refreshParticipantSummary();

      state = ProjectSubmitState.updated(project);
    } catch (e) {
      state = ProjectSubmitState.failure(e.toString());
    }
  }

  Future<void> assignProjectManager({
    required Project project,
    required User manager,
  }) async {
    state = const ProjectSubmitState.pending();

    try {
      final request = UpdateProjectRequest(
        managerId: manager.id,
        clientId: project.clients.last.id,
        projectCode: project.code,
        projectName: project.name,
        isPreexecuted: project.isPreexecuted,
      );

      final updatedProject = await ref
          .read(projectRepositoryProvider)
          .updateProject(id: project.id, request: request);

      ref
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .updateListItem(item: ProjectListItem.fromProject(updatedProject));
      ref
          .read(
            projectDetailControllerProvider(
              projectId: updatedProject.id,
            ).notifier,
          )
          .updateProject(project: updatedProject);
      await ref
          .read(
            projectDetailControllerProvider(
              projectId: updatedProject.id,
            ).notifier,
          )
          .refreshParticipantSummary();

      state = ProjectSubmitState.updated(updatedProject);
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
      final request = CloseProjectRequest(closureMessage: closureMessage);

      final project = await ref
          .read(projectRepositoryProvider)
          .closeProject(id: projectId, request: request);

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
