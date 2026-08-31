import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/schedule_form/widget/schedule_form_actions.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/schedule_form/widget/compensatory_widget.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/schedule_form/widget/date_range_select_widget.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/schedule_form/widget/project_select_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/core/core.dart';

class ScheduleFormScreen extends ConsumerWidget {
  final int? projectId;
  final int categoryId;
  final int? scheduleId;

  const ScheduleFormScreen({
    super.key,
    this.projectId,
    required this.categoryId,
    this.scheduleId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
      scheduleFormControllerProvider(
        categoryId: categoryId,
        scheduleId: scheduleId,
      ),
    );

    return BranchLayout(
      child: switch (form) {
        AsyncData(:final value) => _DesktopWidget(
          projectId: projectId,
          categoryId: categoryId,
          scheduleId: scheduleId,
          value: value,
        ),
        AsyncError(:final error, :final stackTrace) => ErrorStateView(
          error: error,
          stackTrace: stackTrace,
        ),
        _ => Skeletonizer(
          ignoreContainers: true,
          child: _DesktopWidget(
            projectId: projectId,
            categoryId: categoryId,
            scheduleId: scheduleId,
            value: ScheduleFormState(),
          ),
        ),
      },
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int? projectId;
  final int categoryId;
  final int? scheduleId;
  final ScheduleFormState value;

  const _DesktopWidget({
    this.projectId,
    required this.categoryId,
    this.scheduleId,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final summaryController = useTextEditingController(text: value.summary);
    final descriptionController = useTextEditingController(
      text: value.description,
    );

    final summaryFocus = useFocusNode();
    final descriptionFocus = useFocusNode();

    final hasAttemptedSubmit = useState(false);

    useEffect(() {
      Future.microtask(
        () => ref
            .read(
              projectFilterControllerProvider(
                ProjectFilterScope.scheduleProjectSelector,
              ).notifier,
            )
            .init(),
      );
      return null;
    }, []);

    useEffect(() {
      if (projectId == null || scheduleId != null || value.projectId != null) {
        return null;
      }

      Future.microtask(() async {
        final project = await ref
            .read(projectRepositoryProvider)
            .getProject(id: projectId!);

        if (!context.mounted) return;

        ref
            .read(
              scheduleFormControllerProvider(
                categoryId: categoryId,
                scheduleId: scheduleId,
              ).notifier,
            )
            .setProject(
              projectId: project.id,
              projectName: project.name,
              projectClientId: project.clients.first.id,
              projectClientName: project.clients.last.name,
            );
      });

      return null;
    }, [projectId, scheduleId, value.projectId]);

    ref.listen(scheduleSubmitControllerProvider, (_, state) {
      if (state is ScheduleSubmitPending) {
        LoadingOverlay.show(context);
        return;
      }

      LoadingOverlay.hide();

      switch (state) {
        case ScheduleSubmitCreated(:final schedule):
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message('schedule_form_created'),
                ),
              );

          if (projectId == null) {
            context.goNamed(
              RouteNames.schedule,
              queryParameters: {'view': 'schedule'},
            );
          } else {
            context.goNamed(
              RouteNames.reportNew,
              pathParameters: {'project_id': projectId.toString()},
              queryParameters: {'schedule_id': schedule.id.toString()},
            );
          }

        case ScheduleSubmitUpdated():
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message('schedule_form_updated'),
                ),
              );

          context.pop();

        case ScheduleSubmitDeleted():
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('schedule_form_deleted'),
                ),
              );

          context.goNamed(
            RouteNames.schedule,
            queryParameters: {'view': 'schedule'},
          );

        default:
          break;
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(24.0),
                  constraints: BoxConstraints(maxWidth: 600.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        style: textTheme.titleMedium,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: Intl.message(
                                'schedule_new_choose_$categoryId',
                              ),
                            ),
                            TextSpan(
                              text: Intl.message(
                                'schedule_new_choose_${categoryId}_1',
                              ),
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Text(
                        Intl.message('schedule_form_project'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ProjectSelectWidget(
                        categoryId: categoryId,
                        scheduleId: scheduleId,
                        projectName: value.projectName,
                        projectClientId: value.projectClientId,
                        projectClientName: value.projectClientName,
                      ),
                      ValidationErrorMessage(
                        visible:
                            hasAttemptedSubmit.value && value.projectId == null,
                        text: Intl.message('schedule_form_invalid_1'),
                      ),
                      SizedBox(height: 24.0),
                      Text(
                        Intl.message('schedule_form_date'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      DateRangeSelectWidget(
                        categoryId: categoryId,
                        scheduleId: scheduleId,
                        start: value.start,
                        end: value.end,
                      ),
                      ValidationErrorMessage(
                        visible:
                            hasAttemptedSubmit.value &&
                            (value.start == null || value.end == null),
                        text: Intl.message('schedule_form_invalid_2'),
                      ),
                      if (categoryId == 1)
                        CompensatoryWidget(
                          categoryId: categoryId,
                          scheduleId: scheduleId,
                          start: value.start,
                          end: value.end,
                          showValidation: hasAttemptedSubmit.value,
                        ),
                      SizedBox(height: 24.0),
                      Text(
                        Intl.message('schedule_form_summary'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Skeleton.keep(
                        child: TextField(
                          focusNode: summaryFocus,
                          controller: summaryController,
                          onChanged: (value) {
                            ref
                                .read(
                                  scheduleFormControllerProvider(
                                    categoryId: categoryId,
                                    scheduleId: scheduleId,
                                  ).notifier,
                                )
                                .setSummary(summary: value);
                          },
                          maxLines: 1,
                          decoration: InputDecoration(filled: true),
                          onSubmitted: (value) =>
                              descriptionFocus.requestFocus(),
                        ),
                      ),
                      ValidationErrorMessage(
                        visible:
                            hasAttemptedSubmit.value &&
                            (value.summary?.trim().isEmpty ?? true),
                        text: Intl.message('schedule_form_invalid_3'),
                      ),
                      SizedBox(height: 24.0),
                      Text(
                        Intl.message('schedule_form_description'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Skeleton.keep(
                        child: TextField(
                          focusNode: descriptionFocus,
                          controller: descriptionController,
                          onChanged: (value) {
                            ref
                                .read(
                                  scheduleFormControllerProvider(
                                    categoryId: categoryId,
                                    scheduleId: scheduleId,
                                  ).notifier,
                                )
                                .setDescription(description: value);
                          },
                          minLines: 3,
                          maxLines: 10,
                          decoration: InputDecoration(filled: true),
                        ),
                      ),
                      ValidationErrorMessage(
                        visible:
                            hasAttemptedSubmit.value &&
                            (value.description?.trim().isEmpty ?? true),
                        text: Intl.message('schedule_form_invalid_4'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ScheduleFormActions(
          onPressed: () async {
            hasAttemptedSubmit.value = true;

            final isProjectInvalid = value.projectId == null;
            final isDateInvalid = value.start == null || value.end == null;
            final isSummaryInvalid = value.summary?.trim().isEmpty ?? true;
            final isDescriptionInvalid =
                value.description?.trim().isEmpty ?? true;

            if (isProjectInvalid ||
                isDateInvalid ||
                isSummaryInvalid ||
                isDescriptionInvalid) {
              LoadingOverlay.hide();
              return;
            }

            if (categoryId == 1) {
              final List<ScheduleHolidayFormState> holidays;

              try {
                holidays = await ref.read(
                  scheduleHolidayFormControllerProvider(
                    categoryId: categoryId,
                    scheduleId: scheduleId,
                    start: value.start,
                    end: value.end,
                  ).future,
                );
              } catch (_) {
                return;
              }

              if (!context.mounted) return;

              final isCompensatoryLeaveDateInvalid = holidays.any(
                (holiday) =>
                    holiday.compensatoryLeaveDate == null ||
                    DateUtils.dateOnly(
                      holiday.compensatoryLeaveDate!,
                    ).isBefore(DateUtils.dateOnly(DateTime.now())) ||
                    holiday.compensatoryLeaveDate!.weekday ==
                        DateTime.saturday ||
                    holiday.compensatoryLeaveDate!.weekday == DateTime.sunday ||
                    (!DateUtils.dateOnly(
                          holiday.compensatoryLeaveDate!,
                        ).isBefore(DateUtils.dateOnly(value.start!)) &&
                        !DateUtils.dateOnly(
                          holiday.compensatoryLeaveDate!,
                        ).isAfter(DateUtils.dateOnly(value.end!))),
              );
              final compensatoryLeaveDates = holidays
                  .map((holiday) => holiday.compensatoryLeaveDate)
                  .whereType<DateTime>()
                  .map(DateUtils.dateOnly)
                  .toList();
              final hasDuplicateCompensatoryLeaveDate =
                  compensatoryLeaveDates.toSet().length !=
                  compensatoryLeaveDates.length;

              if (isCompensatoryLeaveDateInvalid ||
                  hasDuplicateCompensatoryLeaveDate) {
                return;
              }
            }

            if (scheduleId == null) {
              await ref
                  .read(scheduleSubmitControllerProvider.notifier)
                  .createSchedule(categoryId: categoryId);
            } else {
              await ref
                  .read(scheduleSubmitControllerProvider.notifier)
                  .updateSchedule(
                    categoryId: categoryId,
                    scheduleId: scheduleId!,
                  );
            }
          },
          label: scheduleId != null
              ? Intl.message('common_edit')
              : Intl.message('common_post'),
          onDelete: scheduleId == null
              ? null
              : () async {
                  final result = await showDialog<bool>(
                    context: context,
                    builder: (_) => DeleteDialog(
                      title: Intl.message('schedule_form_delete_dialog_1'),
                      content: Intl.message('schedule_form_delete_dialog_2'),
                    ),
                  );

                  if (!context.mounted || result != true) return;

                  context.pop();

                  await ref
                      .read(scheduleSubmitControllerProvider.notifier)
                      .deleteSchedule(scheduleId: scheduleId!);

                  ref
                      .read(toastProvider)
                      .showToast(
                        child: Toast(
                          type: ToastType.standard,
                          message: Intl.message('project_form_delete'),
                        ),
                      );
                },
        ),
      ],
    );
  }
}
