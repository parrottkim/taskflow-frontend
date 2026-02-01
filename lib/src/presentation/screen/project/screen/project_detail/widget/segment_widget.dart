import 'package:flutter/material.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/contract_issue_list/contract_issue_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/approval_issue_list/approval_issue_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/procurement_issue_list/procurement_issue_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_list/report_list_widget.dart';

class SegmentWidget extends StatelessWidget {
  final int? issueId;
  final int? reportId;
  final Project project;
  final TabController controller;

  const SegmentWidget({
    super.key,
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
        ContractIssueListWidget(),
        ApprovalIssueListWidget(),
        ProcurementIssueListWidget(),
        ReportListWidget(),
        // TODO: 구현 필요
        Center(),
      ],
    );
  }
}
