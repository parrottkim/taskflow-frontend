import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/screen/work/screen/issue_list/widget/issue_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/issue_list/widget/issue_list_widget.dart';

class IssueListScreen extends StatelessWidget {
  const IssueListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        IssueFilterWidget(),
        SizedBox(height: 8.0),
        IssueListWidget(),
      ],
    );
  }
}
