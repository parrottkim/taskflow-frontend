import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class DesktopSortWidget extends ConsumerWidget {
  const DesktopSortWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      projectFilterControllerProvider(ProjectFilterScope.projectPage),
    );

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(filter: value),
      _ => Skeletonizer(
        ignoreContainers: true,
        child: _DesktopWidget(filter: ProjectFilterState()),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final ProjectFilterState filter;

  const _DesktopWidget({required this.filter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSort = useState<ProjectSort?>(filter.sort);
    final selectedOrder = useState<Order?>(filter.order);

    return ElevatedDropdownButton<ProjectSort>(
      onChanged: (value) {
        final isSortChanged = selectedSort.value != value;

        // 2. 정렬 기준이 바뀌면 무조건 desc, 같으면 토글(asc <-> desc)
        final nextOrder = isSortChanged
            ? Order.asc
            : (selectedOrder.value == Order.asc ? Order.desc : Order.asc);

        selectedSort.value = value;
        selectedOrder.value = value != null ? nextOrder : null;

        ref.read(
            projectFilterControllerProvider(
              ProjectFilterScope.projectPage,
            ).notifier,
          )
          ..setSort(sort: value)
          ..setOrder(order: nextOrder);

        context.goNamed(
          RouteNames.project,
          queryParameters: {
            if (filter.view != null) 'view': filter.view,
            if (value != null) 'sort': value.key,
            if (value != null) 'order': nextOrder.key,
            if (filter.search != null) 'search': filter.search,
            if (filter.bookmark != null) 'bookmark': filter.bookmark.toString(),
            if (filter.clients != null) 'clients': filter.clients?.join(','),
            if (filter.categories != null)
              'categories': filter.categories?.join(','),
          },
        );
      },
      items: ProjectSort.values,
      selectedItem: selectedSort,
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
              fontWeight: selectedSort.value == item
                  ? FontWeight.w600
                  : FontWeight.w400,
            ),
          ),
          const SizedBox(width: 4.0),
          Visibility(
            visible: selectedSort.value == item,
            child: RotatedBox(
              quarterTurns: selectedOrder.value == Order.asc ? 0 : 2,
              child: Icon(Symbols.arrow_drop_up_rounded, size: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
