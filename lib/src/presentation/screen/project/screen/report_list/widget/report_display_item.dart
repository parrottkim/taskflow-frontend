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
import 'package:taskflow/src/shared/tool/responsive.dart';

class ReportDisplayItem extends HookConsumerWidget {
  final Report item;

  const ReportDisplayItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
        tripFilterControllerProvider(categoryId: item.schedule?.category.id));

    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: switch (filter) {
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
      },
    );
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!Responsive.isMobile(context) &&
            item.trip != null &&
            item.schedule != null &&
            item.trip!.calculations != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BentoGrid(
              rows: 1,
              columns: 3,
              tiles: [
                BentoTile(
                  row: 1,
                  column: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Intl.message('report_form_total_cost'),
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      Text.rich(
                        style: textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${NumberFormat('#,###').format(item.trip!.calculations!.totalCost)} ',
                            ),
                            TextSpan(
                              text: '₩',
                              style: textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (item.schedule!.category is ScheduleDomestic)
                  BentoTile(
                    row: 1,
                    column: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Intl.message('report_form_taxable_amount'),
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                        Text.rich(
                          style: textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${NumberFormat('#,###').format(item.trip!.calculations!.taxableAmount)} ',
                              ),
                              TextSpan(
                                text: '₩',
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (item.schedule!.category is ScheduleDomestic)
                  BentoTile(
                    row: 1,
                    column: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Intl.message('report_form_non_taxable_amount'),
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                        Text.rich(
                          style: textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${NumberFormat('#,###').format(item.trip!.calculations!.nonTaxableAmount)} ',
                              ),
                              TextSpan(
                                text: '₩',
                                style: textTheme.titleMedium,
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
        if (Responsive.isMobile(context) &&
            item.trip != null &&
            item.schedule != null &&
            item.trip!.calculations != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      Intl.message('report_form_total_cost'),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${NumberFormat('#,###').format(item.trip!.calculations!.totalCost)} ₩',
                      style: textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Text(
                      Intl.message('report_form_taxable_amount'),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${NumberFormat('#,###').format(item.trip!.calculations!.taxableAmount)} ₩',
                      style: textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Text(
                      Intl.message('report_form_non_taxable_amount'),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${NumberFormat('#,###').format(item.trip!.calculations!.nonTaxableAmount)} ₩',
                      style: textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        if (item.trip != null) SizedBox(height: 24.0),
        if (item.trip != null &&
            auth is AuthAuthenticated &&
            auth.user == item.user)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton.icon(
              onPressed: () async {
                await ref
                    .read(tripPreviewControllerProvider.notifier)
                    .preview(tripId: item.id);
              },
              icon: Icon(
                Symbols.print_rounded,
              ),
              label: Text(
                Intl.message('common_print'),
              ),
            ),
          ),
        if (item.trip != null)
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
    );
  }
}
