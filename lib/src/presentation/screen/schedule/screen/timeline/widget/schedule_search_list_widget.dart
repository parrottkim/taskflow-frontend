import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ScheduleSearchListWidget extends ConsumerWidget {
  const ScheduleSearchListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedules = ref.watch(scheduleListControllerProvider());

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ContainerWidget(
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(8.0),
          child: switch (schedules) {
            AsyncData(value: final value) => Responsive(
              desktop: _DesktopWidget(items: value.flattenedItems),
              mobile: _MobileWidget(items: value.flattenedItems),
            ),
            AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
              error: error,
              stackTrace: stackTrace,
            ),
            _ => Skeletonizer(
              child: Responsive(
                desktop: _DesktopWidget(
                  items: List.filled(12, Schedule.dummy()),
                ),
                mobile: _MobileWidget(items: List.filled(12, Schedule.dummy())),
              ),
            ),
          },
        ),
      ),
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  final List<Schedule> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return FixedHeaderDataTable(
      columns: [
        DataTableColumnConfig(
          label: Intl.message('schedule_column_1'),
          width: const FixedColumnWidth(220.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('schedule_column_2'),
          width: const FlexColumnWidth(1.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('schedule_column_3'),
          width: const FlexColumnWidth(1.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('schedule_column_4'),
          width: const FixedColumnWidth(220.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('schedule_column_5'),
          width: const FixedColumnWidth(220.0),
        ),
      ],
      rows: [
        for (final schedule in items)
          DataRow(
            onSelectChanged: (_) {
              context.goNamed(
                RouteNames.projectDetail,
                pathParameters: {'project_id': schedule.projectId.toString()},
              );
            },
            cells: [
              DataCell(
                ClientInformation(
                  clientId: schedule.projectClientId,
                  name: schedule.projectClientName,
                ),
              ),
              DataCell(Text(schedule.summary)),
              DataCell(Text(schedule.description ?? '')),
              DataCell(UserInformation.compact(user: schedule.user)),
              DataCell(
                Text(
                  '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule.end)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ],
          ),
      ],
      empty: DataTableEmpty(message: Intl.message('schedule_search_empty')),
      onLoadMore: () =>
          ref.read(scheduleListControllerProvider().notifier).loadNext(),
    );
  }
}

class _MobileWidget extends ConsumerWidget {
  final List<Schedule> items;

  const _MobileWidget({required this.items});

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
            Text('검색 결과가 없습니다.'),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 20.0) {
          ref.read(scheduleListControllerProvider().notifier).loadNext();
        }
        return false;
      },
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) => _MobileItem(
          item: items[index],
          textTheme: textTheme,
          colorScheme: colorScheme,
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}

class _MobileItem extends StatelessWidget {
  final Schedule item;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _MobileItem({
    required this.item,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final dateText =
        '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(item.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(item.end)}';

    return InkWell(
      onTap: () {
        context.goNamed(
          RouteNames.projectDetail,
          pathParameters: {'project_id': item.projectId.toString()},
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClientInformation(
              clientId: item.projectClientId,
              name: item.projectClientName,
            ),
            const SizedBox(height: 16.0),
            Text(
              item.summary.isEmpty ? item.projectName : item.summary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              item.projectName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Row(
              children: [
                Icon(
                  Symbols.calendar_today_rounded,
                  size: 18.0,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                const SizedBox(width: 4.0),
                Text(
                  dateText,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                children: [
                  Icon(
                    Symbols.person_rounded,
                    size: 18.0,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    item.user.username,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  if (item.user.department != null)
                    Text(
                      ' • ${item.user.department!.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
