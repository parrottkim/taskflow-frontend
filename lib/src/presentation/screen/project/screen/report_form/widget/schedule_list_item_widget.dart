import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/shared/theme/color_extension.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ScheduleDateHeader extends StatelessWidget {
  final DateTime date;
  final bool isPast;

  const ScheduleDateHeader({
    super.key,
    required this.date,
    required this.isPast,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outline.subtle)),
        color: colorScheme.surfaceBright,
      ),
      child: Text(
        '${DateFormat.MMMMd(Intl.getCurrentLocale()).format(date)} ${DateFormat.EEEE(Intl.getCurrentLocale()).format(date)}',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: isPast ? colorScheme.onSurface.muted : colorScheme.primary,
        ),
      ),
    );
  }
}

class ScheduleListItem extends StatelessWidget {
  final Schedule schedule;
  final bool isPast;
  final VoidCallback onTap;

  const ScheduleListItem({
    super.key,
    required this.schedule,
    required this.isPast,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final categoryColor = Functions(
      context,
    ).generateColorFromId(schedule.category.id);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Row(
          children: [
            Skeleton.unite(
              child: Opacity(
                opacity: isPast ? 0.4 : 1.0,
                child: Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 2.0,
                  ),
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(
                      side: BorderSide(color: categoryColor),
                    ),
                    color: categoryColor.subtle,
                  ),
                  child: Text(
                    schedule.category.name,
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: categoryColor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                schedule.summary,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isPast
                      ? colorScheme.onSurface.muted
                      : colorScheme.onSurface,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                '${DateFormat('MM/dd').format(schedule.start)} - ${DateFormat('MM/dd').format(schedule.end)}',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.strong,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
