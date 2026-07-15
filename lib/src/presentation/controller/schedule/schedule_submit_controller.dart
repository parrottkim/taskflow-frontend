part of '../controller.dart';

@riverpod
class ScheduleSubmitController extends _$ScheduleSubmitController {
  @override
  ScheduleSubmitState build() => ScheduleSubmitState.idle();

  Future<void> createSchedule({required int categoryId}) async {
    final auth = ref.read(authControllerProvider);
    final value = ref
        .read(scheduleFormControllerProvider(categoryId: categoryId))
        .value;

    if (value == null) return;
    if (auth is! AuthAuthenticated) return;

    state = ScheduleSubmitState.pending();

    try {
      final clientUrl = ref.read(clientUrlProvider);

      final request = ScheduleDto(
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

      await Future.wait([
        ref
            .read(scheduleListControllerProvider().notifier)
            .addScheduleItem(item: schedule),
        ref
            .read(
              scheduleListControllerProvider(
                scope: ScheduleFilterScope.schedulePage,
                userId: schedule.user.id,
              ).notifier,
            )
            .addScheduleItem(item: schedule),
      ]);

      state = ScheduleSubmitState.created(schedule);
    } catch (e) {
      state = ScheduleSubmitState.failure(e.toString());
    }
  }

  Future<void> updateSchedule({
    required int categoryId,
    required int scheduleId,
  }) async {
    final auth = ref.read(authControllerProvider);
    final value = ref
        .read(
          scheduleFormControllerProvider(
            categoryId: categoryId,
            scheduleId: scheduleId,
          ),
        )
        .value;

    if (value == null) return;
    if (auth is! AuthAuthenticated) return;

    state = ScheduleSubmitState.pending();

    try {
      final clientUrl = ref.read(clientUrlProvider);

      final request = ScheduleDto(
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

      await Future.wait([
        ref
            .read(scheduleListControllerProvider().notifier)
            .updateScheduleItem(item: schedule),
        ref
            .read(
              scheduleListControllerProvider(
                scope: ScheduleFilterScope.schedulePage,
                userId: schedule.user.id,
              ).notifier,
            )
            .updateScheduleItem(item: schedule),
      ]);

      state = ScheduleSubmitState.updated(schedule);
    } catch (e) {
      state = ScheduleSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteSchedule({required int scheduleId}) async {
    final auth = ref.read(authControllerProvider);

    state = ScheduleSubmitState.pending();

    try {
      await ref.read(scheduleRepositoryProvider).deleteSchedule(id: scheduleId);

      await Future.wait([
        ref
            .read(scheduleListControllerProvider().notifier)
            .removeScheduleItem(id: scheduleId),
        if (auth is AuthAuthenticated)
          ref
              .read(
                scheduleListControllerProvider(
                  scope: ScheduleFilterScope.schedulePage,
                  userId: auth.user.id,
                ).notifier,
              )
              .removeScheduleItem(id: scheduleId),
      ]);

      state = ScheduleSubmitState.deleted();
    } catch (e) {
      state = ScheduleSubmitState.failure(e.toString());
    }
  }
}
