part of '../controller.dart';

@riverpod
Future<Schedule?> scheduleFormInitialSchedule(
  Ref ref, {
  int? scheduleId,
}) async {
  if (scheduleId == null) return null;

  return ref
      .read(scheduleRepositoryProvider)
      .getScheduleForEdit(id: scheduleId);
}

@riverpod
class ScheduleFormController extends _$ScheduleFormController {
  @override
  FutureOr<ScheduleFormState> build({
    required int categoryId,
    int? scheduleId,
  }) => _init();

  Future<ScheduleFormState> _init() async {
    final result = await ref.watch(
      scheduleFormInitialScheduleProvider(scheduleId: scheduleId).future,
    );

    if (result == null) return ScheduleFormState();

    return ScheduleFormState(
      projectId: result.projectId,
      projectName: result.projectName,
      projectClientId: result.projectClientId,
      projectClientName: result.projectClientName,
      summary: result.summary,
      description: result.description,
      start: result.start,
      end: result.end,
    );
  }

  void setProject({
    int? projectId,
    String? projectName,
    int? projectClientId,
    String? projectClientName,
  }) {
    if (!state.hasValue) return;
    final value = state.requireValue;

    state = AsyncData(
      value.copyWith(
        projectId: projectId,
        projectName: projectName,
        projectClientId: projectClientId,
        projectClientName: projectClientName,
      ),
    );
  }

  void setDateRange({DateTime? start, DateTime? end}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(start: start, end: end));
  }

  void setSummary({required String summary}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(summary: summary));
  }

  void setDescription({required String description}) {
    final value = state.requireValue;

    state = AsyncData(value.copyWith(description: description));
  }
}
