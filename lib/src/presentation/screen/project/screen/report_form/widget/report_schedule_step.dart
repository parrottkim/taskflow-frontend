import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/schedule_select_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/report_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class ReportScheduleStep extends StatelessWidget {
  final Schedule? schedule;
  final ValueNotifier<bool> isScheduleInvalid;
  final ValueChanged<Schedule> onSelected;
  final VoidCallback onWithoutSchedule;

  const ReportScheduleStep({
    super.key,
    required this.schedule,
    required this.isScheduleInvalid,
    required this.onSelected,
    required this.onWithoutSchedule,
  });

  @override
  Widget build(BuildContext context) {
    final projectId = ReportFormScope.of(context).projectId;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 430.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScheduleSelectWidget(
              schedule: schedule,
              isScheduleInvalid: isScheduleInvalid,
              onSelected: onSelected,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            AppTextButton(
              onPressed: () {
                context.pushNamed(
                  RouteNames.scheduleNewChoose,
                  queryParameters: {'project_id': projectId.toString()},
                );
              },
              text: Intl.message('report_form_schedule_add'),
            ),
            const SizedBox(height: 8.0),
            AppTextButton(
              onPressed: onWithoutSchedule,
              text: Intl.message('report_form_schedule_no_schedule'),
            ),
          ],
        ),
      ),
    );
  }
}
