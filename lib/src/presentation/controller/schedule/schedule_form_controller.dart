part of '../controller.dart';

@riverpod
class ScheduleFormController extends _$ScheduleFormController {
  @override
  FutureOr<ScheduleFormState> build({
    required int categoryId,
    int? scheduleId,
  }) => _init();

  Future<ScheduleFormState> _init() async {
    if (scheduleId == null) {
      return ScheduleFormState();
    }

    final result = await ref
        .read(scheduleRepositoryProvider)
        .getScheduleForEdit(id: scheduleId!);

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
    final value = state.value;

    if (value == null) return;

    state = AsyncData(
      value.copyWith(
        projectId: projectId,
        projectName: projectName,
        projectClientId: projectClientId,
        projectClientName: projectClientName,
      ),
    );
  }

  void setDate({DateTime? start, DateTime? end}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(start: start, end: end));
  }

  void setSummary({required String summary}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(summary: summary));
  }

  void setDescription({required String description}) {
    final value = state.value;

    if (value == null) return;

    state = AsyncData(value.copyWith(description: description));
  }

  Future<void> deleteSchedule() async {}
}
