import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';

class SupplierListWidget extends HookConsumerWidget {
  final int projectId;
  final int categoryId;
  final int? issueId;
  final int itemIndex;
  final List<Supplier> items;

  const SupplierListWidget({
    super.key,
    required this.projectId,
    required this.categoryId,
    this.issueId,
    required this.itemIndex,
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
            Text(Intl.message('issue_form_procurement_14')),
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
                supplierListControllerProvider(
                  SupplierFilterScope.issueSupplierDialog,
                ).notifier,
              )
              .load();
        }
        return false;
      },
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            ref
                .read(
                  issueFormControllerProvider(
                    projectId: projectId,
                    categoryId: categoryId,
                    issueId: issueId,
                  ).notifier,
                )
                .updateProcurementIssueItem(
                  index: itemIndex,
                  supplier: items[index],
                );
            context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: items[index].logo != null
                        ? Colors.white
                        : colorScheme.primary,
                  ),
                  child: items[index].logo != null
                      ? Image.network(
                          items[index].logo!,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => Icon(
                            Symbols.public_rounded,
                            size: 36.0,
                            color: colorScheme.onPrimary,
                          ),
                        )
                      : Icon(
                          Symbols.public_rounded,
                          size: 36.0,
                          color: colorScheme.onPrimary,
                        ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index].name,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        items[index].number,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      if (items[index].address != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              Icon(
                                Symbols.location_on_rounded,
                                size: 16.0,
                                fill: 1.0,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                              SizedBox(width: 4.0),
                              Expanded(
                                child: Text(
                                  items[index].address!,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.7,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (items[index].phone != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              Icon(
                                Symbols.call_rounded,
                                size: 16.0,
                                fill: 1.0,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                              SizedBox(width: 2.0),
                              Expanded(
                                child: Text(
                                  items[index].phone!,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.7,
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
          ),
        ),
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}
