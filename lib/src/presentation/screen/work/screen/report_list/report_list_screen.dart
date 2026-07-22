import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/screen/work/screen/report_list/widget/report_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/report_list/widget/report_list_widget.dart';

class ReportListScreen extends StatelessWidget {
  const ReportListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        ReportFilterWidget(),
        SizedBox(height: 8.0),
        ReportListWidget(),
      ],
    );
  }
}
