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
import 'package:taskflow/src/shared/tool/functions.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ReportListWidget extends ConsumerWidget {
  const ReportListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(workReportListControllerProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        child: ContentContainer(
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(8.0),
          child: switch (list) {
            AsyncData(:final value) => Responsive(
              desktop: _DesktopWidget(items: value.items),
              mobile: _MobileWidget(items: value.items),
            ),
            AsyncError(:final error, :final stackTrace) => ErrorStateView(
              error: error,
              stackTrace: stackTrace,
            ),
            _ => Skeletonizer(
              child: Responsive(
                desktop: _DesktopWidget(
                  items: List.filled(20, WorkReportListItem.dummy()),
                ),
                mobile: _MobileWidget(
                  items: List.filled(20, WorkReportListItem.dummy()),
                ),
              ),
            ),
          },
        ),
      ),
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  final List<WorkReportListItem> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return FixedHeaderDataTable(
      columns: [
        DataTableColumnConfig(
          label: Intl.message('work_report_column_1'),
          width: const FixedColumnWidth(160.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('work_report_column_2'),
          width: const FixedColumnWidth(220.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('work_report_column_3'),
          width: const FixedColumnWidth(190.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('work_report_column_4'),
          width: const FlexColumnWidth(1.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('work_report_column_5'),
          width: const FixedColumnWidth(190.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('work_report_column_6'),
          width: const FixedColumnWidth(180.0),
        ),
      ],
      rows: List.generate(items.length, (index) {
        final item = items[index];
        final date = item.createdAt == item.updatedAt
            ? '${formatRelativeDate(item.createdAt)} ${Intl.message('common_created_at')}'
            : '${formatRelativeDate(item.updatedAt)} ${Intl.message('common_updated_at')}';

        return DataRow(
          onSelectChanged: (_) => context.pushNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': item.projectId.toString()},
            queryParameters: context.buildQueryParameters(
              updates: {'view': 'report', 'report': item.id.toString()},
            ),
          ),
          cells: [
            DataCell(
              item.schedule != null
                  ? Skeleton.unite(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2.0,
                        ),
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Functions(
                                context,
                              ).generateColorFromId(item.schedule!.category.id),
                            ),
                          ),
                          color: Functions(context)
                              .generateColorFromId(item.schedule!.category.id)
                              .subtle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              switch (item.schedule!.category) {
                                ScheduleDomestic() =>
                                  Symbols.emoji_transportation_rounded,
                                ScheduleOverseas() =>
                                  Symbols.flight_takeoff_rounded,
                                ScheduleCenter() => Symbols.factory_rounded,
                                ScheduleRemote() => Symbols.laptop_mac_rounded,
                                ScheduleConference() =>
                                  Symbols.handshake_rounded,
                              },
                              fill: 0.0,
                              size: 16.0,
                              color: Functions(
                                context,
                              ).generateColorFromId(item.schedule!.category.id),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              item.schedule!.category.name,
                              style: textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Functions(context).generateColorFromId(
                                  item.schedule!.category.id,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Text('-'),
            ),
            DataCell(
              ClientInfo(
                clientId: item.clients.first.id,
                name: item.clients.last.name,
              ),
            ),
            DataCell(
              Text(
                item.projectCode,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            DataCell(
              Text(
                item.projectName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            DataCell(
              item.schedule != null
                  ? Row(
                      children: [
                        Icon(
                          Symbols.flight_takeoff_rounded,
                          size: 16.0,
                          fill: 1.0,
                          color: colorScheme.onSurface.strong,
                        ),
                        SizedBox(width: 6.0),
                        Text(
                          '${DateFormat('MM/dd').format(item.schedule!.start)} - ${DateFormat('MM/dd').format(item.schedule!.end)}',
                          style: TextStyle(color: colorScheme.onSurface.strong),
                        ),
                      ],
                    )
                  : Text('-'),
            ),
            DataCell(
              Text(date, style: TextStyle(color: colorScheme.onSurface.strong)),
            ),
          ],
        );
      }),
      empty: EmptyStateView(message: Intl.message('work_report_no_item')),
      onLoadMore: () =>
          ref.read(workReportListControllerProvider.notifier).load(),
    );
  }
}

class _MobileWidget extends ConsumerWidget {
  final List<WorkReportListItem> items;

  const _MobileWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (items.isEmpty) {
      return EmptyStateView(message: Intl.message('work_report_no_item'));
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 20.0) {
          ref.read(workReportListControllerProvider.notifier).load();
        }
        return false;
      },
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final clientType = ClientBrand.fromKey(item.clients.first.id);
          final date = item.createdAt == item.updatedAt
              ? '${formatRelativeDate(item.createdAt)} ${Intl.message('common_created_at')}, ${DateFormat.MMMd(Intl.getCurrentLocale()).format(item.createdAt)} ${DateFormat.jm(Intl.getCurrentLocale()).format(item.createdAt)}'
              : '${formatRelativeDate(item.updatedAt)} ${Intl.message('common_updated_at')}, ${DateFormat.MMMd(Intl.getCurrentLocale()).format(item.updatedAt)} ${DateFormat.jm(Intl.getCurrentLocale()).format(item.updatedAt)}';

          return InkWell(
            onTap: () => context.pushNamed(
              RouteNames.projectDetail,
              pathParameters: {'project_id': item.projectId.toString()},
              queryParameters: context.buildQueryParameters(
                updates: {'view': 'report', 'report': item.id.toString()},
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.schedule != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Skeleton.unite(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          decoration: ShapeDecoration(
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Functions(context).generateColorFromId(
                                  item.schedule!.category.id,
                                ),
                              ),
                            ),
                            color: Functions(context)
                                .generateColorFromId(item.schedule!.category.id)
                                .subtle,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                switch (item.schedule!.category) {
                                  ScheduleDomestic() =>
                                    Symbols.emoji_transportation_rounded,
                                  ScheduleOverseas() =>
                                    Symbols.flight_takeoff_rounded,
                                  ScheduleCenter() => Symbols.factory_rounded,
                                  ScheduleRemote() =>
                                    Symbols.laptop_mac_rounded,
                                  ScheduleConference() =>
                                    Symbols.handshake_rounded,
                                },
                                fill: 0.0,
                                size: 16.0,
                                color: Functions(context).generateColorFromId(
                                  item.schedule!.category.id,
                                ),
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                item.schedule!.category.name,
                                style: textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Functions(context).generateColorFromId(
                                    item.schedule!.category.id,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Row(
                    children: [
                      Skeleton.leaf(
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
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          item.clients.last.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    item.projectName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    item.projectCode,
                    style: TextStyle(color: colorScheme.onSurface.strong),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  ),
                  if (item.schedule != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.flight_takeoff_rounded,
                            size: 18.0,
                            fill: 1.0,
                            color: colorScheme.onSurface.strong,
                          ),
                          const SizedBox(width: 4.0),
                          Expanded(
                            child: Text(
                              '${DateFormat('MM/dd').format(item.schedule!.start)} - ${DateFormat('MM/dd').format(item.schedule!.end)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onSurface.strong,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Row(
                    children: [
                      Icon(
                        Symbols.calendar_today_rounded,
                        size: 18.0,
                        color: colorScheme.onSurface.strong,
                      ),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: Text(
                          date,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onSurface.strong,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, _) => const Divider(),
      ),
    );
  }
}
