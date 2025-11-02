import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ScheduleListWidget extends ConsumerWidget {
  final int projectId;
  final int? tripId;
  final List<Schedule> items;

  const ScheduleListWidget({
    super.key,
    required this.projectId,
    this.tripId,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/empty.svg',
              width: 40.0,
              height: 40.0,
              colorFilter: ColorFilter.mode(
                colorScheme.onSurface.withValues(alpha: 0.7),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              Intl.message('trip_from_schedule_empty'),
            ),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 20.0) {
          ref
              .read(
                scheduleListControllerProvider(projectId: projectId).notifier,
              )
              .load();
        }
        return false;
      },
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            ref
                .read(tripFormControllerProvider(
                        projectId: projectId, tripId: tripId)
                    .notifier)
                .setSchedule(schedule: items[index]);
            context.pop();
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Symbols.event_rounded,
                  size: 20.0,
                ),
                SizedBox(width: 4.0),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (items[index].end.isBefore(DateTime.now()))
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
                                    formatRelativeDate(items[index].end),
                                    style: textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colorScheme.onError,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else if (items[index]
                                  .start
                                  .isBefore(DateTime.now()) &&
                              items[index].end.isAfter(DateTime.now()))
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
                                    Intl.message(
                                        'trip_form_schedule_in_progress'),
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
                                    Intl.message(
                                        'trip_form_schedule_scheduled'),
                                    style: textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colorScheme.onSurface
                                          .withValues(alpha: 0.4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Skeleton.unite(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2.0),
                              decoration: ShapeDecoration(
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: Functions(context)
                                        .generateColorFromId(
                                            items[index].category.id),
                                  ),
                                ),
                                color: Functions(context)
                                    .generateColorFromId(
                                        items[index].category.id)
                                    .withValues(alpha: 0.2),
                              ),
                              child: Text(
                                items[index].category.name,
                                style: textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Functions(context).generateColorFromId(
                                      items[index].category.id),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(items[index].start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(items[index].end)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        items[index].summary,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                      Text(
                        items[index].description == null ||
                                items[index].description!.isEmpty
                            ? Intl.message(
                                'trip_form_schedule_description_empty')
                            : items[index].description!,
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
              ],
            ),
          ),
        ),
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}
