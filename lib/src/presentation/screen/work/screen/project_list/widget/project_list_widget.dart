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

class ProjectListWidget extends ConsumerWidget {
  const ProjectListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(workProjectListControllerProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        child: ContainerWidget(
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(8.0),
          child: switch (list) {
            AsyncData(:final value) => Responsive(
              desktop: _DesktopWidget(items: value.items),
              mobile: _MobileWidget(items: value.items),
            ),
            AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
              error: error,
              stackTrace: stackTrace,
            ),
            _ => Skeletonizer(
              child: Responsive(
                desktop: _DesktopWidget(
                  items: List.filled(20, WorkProjectListItem.dummy()),
                ),
                mobile: _MobileWidget(
                  items: List.filled(10, WorkProjectListItem.dummy()),
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
  final List<WorkProjectListItem> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return FixedHeaderDataTable(
      columns: [
        DataTableColumnConfig(
          label: Intl.message('work_project_column_1'),
          width: const FixedColumnWidth(120.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('work_project_column_2'),
          width: const FixedColumnWidth(220.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('work_project_column_3'),
          width: const FixedColumnWidth(190.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('work_project_column_4'),
          width: const FlexColumnWidth(1.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('work_project_column_5'),
          width: const FixedColumnWidth(140.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('work_project_column_6'),
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
            pathParameters: {'project_id': item.id.toString()},
          ),
          cells: [
            DataCell(
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9.0,
                  vertical: 4.0,
                ),
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: switch (WorkProjectStatus.fromProject(item)) {
                    WorkProjectStatus.preexecuted => colorScheme.error,
                    WorkProjectStatus.active => colorScheme.primary,
                    WorkProjectStatus.closed => colorScheme.outline,
                  }.withValues(alpha: 0.12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: switch (WorkProjectStatus.fromProject(item)) {
                          WorkProjectStatus.preexecuted => colorScheme.error,
                          WorkProjectStatus.active => colorScheme.primary,
                          WorkProjectStatus.closed => colorScheme.outline,
                        },
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      WorkProjectStatus.fromProject(item).label,
                      style: textTheme.labelSmall?.copyWith(
                        color: switch (WorkProjectStatus.fromProject(item)) {
                          WorkProjectStatus.preexecuted => colorScheme.error,
                          WorkProjectStatus.active => colorScheme.primary,
                          WorkProjectStatus.closed => colorScheme.outline,
                        },
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DataCell(
              ClientInformation(
                clientId: item.clients.first.id,
                name: item.clients.last.name,
              ),
            ),
            DataCell(
              Text(item.code, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
            DataCell(
              Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
            DataCell(
              item.latestCategory != null
                  ? CategoryWidget(item: item.latestCategory!)
                  : Text('-'),
            ),
            DataCell(
              Text(
                date,
                style: TextStyle(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
          ],
        );
      }),
      empty: DataTableEmpty(message: Intl.message('work_project_no_item')),
      onLoadMore: () =>
          ref.read(workProjectListControllerProvider.notifier).load(),
    );
  }
}

class _MobileWidget extends ConsumerWidget {
  final List<WorkProjectListItem> items;

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
            Text(Intl.message('work_project_no_item')),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 20.0) {
          ref.read(workProjectListControllerProvider.notifier).load();
        }
        return false;
      },
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final status = WorkProjectStatus.fromProject(item);
          final statusColor = switch (status) {
            WorkProjectStatus.preexecuted => colorScheme.error,
            WorkProjectStatus.active => colorScheme.primary,
            WorkProjectStatus.closed => colorScheme.outline,
          };
          final clientType = ClientType.fromKey(item.clients.first.id);
          final date = item.createdAt == item.updatedAt
              ? '${formatRelativeDate(item.createdAt)} ${Intl.message('common_created_at')}, ${DateFormat.MMMd(Intl.getCurrentLocale()).format(item.createdAt)} ${DateFormat.jm(Intl.getCurrentLocale()).format(item.createdAt)}'
              : '${formatRelativeDate(item.updatedAt)} ${Intl.message('common_updated_at')}, ${DateFormat.MMMd(Intl.getCurrentLocale()).format(item.updatedAt)} ${DateFormat.jm(Intl.getCurrentLocale()).format(item.updatedAt)}';

          return InkWell(
            onTap: () => context.pushNamed(
              RouteNames.projectDetail,
              pathParameters: {'project_id': item.id.toString()},
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9.0,
                          vertical: 4.0,
                        ),
                        decoration: ShapeDecoration(
                          shape: const StadiumBorder(),
                          color: statusColor.withValues(alpha: 0.12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6.0,
                              height: 6.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: statusColor,
                              ),
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              status.label,
                              style: textTheme.labelSmall?.copyWith(
                                color: statusColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (item.latestCategory case final category?)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CategoryWidget(item: category),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
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
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    item.code,
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
                      Expanded(
                        child: Text(
                          date,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
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
        separatorBuilder: (_, _) => Divider(),
      ),
    );
  }
}
