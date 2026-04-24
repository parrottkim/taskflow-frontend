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
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
        sort: value.sort,
        order: value.order,
      ),
      _ => Skeletonizer(ignoreContainers: true, child: _DesktopWidget()),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final ProjectSort? sort;
  final Order? order;

  const _DesktopWidget({this.sort, this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSort = useState<ProjectSort?>(sort);
    final selectedOrder = useState<Order?>(order);

    useEffect(() {
      selectedSort.value = sort;
      return null;
    }, [sort]);

    useEffect(() {
      selectedOrder.value = order;
      return null;
    }, [order]);

    return ElevatedDropdownButton<ProjectSort>(
      onChanged: (value) {
        if (value == null) {
          selectedSort.value = null;
          selectedOrder.value = null;
        }

        selectedSort.value = value;
        selectedOrder.value = selectedOrder.value == Order.asc
            ? Order.desc
            : Order.asc;

        ref.read(projectFilterControllerProvider.notifier).setSort(sort: value);
        ref
            .read(projectFilterControllerProvider.notifier)
            .setOrder(order: selectedOrder.value);

        final queryParameters = ref
            .read(projectFilterControllerProvider.notifier)
            .toQueryParameters();

        context.goNamed(RouteNames.project, queryParameters: queryParameters);
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
