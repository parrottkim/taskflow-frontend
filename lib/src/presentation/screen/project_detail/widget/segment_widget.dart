import 'package:flutter/material.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/issue_list/issue_list_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_list/trip_list_widget.dart';

class SegmentWidget extends StatelessWidget {
  final int? issueId;
  final int? tripId;
  final Project item;
  final TabController controller;

  const SegmentWidget({
    super.key,
    this.issueId,
    this.tripId,
    required this.item,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        IssueListWidget(
          projectId: item.id,
          issueId: issueId,
        ),
        TripListWidget(
          projectId: item.id,
          tripId: tripId,
        ),
        // TODO: 구현 필요
        // Center(child: Text('타임라인')),
      ],
    );
  }
}
