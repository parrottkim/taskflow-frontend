part of '../controller.dart';

@riverpod
class ScheduleSubmitController extends _$ScheduleSubmitController {
  @override
  ScheduleSubmitState build() => ScheduleSubmitState.idle();

  Future<void> createSchedule({required int categoryId}) async {
    final auth = ref.read(authControllerProvider);
    final value = ref
        .read(scheduleFormControllerProvider(categoryId: categoryId))
        .requireValue;
    if (auth is! AuthAuthenticated) return;

    state = ScheduleSubmitState.pending();

    try {
      final clientUrl = ref.read(clientUrlProvider);
      final holidays = await _buildHolidayRequests(
        categoryId: categoryId,
        start: value.start!,
        end: value.end!,
      );

      final request = UpsertScheduleRequest(
        summary: value.summary!,
        description: value.description,
        url: join(clientUrl, Routes.project, value.projectId!.toString()),
        projectId: value.projectId!,
        categoryId: categoryId,
        start: value.start!,
        end: value.end!,
        holidays: holidays,
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
        .requireValue;
    if (auth is! AuthAuthenticated) return;

    state = ScheduleSubmitState.pending();

    try {
      final clientUrl = ref.read(clientUrlProvider);
      final holidays = await _buildHolidayRequests(
        categoryId: categoryId,
        scheduleId: scheduleId,
        start: value.start!,
        end: value.end!,
      );

      final request = UpsertScheduleRequest(
        summary: value.summary!,
        description: value.description,
        url: join(clientUrl, Routes.project, value.projectId!.toString()),
        projectId: value.projectId!,
        categoryId: categoryId,
        start: value.start!,
        end: value.end!,
        holidays: holidays,
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

  Future<List<UpdateScheduleHolidayRequest>?> _buildHolidayRequests({
    required int categoryId,
    required DateTime start,
    required DateTime end,
    int? scheduleId,
  }) async {
    if (categoryId != 1) return null;

    final holidays = await ref.read(
      scheduleHolidayFormControllerProvider(
        categoryId: categoryId,
        scheduleId: scheduleId,
        start: start,
        end: end,
      ).future,
    );

    if (holidays.any(
      (holiday) => _isInvalidScheduleCompensatoryLeaveDate(
        holiday.compensatoryLeaveDate,
        start,
        end,
      ),
    )) {
      throw StateError('schedule_form_invalid_5');
    }

    final compensatoryLeaveDates = holidays
        .map((holiday) => holiday.compensatoryLeaveDate!)
        .map((date) => DateTime(date.year, date.month, date.day))
        .toList();
    if (compensatoryLeaveDates.toSet().length !=
        compensatoryLeaveDates.length) {
      throw StateError('bad_request_compensatory_leave_date_duplicate');
    }

    return holidays
        .map(
          (holiday) => UpdateScheduleHolidayRequest(
            date: holiday.date,
            isTravelOnly: holiday.isTravelOnly,
            compensatoryLeaveDate: holiday.compensatoryLeaveDate,
          ),
        )
        .toList();
  }

  bool _isInvalidScheduleCompensatoryLeaveDate(
    DateTime? date,
    DateTime start,
    DateTime end,
  ) {
    if (date == null) return true;

    final now = DateTime.now();
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final normalizedStart = DateTime(start.year, start.month, start.day);
    final normalizedEnd = DateTime(end.year, end.month, end.day);
    return normalizedDate.isBefore(DateTime(now.year, now.month, now.day)) ||
        normalizedDate.weekday == DateTime.saturday ||
        normalizedDate.weekday == DateTime.sunday ||
        (!normalizedDate.isBefore(normalizedStart) &&
            !normalizedDate.isAfter(normalizedEnd));
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
