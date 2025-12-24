import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/preset.dart';
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
    final state = ref.watch(projectListControllerProvider);
    final dummy = List.filled(20, Project.dummy());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ContainerWidget(
        elevation: 0.0,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(8.0),
        child: switch (state) {
          AsyncData(:final value) => Responsive(
              desktop: _DesktopWidget(
                items: value.items,
              ),
              mobile: _MobileWidget(
                items: value.items,
              ),
            ),
          AsyncError(:final error, :final stackTrace) =>
            ErrorContainerWidget(error: error, stackTrace: stackTrace),
          _ => Skeletonizer(
              child: Responsive(
                desktop: _DesktopWidget(
                  items: dummy,
                ),
                mobile: _MobileWidget(
                  items: dummy,
                ),
              ),
            ),
        },
      ),
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final List<Project> items;

  const _DesktopWidget({
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Skeleton.keep(
          child: DataTable(
            headingRowHeight: 48.0,
            showCheckboxColumn: false,
            columns: [
              DataColumn(
                columnWidth: FixedColumnWidth(220.0),
                label: Text(
                  Intl.message('project_column_1'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FixedColumnWidth(200.0),
                label: Text(
                  Intl.message('project_column_2'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(1.0),
                label: Text(
                  Intl.message('project_column_3'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FixedColumnWidth(140.0),
                label: Text(
                  Intl.message('project_column_4'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FixedColumnWidth(140.0),
                label: Text(
                  Intl.message('project_column_5'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FixedColumnWidth(140.0),
                label: Text(
                  Intl.message('project_column_6'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FixedColumnWidth(100.0),
                label: Text(
                  Intl.message('project_column_7'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ],
            rows: [],
          ),
        ),
        Divider(),
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
                    Intl.message('project_no_item'),
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
                  ref.read(projectListControllerProvider.notifier).load();
                }
                return false;
              },
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowHeight: 0.0,
                  showCheckboxColumn: false,
                  columns: [
                    DataColumn(
                      columnWidth: FixedColumnWidth(220.0),
                      label: Text(
                        Intl.message('project_column_1'),
                      ),
                    ),
                    DataColumn(
                      columnWidth: FixedColumnWidth(200.0),
                      label: Text(
                        Intl.message('project_column_2'),
                      ),
                    ),
                    DataColumn(
                      columnWidth: FlexColumnWidth(1.0),
                      label: Text(
                        Intl.message('project_column_3'),
                      ),
                    ),
                    DataColumn(
                      columnWidth: FixedColumnWidth(140.0),
                      label: Text(
                        Intl.message('project_column_4'),
                      ),
                    ),
                    DataColumn(
                      columnWidth: FixedColumnWidth(140.0),
                      label: Text(
                        Intl.message('project_column_5'),
                      ),
                    ),
                    DataColumn(
                      columnWidth: FixedColumnWidth(140.0),
                      label: Text(
                        Intl.message('project_column_6'),
                      ),
                    ),
                    DataColumn(
                      columnWidth: FixedColumnWidth(100.0),
                      label: Text(
                        Intl.message('project_column_7'),
                      ),
                    ),
                  ],
                  rows: List.generate(
                    items.length,
                    (index) => DataRow(
                      onSelectChanged: (value) => context
                          .goNamed(RouteNames.projectDetail, pathParameters: {
                        'project_id': items[index].id.toString()
                      }),
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
                                      ClientType.values
                                          .singleWhere((client) =>
                                              client.id ==
                                              items[index].clients.first.id)
                                          .color,
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: 16.0,
                                    height: 16.0,
                                    child: SvgPicture.asset(
                                      ClientType.values
                                          .singleWhere((client) =>
                                              client.id ==
                                              items[index].clients.first.id)
                                          .asset,
                                      colorFilter: ColorFilter.mode(
                                          Colors.white, BlendMode.srcIn),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.0),
                              Text(
                                items[index].clients.last.name,
                                style: textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(items[index].code)),
                        DataCell(
                          Row(
                            children: [
                              if (items[index].isPreexecuted)
                                Padding(
                                  padding: EdgeInsets.only(right: 6.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: colorScheme.error
                                          .withValues(alpha: 0.6),
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
                              if (items[index].isClosed)
                                Padding(
                                  padding: EdgeInsets.only(right: 6.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: colorScheme.onSurface
                                          .withValues(alpha: 0.6),
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
                              Text(items[index].name),
                            ],
                          ),
                        ),
                        DataCell(
                          items[index].latestCategory != null
                              ? CategoryWidget(
                                  item: items[index].latestCategory!)
                              : Text('-'),
                        ),
                        DataCell(
                          items[index].manager != null
                              ? UserInformation.compact(
                                  user: items[index].manager!)
                              : Text('-'),
                        ),
                        DataCell(
                          Text(
                            formatRelativeDate(items[index].createdAt),
                            style: TextStyle(
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
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
                                      .read(projectListControllerProvider
                                          .notifier)
                                      .toggleBookmark(
                                          id: items[index].id,
                                          bookmarked:
                                              !items[index].isBookmarked);
                                },
                                padding: EdgeInsets.all(4.0),
                                borderRadius: BorderRadius.circular(4.0),
                                icon: Symbols.bookmark_rounded,
                                size: 20.0,
                                fill: items[index].isBookmarked ? 1.0 : 0.0,
                              ),
                              if (auth is AuthAuthenticated &&
                                      auth.user.isAdmin ||
                                  auth is AuthAuthenticated &&
                                      auth.user == items[index].user)
                                Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: ElevatedIconButton(
                                    onTap: !items[index].isClosed
                                        ? () => context.goNamed(
                                                RouteNames.projectEdit,
                                                pathParameters: {
                                                  'project_id':
                                                      items[index].id.toString()
                                                })
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
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _MobileWidget extends HookConsumerWidget {
  final List<Project> items;

  const _MobileWidget({
    required this.items,
  });

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
            Text(
              Intl.message('project_no_item'),
            ),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 20.0) {
          ref.read(projectListControllerProvider.notifier).load();
        }
        return false;
      },
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.goNamed(RouteNames.projectDetail,
                pathParameters: {'project_id': items[index].id.toString()});
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedIconButton(
                      onTap: () async {
                        await ref
                            .read(projectListControllerProvider.notifier)
                            .toggleBookmark(
                                id: items[index].id,
                                bookmarked: !items[index].isBookmarked);
                      },
                      padding: EdgeInsets.all(4.0),
                      borderRadius: BorderRadius.circular(4.0),
                      icon: Symbols.bookmark_rounded,
                      size: 20.0,
                      fill: items[index].isBookmarked ? 1.0 : 0.0,
                    ),
                    if (auth is AuthAuthenticated && auth.user.isAdmin)
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: ElevatedIconButton(
                          onTap: () => context.goNamed(RouteNames.projectEdit,
                              pathParameters: {
                                'project_id': items[index].id.toString()
                              }),
                          padding: EdgeInsets.all(4.0),
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
                    if (items[index].isPreexecuted || items[index].isClosed)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            if (items[index].isPreexecuted)
                              Padding(
                                padding: EdgeInsets.only(right: 6.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: colorScheme.error
                                        .withValues(alpha: 0.6),
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
                            if (items[index].isClosed)
                              Padding(
                                padding: EdgeInsets.only(right: 6.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.6),
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
                    if (items[index].latestCategory != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child:
                            CategoryWidget(item: items[index].latestCategory!),
                      ),
                    Row(
                      children: [
                        Skeleton.leaf(
                          child: Container(
                            padding: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Color(
                                ClientType.values
                                    .singleWhere((client) =>
                                        client.id ==
                                        items[index].clients.first.id)
                                    .color,
                              ),
                            ),
                            child: SizedBox(
                              width: 16.0,
                              height: 16.0,
                              child: SvgPicture.asset(
                                ClientType.values
                                    .singleWhere((client) =>
                                        client.id ==
                                        items[index].clients.first.id)
                                    .asset,
                                colorFilter: ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          items[index].clients.last.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      items[index].name,
                      maxLines: Responsive.isMobile(context) ? 2 : 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      items[index].code,
                      style: TextStyle(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                    Padding(
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
                        SizedBox(width: 4.0),
                        Text(
                          '${formatRelativeDate(items[index].createdAt)}, ${DateFormat.MMMd(Intl.getCurrentLocale()).format(items[index].createdAt)} ${DateFormat.jm(Intl.getCurrentLocale()).format(items[index].createdAt)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                    if (items[index].manager != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            Icon(
                              Symbols.person_rounded,
                              size: 18.0,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              items[index].manager!.username,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.6),
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
        ),
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}
