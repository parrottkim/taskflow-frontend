import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class MobileSortFilterWidget extends ConsumerWidget {
  final ValueNotifier<WorkProjectSort?> selectedSort;
  final ValueNotifier<Order?> selectedOrder;

  const MobileSortFilterWidget({
    super.key,
    required this.selectedSort,
    required this.selectedOrder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Intl.message('filter_sort'),
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 8.0),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: WorkProjectSort.values.length,
          itemBuilder: (context, index) {
            final sort = WorkProjectSort.values[index];

            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  final isSelected = selectedSort.value == sort;
                  final nextOrder = isSelected
                      ? (selectedOrder.value == Order.asc
                            ? Order.desc
                            : Order.asc)
                      : Order.desc;

                  selectedSort.value = sort;
                  selectedOrder.value = nextOrder;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        sort.label,
                        style: TextStyle(
                          fontWeight: selectedSort.value == sort
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Visibility(
                        visible: selectedSort.value == sort,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: selectedSort.value == sort ? 1.0 : 0.0,
                          child: AnimatedRotation(
                            duration: Duration(milliseconds: 200),
                            turns: selectedOrder.value == Order.asc ? 0.0 : 0.5,
                            child: Icon(
                              Symbols.arrow_drop_up_rounded,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
