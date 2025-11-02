import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/preset.dart';

class MobileSortFilterWidget extends ConsumerWidget {
  final ValueNotifier<ProjectSort?> selectedSort;
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
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: ProjectSort.values.length,
          itemBuilder: (context, index) => Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (selectedSort.value == ProjectSort.values[index]) {
                  selectedOrder.value =
                      selectedOrder.value?.toggled ?? Order.desc;
                } else {
                  selectedSort.value = ProjectSort.values[index];
                  selectedOrder.value = Order.desc;
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    Text(
                      ProjectSort.values[index].label,
                      style: TextStyle(
                        fontWeight: selectedSort.value != null &&
                                selectedSort.value == ProjectSort.values[index]
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Visibility(
                      visible: selectedSort.value == ProjectSort.values[index],
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: selectedSort.value == ProjectSort.values[index]
                            ? 1.0
                            : 0.0,
                        child: AnimatedRotation(
                          duration: Duration(milliseconds: 200),
                          turns: selectedOrder.value == Order.asc ? 0.0 : 0.5,
                          child:
                              Icon(Symbols.arrow_drop_up_rounded, size: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
