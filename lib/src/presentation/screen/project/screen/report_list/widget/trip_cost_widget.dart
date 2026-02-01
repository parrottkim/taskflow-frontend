import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class TripCostWidget extends HookConsumerWidget {
  final Report item;

  const TripCostWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${NumberFormat('#,###').format(item.trip!.calculations!.totalCost)} ',
                            ),
                            TextSpan(text: '₩', style: textTheme.titleMedium),
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
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${NumberFormat('#,###').format(item.trip!.calculations!.taxableAmount)} ',
                              ),
                              TextSpan(text: '₩', style: textTheme.titleMedium),
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
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${NumberFormat('#,###').format(item.trip!.calculations!.nonTaxableAmount)} ',
                              ),
                              TextSpan(text: '₩', style: textTheme.titleMedium),
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
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
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
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
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
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
