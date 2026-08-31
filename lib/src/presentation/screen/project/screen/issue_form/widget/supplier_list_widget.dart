import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SupplierListWidget extends HookConsumerWidget {
  final int itemIndex;
  final List<Supplier> items;

  const SupplierListWidget({
    super.key,
    required this.itemIndex,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formController = IssueFormScope.of(context).controller(ref);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (items.isEmpty) {
      return EmptyStateView(message: Intl.message('issue_form_procurement_14'));
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
            formController.updateProcurementIssueItem(
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
                          color: colorScheme.onSurface.strong,
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
                                color: colorScheme.onSurface.strong,
                              ),
                              SizedBox(width: 4.0),
                              Expanded(
                                child: Text(
                                  items[index].address!,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface.strong,
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
                                color: colorScheme.onSurface.strong,
                              ),
                              SizedBox(width: 2.0),
                              Expanded(
                                child: Text(
                                  items[index].phone!,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface.strong,
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
