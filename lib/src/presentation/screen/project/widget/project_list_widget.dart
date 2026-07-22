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
  final String? view;
  final String? sort;
  final String? order;
  final String? search;
  final String? bookmark;
  final String? clients;
  final String? categories;

  const ProjectListWidget({
    super.key,
    this.view,
    this.sort,
    this.order,
    this.search,
    this.bookmark,
    this.clients,
    this.categories,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(
      projectListControllerProvider(ProjectFilterScope.projectPage),
    );

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
                  items: List.filled(20, ProjectListItem.dummy()),
                ),
                mobile: _MobileWidget(
                  items: List.filled(20, ProjectListItem.dummy()),
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
  final List<ProjectListItem> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);

    return FixedHeaderDataTable(
      columns: [
        DataTableColumnConfig(
          label: Intl.message('project_column_1'),
          width: const FixedColumnWidth(220.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('project_column_2'),
          width: const FixedColumnWidth(200.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('project_column_3'),
          width: const FlexColumnWidth(1.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('project_column_4'),
          width: const FixedColumnWidth(140.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('project_column_5'),
          width: const FixedColumnWidth(140.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('project_column_6'),
          width: const FixedColumnWidth(140.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('project_column_7'),
          width: const FixedColumnWidth(100.0),
        ),
      ],
      rows: List.generate(items.length, (index) {
        final item = items[index];
        final date = item.createdAt == item.updatedAt
            ? '${formatRelativeDate(item.createdAt)} ${Intl.message('common_created_at')}'
            : '${formatRelativeDate(item.updatedAt)} ${Intl.message('common_updated_at')}';

        return DataRow(
          onSelectChanged: (value) => context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {'project_id': item.id.toString()},
          ),
          cells: [
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
              Row(
                children: [
                  if (item.isPreexecuted)
                    Padding(
                      padding: EdgeInsets.only(right: 6.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: colorScheme.error.withValues(alpha: 0.6),
                        ),
                        child: Text(
                          Intl.message('project_preexecuted'),
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onError,
                          ),
                        ),
                      ),
                    ),
                  if (item.isClosed)
                    Padding(
                      padding: EdgeInsets.only(right: 6.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                        child: Text(
                          Intl.message('project_closed'),
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            DataCell(
              item.latestCategory != null
                  ? CategoryWidget(item: item.latestCategory!)
                  : Text('-'),
            ),
            DataCell(
              item.manager != null
                  ? UserInformation.compact(user: item.manager!)
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
            DataCell(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedIconButton(
                    onTap: () async {
                      await ref
                          .read(
                            projectListControllerProvider(
                              ProjectFilterScope.projectPage,
                            ).notifier,
                          )
                          .toggleBookmark(
                            id: item.id,
                            bookmarked: !item.isBookmarked,
                          );
                    },
                    padding: EdgeInsets.all(4.0),
                    borderRadius: BorderRadius.circular(4.0),
                    icon: Symbols.bookmark_rounded,
                    size: 20.0,
                    fill: item.isBookmarked ? 1.0 : 0.0,
                  ),
                  if (auth is AuthAuthenticated && auth.user.isAdmin ||
                      auth is AuthAuthenticated &&
                          auth.user.id == item.createdBy.id)
                    Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: ElevatedIconButton(
                        onTap: !item.isClosed
                            ? () => context.goNamed(
                                RouteNames.projectEdit,
                                pathParameters: {
                                  'project_id': item.id.toString(),
                                },
                              )
                            : null,
                        padding: EdgeInsets.all(4.0),
                        borderRadius: BorderRadius.circular(4.0),
                        icon: Symbols.edit_square_rounded,
                        size: 20.0,
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      }),
      empty: DataTableEmpty(message: Intl.message('project_no_item')),
      onLoadMore: () => ref
          .read(
            projectListControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          .load(),
    );
  }
}

class _MobileWidget extends ConsumerWidget {
  final List<ProjectListItem> items;

  const _MobileWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final auth = ref.watch(authControllerProvider);

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
            Text(Intl.message('project_no_item')),
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
                projectListControllerProvider(
                  ProjectFilterScope.projectPage,
                ).notifier,
              )
              .load();
        }
        return false;
      },
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final canEdit =
              auth is AuthAuthenticated &&
              (auth.user.isAdmin || auth.user.id == item.createdBy.id);
          final clientType = ClientType.fromKey(item.clients.first.id);
          final date = item.createdAt == item.updatedAt
              ? '${formatRelativeDate(item.createdAt)} ${Intl.message('common_created_at')}, ${DateFormat.MMMd(Intl.getCurrentLocale()).format(item.createdAt)} ${DateFormat.jm(Intl.getCurrentLocale()).format(item.createdAt)}'
              : '${formatRelativeDate(item.updatedAt)} ${Intl.message('common_updated_at')}, ${DateFormat.MMMd(Intl.getCurrentLocale()).format(item.updatedAt)} ${DateFormat.jm(Intl.getCurrentLocale()).format(item.updatedAt)}';

          return InkWell(
            onTap: () => context.goNamed(
              RouteNames.projectDetail,
              pathParameters: {'project_id': item.id.toString()},
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedIconButton(
                        onTap: () async {
                          await ref
                              .read(
                                projectListControllerProvider(
                                  ProjectFilterScope.projectPage,
                                ).notifier,
                              )
                              .toggleBookmark(
                                id: item.id,
                                bookmarked: !item.isBookmarked,
                              );
                        },
                        padding: const EdgeInsets.all(4.0),
                        borderRadius: BorderRadius.circular(4.0),
                        icon: Symbols.bookmark_rounded,
                        size: 20.0,
                        fill: item.isBookmarked ? 1.0 : 0.0,
                      ),
                      if (canEdit)
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: ElevatedIconButton(
                            onTap: !item.isClosed
                                ? () => context.goNamed(
                                    RouteNames.projectEdit,
                                    pathParameters: {
                                      'project_id': item.id.toString(),
                                    },
                                  )
                                : null,
                            padding: const EdgeInsets.all(4.0),
                            borderRadius: BorderRadius.circular(4.0),
                            icon: Symbols.edit_square_rounded,
                            size: 20.0,
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.isPreexecuted || item.isClosed)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              if (item.isPreexecuted)
                                Padding(
                                  padding: const EdgeInsets.only(right: 6.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 2.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: colorScheme.error.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                    child: Text(
                                      Intl.message('project_preexecuted'),
                                      style: textTheme.labelSmall?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: colorScheme.onError,
                                      ),
                                    ),
                                  ),
                                ),
                              if (item.isClosed)
                                Padding(
                                  padding: const EdgeInsets.only(right: 6.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 2.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                    child: Text(
                                      Intl.message('project_closed'),
                                      style: textTheme.labelSmall?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: colorScheme.surface,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      if (item.latestCategory case final category?)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: CategoryWidget(item: category),
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
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
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
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (item.manager case final manager?)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              Icon(
                                Symbols.person_rounded,
                                size: 18.0,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: Text(
                                  manager.username,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.6,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, _) => const Divider(),
      ),
    );
  }
}
