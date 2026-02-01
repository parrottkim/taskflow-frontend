import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_category/widget/schedule_selector_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class ReportCategoryScreen extends HookConsumerWidget {
  const ReportCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final projectId = int.parse(state.pathParameters['project_id']!);
    final reportId = int.tryParse(state.uri.queryParameters['report_id'] ?? '');
    final scheduleId = int.tryParse(
      state.uri.queryParameters['schedule_id'] ?? '',
    );

    final form = ref.watch(
      reportFormControllerProvider(
        projectId: projectId,
        reportId: reportId,
        scheduleId: scheduleId,
      ),
    );

    return BranchLayout(
      child: switch (form) {
        AsyncData(:final value) => _DesktopWidget(schedule: value.schedule),
        AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
          error: error,
          stackTrace: stackTrace,
        ),
        _ => Skeletonizer(child: _DesktopWidget()),
      },
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final Schedule? schedule;

  const _DesktopWidget({this.schedule});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final projectId = int.parse(state.pathParameters['project_id']!);
    final reportId = int.tryParse(state.uri.queryParameters['report_id'] ?? '');

    final selectedSchedule = useState<Schedule?>(schedule);

    final isScheduleInvalid = useState(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 430.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScheduleSelectorWidget(
                    selectedSchedule: selectedSchedule,
                    isScheduleInvalid: isScheduleInvalid,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  ),
                  CustomTextButton(
                    onPressed: () {
                      final path = GoRouter.of(context).location();

                      context.pushNamed(
                        RouteNames.scheduleNewChoose,
                        queryParameters: {'redirect_to': path},
                      );
                    },
                    text: Intl.message('report_form_schedule_add'),
                  ),
                  SizedBox(height: 8.0),
                  CustomTextButton(
                    onPressed: () {
                      context.goNamed(
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

                    context.goNamed(
                      RouteNames.reportNew,
                      pathParameters: {'project_id': projectId.toString()},
                      queryParameters: {
                        if (reportId != null) 'report_id': reportId.toString(),
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
