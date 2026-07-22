import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

class DocumentListWidget extends ConsumerWidget {
  const DocumentListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(documentListControllerProvider);

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
                  items: [
                    ...List.filled(
                      5,
                      DocumentListItem.dummy().copyWith(fixed: true),
                    ),
                    ...List.filled(20, DocumentListItem.dummy()),
                  ],
                ),
                mobile: _MobileWidget(
                  items: [
                    ...List.filled(
                      5,
                      DocumentListItem.dummy().copyWith(fixed: true),
                    ),
                    ...List.filled(20, DocumentListItem.dummy()),
                  ],
                ),
              ),
            ),
          },
        ),
      ),
    );
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final List<DocumentListItem> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);
    final hoveredDocumentId = useState<int?>(null);
    final fixedItems = items.where((item) => item.fixed);
    final normalItems = items.where((item) => !item.fixed);
    final orderedItems = [...fixedItems, ...normalItems];

    return FixedHeaderDataTable(
      columns: [
        DataTableColumnConfig(
          label: Intl.message('document_column_1'),
          width: const FlexColumnWidth(2.5),
        ),
        DataTableColumnConfig(
          label: Intl.message('document_column_2'),
          width: const FlexColumnWidth(),
        ),
        DataTableColumnConfig(
          label: Intl.message('document_column_3'),
          width: const FixedColumnWidth(120.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('document_column_4'),
          width: const FixedColumnWidth(200.0),
        ),
        DataTableColumnConfig(
          label: Intl.message('document_column_5'),
          width: const FixedColumnWidth(100.0),
        ),
      ],
      rows: [
        for (final item in orderedItems)
          DataRow(
            onHover: (hovered) {
              hoveredDocumentId.value = hovered ? item.id : null;
            },
            onSelectChanged: (_) => {
              context.goNamed(
                RouteNames.documentDetail,
                pathParameters: {'document_id': item.id.toString()},
                queryParameters: context.buildQueryParameters(
                  updates: const {},
                ),
              ),
            },
            color: item.fixed
                ? WidgetStatePropertyAll(
                    hoveredDocumentId.value == item.id
                        ? colorScheme.surfaceContainerHigh
                        : colorScheme.surfaceContainerLow,
                  )
                : null,
            cells: [
              DataCell(
                Row(
                  children: [
                    if (item.fixed)
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
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
                            Intl.message('document_fixed'),
                            style: textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: colorScheme.onError,
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              DataCell(UserInformation.compact(user: item.createdBy)),
              DataCell(
                Row(
                  children: [
                    Skeleton.unite(
                      child: Icon(
                        Symbols.attachment_rounded,
                        size: 20.0,
                        weight: 300.0,
                        color: colorScheme.outline.withValues(alpha: 0.7),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        '${item.attachmentCount >= 10 ? '10+' : item.attachmentCount}',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DataCell(
                Text(
                  item.createdAt == item.updatedAt
                      ? '${formatRelativeDate(item.createdAt)} ${Intl.message('common_created_at')}'
                      : '${formatRelativeDate(item.updatedAt)} ${Intl.message('common_updated_at')}',
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
                      onTap: () => context.pushNamed(
                        RouteNames.documentEdit,
                        pathParameters: {'document_id': item.id.toString()},
                        queryParameters: context.buildQueryParameters(
                          updates: const {},
                        ),
                      ),
                      padding: EdgeInsets.all(4.0),
                      borderRadius: BorderRadius.circular(4.0),
                      icon: Symbols.edit_rounded,
                      size: 20.0,
                    ),
                    if (auth is AuthAuthenticated && auth.user.isAdmin ||
                        auth is AuthAuthenticated &&
                            auth.user.id == item.createdBy.id)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ElevatedIconButton(
                          onTap: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (_) => DeleteDialog(
                                title: Intl.message('document_delete_dialog_1'),
                                content: Intl.message(
                                  'document_delete_dialog_2',
                                ),
                              ),
                            );

                            if (result) {
                              await ref
                                  .read(
                                    documentSubmitControllerProvider.notifier,
                                  )
                                  .deleteDocument(documentId: item.id);
                            }
                          },
                          padding: EdgeInsets.all(4.0),
                          borderRadius: BorderRadius.circular(4.0),
                          icon: Symbols.delete_rounded,
                          size: 20.0,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
      ],
      empty: DataTableEmpty(message: Intl.message('document_no_item')),
      onLoadMore: () =>
          ref.read(documentListControllerProvider.notifier).load(),
    );
  }
}

class _MobileWidget extends ConsumerWidget {
  final List<DocumentListItem> items;

  const _MobileWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final fixedItems = items.where((item) => item.fixed).toList();
    final normalItems = items.where((item) => !item.fixed).toList();
    final orderedItems = [...fixedItems, ...normalItems];

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
            Text(Intl.message('document_no_item')),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 20.0) {
          ref.read(documentListControllerProvider.notifier).load();
        }
        return false;
      },
      child: ListView.separated(
        itemCount: orderedItems.length,
        itemBuilder: (context, index) =>
            _MobileDocumentItem(item: orderedItems[index]),
        separatorBuilder: (_, _) => const Divider(),
      ),
    );
  }
}

class _MobileDocumentItem extends ConsumerWidget {
  final DocumentListItem item;

  const _MobileDocumentItem({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final auth = ref.watch(authControllerProvider);
    final canDelete =
        auth is AuthAuthenticated &&
        (auth.user.isAdmin || auth.user.id == item.createdBy.id);
    final date = item.createdAt == item.updatedAt
        ? '${formatRelativeDate(item.createdAt)} ${Intl.message('common_created_at')}, ${DateFormat.MMMd(Intl.getCurrentLocale()).format(item.createdAt)} ${DateFormat.jm(Intl.getCurrentLocale()).format(item.createdAt)}'
        : '${formatRelativeDate(item.updatedAt)} ${Intl.message('common_updated_at')}, ${DateFormat.MMMd(Intl.getCurrentLocale()).format(item.updatedAt)} ${DateFormat.jm(Intl.getCurrentLocale()).format(item.updatedAt)}';

    return InkWell(
      onTap: () => context.goNamed(
        RouteNames.documentDetail,
        pathParameters: {'document_id': item.id.toString()},
        queryParameters: context.buildQueryParameters(updates: const {}),
      ),
      child: Container(
        color: item.fixed
            ? colorScheme.surfaceContainerLow
            : Colors.transparent,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedIconButton(
                    onTap: () => context.pushNamed(
                      RouteNames.documentEdit,
                      pathParameters: {'document_id': item.id.toString()},
                      queryParameters: context.buildQueryParameters(
                        updates: const {},
                      ),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    borderRadius: BorderRadius.circular(4.0),
                    icon: Symbols.edit_rounded,
                    size: 20.0,
                  ),
                  if (canDelete)
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: ElevatedIconButton(
                        onTap: () async {
                          final result = await showDialog<bool>(
                            context: context,
                            builder: (_) => DeleteDialog(
                              title: Intl.message('document_delete_dialog_1'),
                              content: Intl.message('document_delete_dialog_2'),
                            ),
                          );

                          if (result != true) return;

                          await ref
                              .read(documentSubmitControllerProvider.notifier)
                              .deleteDocument(documentId: item.id);
                        },
                        padding: const EdgeInsets.all(4.0),
                        borderRadius: BorderRadius.circular(4.0),
                        icon: Symbols.delete_rounded,
                        size: 20.0,
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: canDelete ? 72.0 : 36.0),
                    child: Row(
                      children: [
                        if (item.fixed)
                          Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 2.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: colorScheme.error.withValues(alpha: 0.6),
                              ),
                              child: Text(
                                Intl.message('document_fixed'),
                                style: textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.onError,
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  UserInformation.compact(user: item.createdBy),
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
          ],
        ),
      ),
    );
  }
}
