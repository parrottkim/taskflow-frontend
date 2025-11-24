import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/new_issue_button.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/new_report_button.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/overview_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/summary_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ProjectDetailScreen extends HookConsumerWidget {
  final int projectId;
  final int? issueId;
  final int? reportId;
  final String? view;

  const ProjectDetailScreen({
    super.key,
    required this.projectId,
    this.issueId,
    this.reportId,
    this.view,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail =
        ref.watch(projectDetailControllerProvider(projectId: projectId));

    useEffect(() {
      Future.microtask(() => ref
          .read(projectDetailFilterControllerProvider.notifier)
          .init(view: view));
      return null;
    }, [view]);

    return BranchLayout(
      child: switch (detail) {
        AsyncData(:final value) => Responsive(
            desktop: _DesktopWidget(
              projectId: projectId,
              issueId: issueId,
              reportId: reportId,
              project: value.project,
            ),
            mobile: _MobileWidget(
              projectId: projectId,
              issueId: issueId,
              reportId: reportId,
              project: value.project,
            ),
          ),
        AsyncError(:final error, :final stackTrace) =>
          ErrorContainerWidget(error: error, stackTrace: stackTrace),
        _ => Skeletonizer(
            child: Responsive(
              desktop: _DesktopWidget(
                  projectId: projectId, project: Project.dummy()),
              mobile:
                  _MobileWidget(projectId: projectId, project: Project.dummy()),
            ),
          ),
      },
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final int projectId;
  final int? issueId;
  final int? reportId;
  final Project project;

  const _DesktopWidget({
    required this.projectId,
    this.issueId,
    this.reportId,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: OverviewWidget(
              projectId: projectId,
              issueId: issueId,
              reportId: reportId,
              project: project,
            ),
          ),
          SizedBox(width: 16.0),
          SummaryWidget(project: project),
        ],
      ),
    );
  }
}

class _MobileWidget extends StatelessWidget {
  final int projectId;
  final int? issueId;
  final int? reportId;
  final Project project;

  const _MobileWidget({
    required this.projectId,
    this.issueId,
    this.reportId,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              NewReportButton(),
              SizedBox(width: 8.0),
              NewIssueButton(),
            ],
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: OverviewWidget(
              projectId: projectId,
              issueId: issueId,
              reportId: reportId,
              project: project,
            ),
          ),
        ],
      ),
    );
  }
}
