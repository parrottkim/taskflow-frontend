import 'dart:convert';
import 'dart:js_interop';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/trip_list/widget/fuel_expense_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_list/widget/trip_details_widget.dart';
import 'package:taskflow/src/presentation/widget/overlay.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/js_interop.dart';
import 'package:universal_html/html.dart';

class TripItemWidget extends HookConsumerWidget {
  final Trip item;

  const TripItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
        tripFilterControllerProvider(categoryId: item.schedule.category.id));

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
          item: item,
          categories: value.categories,
          steps: value.steps,
          regulations: value.regulations,
        ),
      AsyncError(:final error, :final stackTrace) =>
        ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
          child: _DesktopWidget(
            item: item,
            categories: [],
            steps: [],
            regulations: [],
          ),
        ),
    };
  }
}

class _DesktopWidget extends HookWidget {
  final Trip item;
  final List<TripCategory> categories;
  final List<TripStep> steps;
  final List<TripRegulation> regulations;

  const _DesktopWidget({
    required this.item,
    required this.categories,
    required this.steps,
    required this.regulations,
  });

  @override
  Widget build(BuildContext context) {
    final expanded = useState(false);
    final htmlElementId = useState<String?>(null);

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (expanded.value) {
        sizeController.forward();
      } else {
        sizeController.reverse();
      }
      return null;
    }, [expanded.value]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO: 구현 필요
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //   child: TextButton.icon(
        //     onPressed: () async {},
        //     icon: Icon(
        //       Symbols.print_rounded,
        //     ),
        //     label: Text(
        //       Intl.message('common_print'),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextButton.icon(
            onPressed: () => expanded.value = !expanded.value,
            icon: AnimatedRotation(
              turns: expanded.value ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Icon(Symbols.arrow_drop_down_rounded),
            ),
            label: Text(
              expanded.value
                  ? Intl.message('common_fold')
                  : Intl.message('common_unfold'),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        SizeTransition(
          sizeFactor: sizeController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) => TripDetailsWidget(
                  schedule: item.schedule,
                  category: categories[index],
                  steps: steps.where((e) => e.categoryId == index + 1).toList(),
                  regulations: regulations,
                  expenses: item.expenses,
                  rates: item.rates,
                  isDeducted: item.isDeducted,
                ),
              ),
              if (item.schedule.category is ScheduleDomestic &&
                  item.fuel != null)
                FuelExpenseWidget(fuel: item.fuel!),
            ],
          ),
        ),
      ],
    );
  }
}
