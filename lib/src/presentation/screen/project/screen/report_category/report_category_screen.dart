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
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

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

class _DesktopWidget extends HookWidget {
  final int projectId;
  final int? reportId;
  final Schedule? schedule;

  const _DesktopWidget({required this.projectId, this.reportId, this.schedule});

  @override
  Widget build(BuildContext context) {
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
                  InvalidWidget(
                    visible: isScheduleInvalid.value,
                    text: Intl.message('report_form_invalid_1'),
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

                      if (reportId == null) {
                        context.goNamed(
                          RouteNames.reportNew,
                          pathParameters: {
                            'project_id': projectId.toString(),
                          },
                        );
                      } else {
                        context.goNamed(
                          RouteNames.reportEdit,
                          pathParameters: {
                            'project_id': projectId.toString(),
                            'report_id': reportId!.toString(),
                          },
                        );
                      }
                    },
                    child: Text(Intl.message('common_next')),
                  ),
                ),
                if (reportId != null)
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: FilledButton(
                      onPressed: () {},
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
