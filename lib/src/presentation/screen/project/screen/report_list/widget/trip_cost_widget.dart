import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class TripCostWidget extends HookConsumerWidget {
  final Report item;

  const TripCostWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
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
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
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
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
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
                  if (item.schedule!.category is ScheduleOverseas)
                    BentoTile(
                      row: 1,
                      column: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Intl.message('report_form_exchange_rate'),
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
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
                                      '${NumberFormat('#,###').format(item.trip!.calculations!.exchangeRate)} ',
                                ),
                                TextSpan(
                                  text: '₩ / 1\$',
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
                        style: textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  if (item.schedule!.category is ScheduleDomestic)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Text(
                            Intl.message('report_form_taxable_amount'),
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
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
                    ),
                  if (item.schedule!.category is ScheduleDomestic)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Text(
                            Intl.message('report_form_non_taxable_amount'),
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
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
                    ),
                  if (item.schedule!.category is ScheduleOverseas)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Text(
                            Intl.message('report_form_exchange_rate'),
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${NumberFormat('#,###').format(item.trip!.calculations!.exchangeRate)} ₩ / 1\$',
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
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
    );
  }
}
