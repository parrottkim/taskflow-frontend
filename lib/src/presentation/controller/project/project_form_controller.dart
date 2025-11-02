part of '../controller.dart';

@riverpod
class ProjectFormController extends _$ProjectFormController {
  @override
  FutureOr<ProjectFormState> build({int? projectId}) async {
    return await _init(projectId: projectId);
  }

  Future<ProjectFormState> _init({int? projectId}) async {
    if (projectId == null) {
      return ProjectFormState();
    }

    final result =
        await ref.read(projectRepositoryProvider).getProject(id: projectId);

    return ProjectFormState(
      clients: result.clients,
      code: result.code,
      name: result.name,
      manager: result.manager,
      isPreexecuted: result.isPreexecuted,
      isContracted: result.isContracted,
      isAllClientSelected: true,
    );
  }

  void setClients(
      {required List<Client> clients, required bool isAllClientSelected}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        clients: clients,
        isAllClientSelected: isAllClientSelected,
      ),
    );
  }

  void setCode({required String code}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(code: code));
  }

  void setName({required String name}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(name: name));
  }

  void setManager({User? manager}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(manager: manager));
  }

  void setIsPreexecuted({required bool isPreexecuted}) {
    final value = state.valueOrNull;

    if (value == null) return;

    state = AsyncData(value.copyWith(isPreexecuted: isPreexecuted));
  }

  Future<void> deleteProject() async {
    final value = state.valueOrNull;

    if (value == null) return;

    if (projectId != null) {
      await ref.read(projectRepositoryProvider).deleteProject(id: projectId!);
      ref
          .read(projectListControllerProvider.notifier)
          .removeListItem(id: projectId!);
    }
  }
}
