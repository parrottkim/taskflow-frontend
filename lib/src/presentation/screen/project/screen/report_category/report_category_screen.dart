import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_category/widget/schedule_selector_widget.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/provider.dart';

class ReportCategoryScreen extends HookConsumerWidget {
  final int projectId;
  final int? reportId;

  const ReportCategoryScreen({
    super.key,
    required this.projectId,
    this.reportId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
        reportFormControllerProvider(projectId: projectId, reportId: reportId));

    return BranchLayout(
        child: switch (form) {
      AsyncData(:final value) => _DesktopWidget(
          projectId: projectId,
          reportId: reportId,
          schedule: value.schedule,
        ),
      AsyncError(:final error, :final stackTrace) =>
        ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
          child: _DesktopWidget(
            projectId: projectId,
          ),
        ),
    });
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int projectId;
  final int? reportId;
  final Schedule? schedule;

  const _DesktopWidget({required this.projectId, this.reportId, this.schedule});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final isScheduleInvalid = useState(false);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 430.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScheduleSelectorWidget(
                    projectId: projectId,
                    reportId: reportId,
                    schedule: schedule,
                    isScheduleInvalid: isScheduleInvalid,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  ),
                  Skeleton.unite(
                    child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(reportFormControllerProvider(
                                    projectId: projectId, reportId: reportId)
                                .notifier)
                            .setSchedule();
                        context.goNamed(
                          RouteNames.reportNew,
                          pathParameters: {
                            'project_id': projectId.toString(),
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        iconColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(
                          Intl.message('report_form_schedule_no_schedule')),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 24.0, right: 24.0, top: 16.0, bottom: 32.0),
            constraints: BoxConstraints(maxWidth: 430.0),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      isScheduleInvalid.value = schedule == null;

                      if (isScheduleInvalid.value) return;

                      context.goNamed(
                        RouteNames.reportNew,
                        pathParameters: {
                          'project_id': projectId.toString(),
                        },
                      );
                    },
                    child: Text(Intl.message('common_next')),
                  ),
                ),
                if (reportId != null)
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: FilledButton(
                      onPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (_) => DeleteDialog(
                            title: Intl.message('report_form_delete_dialog_1'),
                            content:
                                Intl.message('report_form_delete_dialog_2'),
                          ),
                        );

                        if (result) {
                          context.pop();

                          await ref
                              .read(projectFormControllerProvider(
                                      projectId: projectId)
                                  .notifier)
                              .deleteProject();

                          ref.read(toastProvider).showToast(
                                child: Toast(
                                  type: ToastType.standard,
                                  message: Intl.message('report_form_delete'),
                                ),
                              );
                        }
                        ref
                            .read(reportSubmitControllerProvider.notifier)
                            .deleteReport(
                                projectId: projectId, reportId: reportId!);
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.error,
                        iconColor: colorScheme.onError,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(
                          Symbols.delete_rounded,
                          size: 19.0,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
