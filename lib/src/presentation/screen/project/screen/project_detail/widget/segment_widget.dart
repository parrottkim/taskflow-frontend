import 'package:flutter/material.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/contract_issue_list/contract_issue_list_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/approval_issue_list/approval_issue_list_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/procurement_issue_list/procurement_issue_list_screen.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/screen/report_list/report_list_screen.dart';

class SegmentWidget extends StatelessWidget {
  final int projectId;
  final int? issueId;
  final int? reportId;
  final Project project;
  final TabController controller;

  const SegmentWidget({
    super.key,
    required this.projectId,
    this.issueId,
    this.reportId,
    required this.project,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        ContractIssueListScreen(projectId: projectId, issueId: issueId),
        ApprovalIssueListScreen(projectId: projectId, issueId: issueId),
        ProcurementIssueListScreen(projectId: projectId, issueId: issueId),
        ReportListScreen(projectId: projectId, reportId: reportId),
        // TODO: 구현 필요
        Center(),
      ],
    );
  }
}
