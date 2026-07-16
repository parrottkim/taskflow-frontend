import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/timeline/widget/schedule_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/timeline/widget/timeline_widget.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.0),
        ScheduleFilterWidget(),
        SizedBox(height: 8.0),
        TimelineWidget(),
      ],
    );
  }
}
