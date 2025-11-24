import 'package:flutter/material.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_list/issue_list_widget.dart';
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
        IssueListWidget(
          projectId: project.id,
          issueId: issueId,
        ),
        ReportListWidget(
          projectId: project.id,
          reportId: reportId,
        ),
        // TODO: 구현 필요
        Center(),
      ],
    );
  }
}
