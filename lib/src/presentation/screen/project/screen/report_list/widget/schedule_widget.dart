import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ScheduleWidget extends StatelessWidget {
  final Schedule schedule;

  const ScheduleWidget({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
      ),
      child: ContainerWidget(
        padding: EdgeInsets.all(12.0),
        constraints: BoxConstraints(maxWidth: 430.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (schedule.end.isBefore(DateTime.now()))
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Skeleton.unite(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: colorScheme.error,
                        ),
                        child: Text(
                          formatRelativeDate(schedule.end),
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onError,
                          ),
                        ),
                      ),
                    ),
                  )
                else if (schedule.start.isBefore(DateTime.now()) &&
                    schedule.end.isAfter(DateTime.now()))
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Skeleton.unite(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: colorScheme.primary,
                        ),
                        child: Text(
                          Intl.message('report_form_schedule_in_progress'),
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Skeleton.unite(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: colorScheme.surfaceContainerHighest,
                        ),
                        child: Text(
                          Intl.message('report_form_schedule_scheduled'),
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onSurface.withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                    ),
                  ),
                Skeleton.unite(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Functions(context)
                              .generateColorFromId(schedule.category.id),
                        ),
                      ),
                      color: Functions(context)
                          .generateColorFromId(schedule.category.id)
                          .withValues(alpha: 0.2),
                    ),
                    child: Text(
                      schedule.category.name,
                      style: textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Functions(context)
                            .generateColorFromId(schedule.category.id),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule.end)}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              schedule.summary,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(
                  alpha: 0.7,
                ),
              ),
            ),
            Text(
              schedule.description == null || schedule.description!.isEmpty
                  ? Intl.message('report_form_schedule_description_empty')
                  : schedule.description!,
              maxLines: 1,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(
                  alpha: 0.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
