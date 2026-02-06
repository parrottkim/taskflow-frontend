import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/work/screen/schedule_form/widget/date_selector_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/schedule_form/widget/project_selector_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/core/core.dart';

class ScheduleFormScreen extends ConsumerWidget {
  const ScheduleFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final path = state.uri.queryParameters['redirect_to'];
    final categoryId = int.parse(state.uri.queryParameters['category']!);
    final scheduleId = int.tryParse(state.pathParameters['schedule_id'] ?? '');

    final form = ref.watch(
      scheduleFormControllerProvider(
        categoryId: categoryId,
        scheduleId: scheduleId,
      ),
    );

    return BranchLayout(
      child: switch (form) {
        AsyncData(:final value) => _DesktopWidget(path: path, value: value),
        AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
          error: error,
          stackTrace: stackTrace,
        ),
        _ => Skeletonizer(
          ignoreContainers: true,
          child: _DesktopWidget(value: ScheduleFormState()),
        ),
      },
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final String? path;
  final ScheduleFormState value;

  const _DesktopWidget({this.path, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final categoryId = int.parse(state.uri.queryParameters['category']!);
    final scheduleId = int.tryParse(state.pathParameters['schedule_id'] ?? '');

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final summaryController = useTextEditingController(text: value.summary);
    final descriptionController = useTextEditingController(
      text: value.description,
    );

    final summaryFocus = useFocusNode();
    final descriptionFocus = useFocusNode();

    final isProjectSelected = useState(false);
    final isDateSelected = useState(false);
    final isSummaryNotEmpty = useState(false);
    final isDescriptionNotEmpty = useState(false);

    useEffect(() {
      Future.microtask(
        () => ref.read(projectFilterControllerProvider.notifier).init(),
      );
      return null;
    }, []);

    ref.listen(scheduleSubmitControllerProvider, (_, state) {
      if (state is ScheduleSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is ScheduleSubmitSuccess) {
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message('schedule_form_success'),
                ),
              );
          if (path == null) {
            context.pop();
            context.goNamed(
              RouteNames.work,
              queryParameters: {'view': 'schedule'},
            );
          } else {
            context.go(path!);
          }
        }

        if (state is ScheduleSubmitDeleted) {
          context.goNamed(
            RouteNames.work,
            queryParameters: {'view': 'schedule'},
          );
        }
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
                      ProjectSelectorWidget(
                        categoryId: categoryId,
                        scheduleId: scheduleId,
                        projectName: value.projectName,
                        projectClientId: value.projectClientId,
                        projectClientName: value.projectClientName,
                      ),
                      InvalidWidget(
                        visible: isProjectSelected.value,
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
                      DateSelectorWidget(start: value.start, end: value.end),
                      InvalidWidget(
                        visible: isDateSelected.value,
                        text: Intl.message('schedule_form_invalid_2'),
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
                            isSummaryNotEmpty.value = false;

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
                          onSubmitted: (value) => FocusScope.of(
                            context,
                          ).requestFocus(descriptionFocus),
                        ),
                      ),
                      InvalidWidget(
                        visible: isSummaryNotEmpty.value,
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
                      InvalidWidget(
                        visible: isDescriptionNotEmpty.value,
                        text: Intl.message('schedule_form_invalid_3'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 16.0,
            bottom: 32.0,
          ),
          constraints: BoxConstraints(maxWidth: 430.0),
          child: Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () async {
                    isProjectSelected.value = value.projectId == null;
                    isDateSelected.value =
                        value.start == null || value.end == null;
                    isSummaryNotEmpty.value =
                        value.summary == null || value.summary!.isEmpty;
                    isDescriptionNotEmpty.value =
                        value.description == null || value.description!.isEmpty;

                    if (isProjectSelected.value ||
                        isDateSelected.value ||
                        isSummaryNotEmpty.value ||
                        isDescriptionNotEmpty.value) {
                      LoadingOverlay.hide();
                      return;
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
                            scheduleId: scheduleId,
                          );
                    }
                  },
                  child: Text(
                    scheduleId != null
                        ? Intl.message('common_edit')
                        : Intl.message('common_post'),
                  ),
                ),
              ),
              if (scheduleId != null)
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: FilledButton(
                    onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (_) => DeleteDialog(
                          title: Intl.message('schedule_form_delete_dialog_1'),
                          content: Intl.message(
                            'schedule_form_delete_dialog_2',
                          ),
                        ),
                      );

                      if (result) {
                        context.pop();

                        await ref
                            .read(scheduleSubmitControllerProvider.notifier)
                            .deleteSchedule(scheduleId: scheduleId);

                        ref
                            .read(toastProvider)
                            .showToast(
                              child: Toast(
                                type: ToastType.standard,
                                message: Intl.message('project_form_delete'),
                              ),
                            );
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.error,
                      iconColor: colorScheme.onError,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Symbols.delete_rounded, size: 19.0),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
