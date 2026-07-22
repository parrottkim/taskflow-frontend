import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_category/widget/schedule_select_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class ReportCategoryScreen extends HookConsumerWidget {
  final int projectId;
  final int? reportId;
  final int? scheduleId;
  const ReportCategoryScreen({
    super.key,
    required this.projectId,
    this.reportId,
    this.scheduleId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(
      reportFormControllerProvider(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
      ),
    );

    return BranchLayout(
      child: switch (form) {
        AsyncData(:final value) => _DesktopWidget(
          projectId: projectId,
          reportId: reportId,
          schedule: value.schedule,
        ),
        AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
          error: error,
          stackTrace: stackTrace,
        ),
        _ => Skeletonizer(
          child: _DesktopWidget(projectId: projectId, reportId: reportId),
        ),
      },
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int projectId;
  final int? reportId;
  final Schedule? schedule;

  const _DesktopWidget({required this.projectId, this.reportId, this.schedule});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSchedule = useState<Schedule?>(schedule);

    final isScheduleInvalid = useState(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 430.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScheduleSelectWidget(
                    projectId: projectId,
                    reportId: reportId,
                    selectedSchedule: selectedSchedule,
                    isScheduleInvalid: isScheduleInvalid,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  ),
                  CustomTextButton(
                    onPressed: () {
                      context.pushNamed(
                        RouteNames.scheduleNewChoose,
                        queryParameters: {'project_id': projectId.toString()},
                      );
                    },
                    text: Intl.message('report_form_schedule_add'),
                  ),
                  SizedBox(height: 8.0),
                  CustomTextButton(
                    onPressed: () {
                      context.pushNamed(
                        RouteNames.reportNew,
                        pathParameters: {'project_id': projectId.toString()},
                      );
                    },
                    text: Intl.message('report_form_schedule_no_schedule'),
                  ),
                ],
              ),
            ),
          ),
        ),
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
                  onPressed: () {
                    isScheduleInvalid.value = selectedSchedule.value == null;

                    if (isScheduleInvalid.value) return;

                    context.pushNamed(
                      RouteNames.reportNew,
                      pathParameters: {
                        'project_id': projectId.toString(),
                        if (reportId != null) 'report_id': reportId.toString(),
                      },
                      queryParameters: {
                        if (schedule != null)
                          'schedule_id': schedule!.id.toString(),
                      },
                    );
                  },
                  child: Text(Intl.message('common_next')),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
