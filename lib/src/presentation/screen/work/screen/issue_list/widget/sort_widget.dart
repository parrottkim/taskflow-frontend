import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class SortWidget extends ConsumerWidget {
  const SortWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(workIssueFilterControllerProvider);

    return ElevatedDropdownButton<WorkIssueSortOption>(
      onChanged: (value) {
        final isSameDescending =
            value == filter.sort && filter.order == SortDirection.desc;
        final nextOrder = isSameDescending
            ? SortDirection.asc
            : SortDirection.desc;

        ref.read(workIssueFilterControllerProvider.notifier)
          ..setSort(sort: value)
          ..setOrder(order: nextOrder);

        context.goNamed(
          RouteNames.work,
          queryParameters: context.buildQueryParameters(
            updates: {'sort': value.key, 'order': nextOrder.key},
          ),
        );
      },
      onClear: () {
        ref.read(workIssueFilterControllerProvider.notifier)
          ..setSort(sort: null)
          ..setOrder(order: null);

        context.goNamed(
          RouteNames.work,
          queryParameters: context.buildQueryParameters(
            updates: {'sort': null, 'order': null},
          ),
        );
      },
      items: WorkIssueSortOption.values,
      value: filter.sort,
      icon: const RotatedBox(
        quarterTurns: 1,
        child: Icon(Symbols.sync_alt_rounded),
      ),
      label: Text(Intl.message('filter_sort')),
      itemBuilder: (item) => Row(
        children: [
          Text(
            item.label,
            style: TextStyle(
              fontWeight: filter.sort == item
                  ? FontWeight.w600
                  : FontWeight.w400,
            ),
          ),
          const SizedBox(width: 4.0),
          Visibility(
            visible: filter.sort == item,
            child: RotatedBox(
              quarterTurns: filter.order == SortDirection.asc ? 0 : 2,
              child: Icon(Symbols.arrow_drop_up_rounded, size: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
