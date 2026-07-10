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
              desktop: _DesktopWidget(items: _flatten(value.items)),
              mobile: _MobileWidget(items: _flatten(value.items)),
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

  List<Schedule> _flatten(List<ScheduleGroup> groups) {
    final seenIds = <int>{};
    final items = <Schedule>[];

    for (final group in groups) {
      for (final schedule in group.items) {
        if (seenIds.add(schedule.id)) {
          items.add(schedule);
        }
      }
    }

    items.sort((a, b) {
      final startCompare = a.start.compareTo(b.start);
      return startCompare == 0 ? a.id.compareTo(b.id) : startCompare;
    });

    return items;
  }
}

class _DesktopWidget extends ConsumerWidget {
  final List<Schedule> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Skeleton.keep(
          child: DataTable(
            headingRowHeight: 48.0,
            showCheckboxColumn: false,
            columns: _columns(context, showLabels: true),
            rows: const [],
          ),
        ),
        const Divider(),
        if (items.isEmpty)
          Expanded(
            child: Center(
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
                    Intl.message('schedule_search_empty'),
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          )
        else
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels >=
                    notification.metrics.maxScrollExtent - 20.0) {
                  ref
                      .read(scheduleListControllerProvider().notifier)
                      .loadNext();
                }
                return false;
              },
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowHeight: 0.0,
                  showCheckboxColumn: false,
                  columns: _columns(context, showLabels: false),
                  rows: List.generate(
                    items.length,
                    (index) =>
                        _scheduleRow(context: context, schedule: items[index]),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  List<DataColumn> _columns(BuildContext context, {required bool showLabels}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return [
      DataColumn(
        columnWidth: const FixedColumnWidth(220.0),
        label: Text(
          Intl.message('schedule_column_1'),
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ),
      DataColumn(
        columnWidth: const FlexColumnWidth(1.0),
        label: Text(
          Intl.message('schedule_column_2'),
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ),
      DataColumn(
        columnWidth: const FlexColumnWidth(1.0),
        label: Text(
          Intl.message('schedule_column_3'),
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ),
      DataColumn(
        columnWidth: const FixedColumnWidth(220.0),
        label: Text(
          Intl.message('schedule_column_4'),
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ),
      DataColumn(
        columnWidth: const FixedColumnWidth(220.0),
        label: Text(
          Intl.message('schedule_column_5'),
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ),
    ];
  }

  DataRow _scheduleRow({
    required BuildContext context,
    required Schedule schedule,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final dateText =
        '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(schedule.end)}';

    return DataRow(
      onSelectChanged: (value) {
        context.goNamed(
          RouteNames.projectDetail,
          pathParameters: {'project_id': schedule.projectId.toString()},
        );
      },
      cells: [
        DataCell(
          Row(
            children: [
              Skeleton.leaf(
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(
                      ClientType.fromKey(schedule.projectClientId).color,
                    ),
                  ),
                  child: SizedBox(
                    width: 16.0,
                    height: 16.0,
                    child: SvgPicture.asset(
                      ClientType.fromKey(schedule.projectClientId).asset,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.0),
              Text(
                schedule.projectClientName,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        DataCell(Text(schedule.summary)),
        DataCell(Text(schedule.description ?? '')),
        DataCell(UserInformation.compact(user: schedule.user)),
        DataCell(
          Text(
            dateText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ),
      ],
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
    final clientType = ClientType.fromKey(item.projectClientId);
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
            Row(
              children: [
                _ClientIcon(clientType: clientType),
                const SizedBox(width: 8.0),
                Text(
                  item.projectClientName,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              item.summary.isEmpty ? item.projectName : item.summary,
              maxLines: Responsive.isMobile(context) ? 2 : 1,
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

class _ClientIcon extends StatelessWidget {
  final ClientType clientType;

  const _ClientIcon({required this.clientType});

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color(clientType.color),
        ),
        child: SizedBox(
          width: 16.0,
          height: 16.0,
          child: SvgPicture.asset(
            clientType.asset,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
