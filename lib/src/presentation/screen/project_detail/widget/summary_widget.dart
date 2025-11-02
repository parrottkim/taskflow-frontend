import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SummaryWidget extends ConsumerWidget {
  final Project item;

  const SummaryWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 300.0, maxWidth: 300.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerWidget(
            elevation: 0.0,
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            borderRadius: BorderRadius.circular(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Intl.message('project_detail_summary_1'),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.0),
                UserInformation.compact(user: item.user)
              ],
            ),
          ),
          if (item.isClosed)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ContainerWidget(
                elevation: 0.0,
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                borderRadius: BorderRadius.circular(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Intl.message('project_detail_summary_2'),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      item.closureMessage!,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
