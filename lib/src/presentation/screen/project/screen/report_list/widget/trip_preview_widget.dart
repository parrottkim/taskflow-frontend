import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_list/widget/fuel_expense_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_list/widget/trip_details_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class TripPreviewWidget extends HookConsumerWidget {
  final Report item;

  const TripPreviewWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      tripFilterControllerProvider(categoryId: item.schedule?.category.id),
    );

    ref.listen(tripPreviewControllerProvider, (_, state) {
      if (state is TripPreviewLoading) {
        TextOverlay.show(context, Intl.message('report_list_loading_1'));
      } else if (state is TripPreviewRendering) {
        TextOverlay.hide();
        TextOverlay.show(context, Intl.message('report_list_loading_2'));
      } else {
        TextOverlay.hide();
      }
    });

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
        item: item,
        categories: value.categories,
        steps: value.steps,
        regulations: value.regulations,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
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

class _DesktopWidget extends HookConsumerWidget {
  final Report item;
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
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    final expanded = useState(false);

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

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (auth is AuthAuthenticated &&
              auth.user.id == item.user.id &&
              (item.schedule is ScheduleDomestic ||
                  item.schedule is ScheduleOverseas))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton.icon(
                onPressed: () async {
                  await ref
                      .read(tripPreviewControllerProvider.notifier)
                      .preview(tripId: item.id);
                },
                icon: Icon(Symbols.print_rounded),
                label: Text(Intl.message('common_print')),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              SizeTransition(
                sizeFactor: sizeController,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        itemBuilder: (context, index) => TripDetailsWidget(
                          schedule: item.schedule!,
                          category: categories[index],
                          steps: steps
                              .where((e) => e.categoryId == index + 1)
                              .toList(),
                          regulations: regulations,
                          expenses: item.trip!.expenses,
                          rates: item.trip!.rates,
                          isDeducted: item.trip!.isDeducted,
                        ),
                      ),
                      if (item.schedule!.category is ScheduleDomestic &&
                          item.trip!.fuel != null)
                        FuelExpenseWidget(fuel: item.trip!.fuel!),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
