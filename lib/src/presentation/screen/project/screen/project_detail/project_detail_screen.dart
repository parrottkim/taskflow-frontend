import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
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
  const ProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final projectId = int.parse(state.pathParameters['project_id']!);
    final view = state.uri.queryParameters['view'];

    final detail = ref.watch(
      projectDetailControllerProvider(projectId: projectId),
    );

    useEffect(() {
      Future.microtask(
        () => ref
            .read(projectDetailFilterControllerProvider.notifier)
            .init(view: view),
      );
      return null;
    }, [view]);

    return BranchLayout(
      child: switch (detail) {
        AsyncData(:final value) => Responsive(
          desktop: _DesktopWidget(
            project: value.project,
            contracts: value.contracts,
            approvals: value.approvals,
            procurements: value.procurements,
            reports: value.reports,
          ),
          mobile: _MobileWidget(
            project: value.project,
            contracts: value.contracts,
            approvals: value.approvals,
            procurements: value.procurements,
            reports: value.reports,
          ),
        ),
        AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
          error: error,
          stackTrace: stackTrace,
        ),
        _ => Skeletonizer(
          child: Responsive(
            desktop: _DesktopWidget(project: Project.dummy()),
            mobile: _MobileWidget(project: Project.dummy()),
          ),
        ),
      },
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final Project project;
  final int contracts;
  final int approvals;
  final int procurements;
  final int reports;

  const _DesktopWidget({
    required this.project,
    this.contracts = 0,
    this.approvals = 0,
    this.procurements = 0,
    this.reports = 0,
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
              project: project,
              contracts: contracts,
              approvals: approvals,
              procurements: procurements,
              reports: reports,
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
  final Project project;
  final int contracts;
  final int approvals;
  final int procurements;
  final int reports;

  const _MobileWidget({
    required this.project,
    this.contracts = 0,
    this.approvals = 0,
    this.procurements = 0,
    this.reports = 0,
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
              project: project,
              contracts: contracts,
              approvals: approvals,
              procurements: procurements,
              reports: reports,
            ),
          ),
        ],
      ),
    );
  }
}
