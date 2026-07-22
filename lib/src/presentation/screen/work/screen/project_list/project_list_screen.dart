import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/screen/work/screen/project_list/widget/project_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/project_list/widget/project_list_widget.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        ProjectFilterWidget(),
        SizedBox(height: 8.0),
        ProjectListWidget(),
      ],
    );
  }
}
