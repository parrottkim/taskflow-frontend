part of '../controller.dart';

@riverpod
class ScheduleSubmitController extends _$ScheduleSubmitController {
  @override
  ScheduleSubmitState build() => ScheduleSubmitState.idle();

  Future<void> createSchedule({required int categoryId}) async {
    final auth = ref.read(authControllerProvider);
    final value = ref
        .read(scheduleFormControllerProvider(categoryId: categoryId))
        .valueOrNull;

    if (value == null) return;
    if (auth is! AuthAuthenticated) return;

    state = ScheduleSubmitState.pending();

    try {
      final clientUrl = ref.read(clientUrlProvider);

      final request = ScheduleRequest(
        summary: value.summary!,
        description: value.description,
        url: join(clientUrl, Routes.project, value.projectId!.toString()),
        projectId: value.projectId!,
        categoryId: categoryId,
        start: value.start!,
        end: value.end!,
      );

      final schedule = await ref
          .read(scheduleRepositoryProvider)
          .createSchedule(request: request);

      ref
          .read(scheduleListControllerProvider().notifier)
          .addSchedule(schedule: schedule);

      state = ScheduleSubmitState.success(schedule);
    } catch (e) {
      state = ScheduleSubmitState.failure(e.toString());
    }
  }

  Future<void> updateSchedule(
      {required int categoryId, required int scheduleId}) async {
    final auth = ref.read(authControllerProvider);
    final value = ref
        .read(scheduleFormControllerProvider(
            categoryId: categoryId, scheduleId: scheduleId))
        .valueOrNull;

    if (value == null) return;
    if (auth is! AuthAuthenticated) return;

    state = ScheduleSubmitState.pending();

    try {
      final clientUrl = ref.read(clientUrlProvider);

      final request = ScheduleRequest(
        summary: value.summary!,
        description: value.description,
        url: join(clientUrl, Routes.project, value.projectId!.toString()),
        projectId: value.projectId!,
        categoryId: categoryId,
        start: value.start!,
        end: value.end!,
      );

      final schedule = await ref
          .read(scheduleRepositoryProvider)
          .updateSchedule(id: scheduleId, request: request);

      ref
          .read(scheduleListControllerProvider().notifier)
          .updateSchedule(updatedSchedule: schedule);

      state = ScheduleSubmitState.success(schedule);
    } catch (e) {
      state = ScheduleSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteSchedule({required int scheduleId}) async {
    state = ScheduleSubmitState.pending();

    try {
      await ref.read(scheduleRepositoryProvider).deleteSchedule(id: scheduleId);

      ref
          .read(scheduleListControllerProvider().notifier)
          .removeSchedule(id: scheduleId);

      state = ScheduleSubmitState.deleted();
    } catch (e) {
      state = ScheduleSubmitState.failure(e.toString());
    }
  }
}
