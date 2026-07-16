import 'package:flutter/material.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/contract_issue_list/contract_issue_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/approval_issue_list/approval_issue_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/procurement_issue_list/procurement_issue_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/project_detail/widget/report_list/report_list_widget.dart';

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
        ContractIssueListWidget(projectId: projectId, issueId: issueId),
        ApprovalIssueListWidget(projectId: projectId, issueId: issueId),
        ProcurementIssueListWidget(projectId: projectId, issueId: issueId),
        ReportListWidget(projectId: projectId, reportId: reportId),
        // TODO: 구현 필요
        Center(),
      ],
    );
  }
}
