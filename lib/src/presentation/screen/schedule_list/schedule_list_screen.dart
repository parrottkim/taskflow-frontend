import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';

class ScheduleListScreen extends StatelessWidget {
  const ScheduleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BranchLayout(
      child: _DesktopWidget(),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  const _DesktopWidget();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
