import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KickoffDisplayItem extends StatelessWidget {
  final DateTime kickoffDate;

  const KickoffDisplayItem({super.key, required this.kickoffDate});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: colorScheme.surfaceContainer,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Intl.message('project_detail_kickoff'),
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 8.0),
            Text(DateFormat.yMMMd().format(kickoffDate.toLocal())),
          ],
        ),
      ),
    );
  }
}
