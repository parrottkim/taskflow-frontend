import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:taskflow/src/shared/theme/color_extension.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';

class TripDetailsWidget extends StatelessWidget {
  final Schedule schedule;
  final TripCategory category;
  final List<TripStep> steps;
  final List<Currency> currencies;
  final List<TripRegulation> regulations;
  final List<TripActualExpense> expenses;
  final List<TripRegulationRate> rates;
  final bool isDeducted;

  const TripDetailsWidget({
    super.key,
    required this.schedule,
    required this.category,
    required this.steps,
    required this.currencies,
    required this.regulations,
    required this.expenses,
    required this.rates,
    required this.isDeducted,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final associatedRates = rates.where((rate) {
      // 현재 steps 중 해당 rate의 stepId와 일치하는 항목이 있는지 확인
      return steps.any((step) => step.id == rate.stepId);
    }).toList();

    final settlement = rates.fold<double>(0.0, (sum, rate) {
      final stepExists = steps.any((s) => s.id == rate.stepId);
      if (!stepExists) return sum;

      final rateValue =
          double.tryParse(rate.rate?.replaceAll(',', '') ?? '0') ?? 0.0;
      final daysValue =
          double.tryParse(rate.days?.replaceAll(',', '') ?? '0') ?? 0.0;
      final deductionRate =
          schedule.category is ScheduleOverseas &&
              category.id == 4 &&
              isDeducted &&
              rate.stepId != 24
          ? 0.1
          : 0.0;

      return sum + (rateValue * daysValue * (1 - deductionRate));
    });

    final total = expenses
        .where((expense) {
          return steps.any((step) => step.id == expense.stepId);
        })
        .fold<double>(0.0, (sum, expense) {
          final priceString = (expense.price ?? '0').replaceAll(',', '');
          final priceValue = double.tryParse(priceString) ?? 0.0;
          final convertedPrice =
              expense.convertedPrice ??
              (priceValue * (expense.exchangeRate ?? 1)).roundToDouble();

          return sum + convertedPrice;
        });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataTable(
          headingRowHeight: 36.0,
          showCheckboxColumn: false,
          horizontalMargin: 12.0,
          dataRowMinHeight: 34.0,
          dataRowMaxHeight: double.infinity,
          headingRowColor: WidgetStatePropertyAll(colorScheme.surfaceContainer),
          columns: [
            DataColumn(
              columnWidth: FlexColumnWidth(1.0),
              label: Text(
                Intl.message('report_form_${category.id}'),
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            DataColumn(
              columnWidth: FlexColumnWidth(0.4),
              label: Text(
                Intl.message('report_form_regulation'),
                style: TextStyle(color: colorScheme.onSurface.strong),
              ),
            ),
            DataColumn(
              columnWidth: FlexColumnWidth(0.4),
              label: Text(
                Intl.message('report_form_expense_amount'),
                style: TextStyle(color: colorScheme.onSurface.strong),
              ),
            ),
            DataColumn(
              columnWidth: FlexColumnWidth(0.4),
              label: Text(
                Intl.message('report_form_expense_details'),
                style: TextStyle(color: colorScheme.onSurface.strong),
              ),
            ),
          ],
          rows: List.generate(steps.length, (index) {
            final step = steps[index];
            final stepExpenses = expenses
                .where((expense) => expense.stepId == step.id)
                .toList();
            final itemHeight = step.requiresExpenseCurrency ? 70.0 : 34.0;
            final double height = max(34.0, itemHeight * stepExpenses.length);

            return DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    height: height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          step.name,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    height: height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          regulations.firstWhereOrNull(
                                        (e) => e.stepId == step.id,
                                      ) !=
                                      null &&
                                  rates.firstWhereOrNull(
                                        (e) => e.stepId == step.id,
                                      ) !=
                                      null
                              ? '${regulations.firstWhereOrNull((e) => e.stepId == step.id)!.rate} ${schedule.category is ScheduleDomestic ? '₩' : '\$'} × ${rates.firstWhereOrNull((e) => e.stepId == step.id)!.days} 일'
                              : '',
                        ),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: stepExpenses.length,
                    itemBuilder: (context, itemIndex) {
                      final expense = stepExpenses[itemIndex];
                      final currency = currencies.firstWhereOrNull(
                        (currency) => currency.id == expense.currencyId,
                      );

                      return SizedBox(
                        height: itemHeight,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${expense.price ?? 0} ${step.requiresExpenseCurrency ? currency?.symbol ?? '-' : '₩'}',
                              ),
                              if (step.requiresExpenseCurrency &&
                                  expense.convertedPrice != null)
                                Text(
                                  '${NumberFormat('#,###').format(expense.convertedPrice)} ₩',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface.strong,
                                  ),
                                ),
                              if (step.requiresExpenseCurrency &&
                                  expense.exchangeRate != null)
                                Text(
                                  [
                                    '${NumberFormat('#,###.##').format(expense.exchangeRate)} ₩',
                                    if (expense.exchangeRateAppliedDate != null)
                                      DateFormat.yMMMd(
                                        Intl.getCurrentLocale(),
                                      ).format(
                                        expense.exchangeRateAppliedDate!,
                                      ),
                                  ].join(' · '),
                                  style: textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurface.strong,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                DataCell(
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: stepExpenses.length,
                    itemBuilder: (context, itemIndex) {
                      final expense = stepExpenses[itemIndex];

                      return SizedBox(
                        height: itemHeight,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(expense.details ?? ''),
                              if (step.requiresExpenseCurrency &&
                                  expense.paymentDate != null)
                                Text(
                                  DateFormat.yMMMd(
                                    Intl.getCurrentLocale(),
                                  ).format(expense.paymentDate!),
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface.strong,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
        if (category.id != 4)
          Container(
            width: 120.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Intl.message('report_form_total'),
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.strong,
                  ),
                ),
                Text(
                  '${NumberFormat('#,###').format(total)} ₩',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        if (associatedRates.isNotEmpty)
          Container(
            width: 120.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Intl.message('report_form_regulation'),
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.strong,
                  ),
                ),
                if (schedule.category is ScheduleOverseas &&
                    category.id == 4 &&
                    isDeducted)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.0,
                      vertical: 2.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: colorScheme.outline,
                    ),
                    child: Text(
                      Intl.message('report_form_deducted_1'),
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.surface,
                      ),
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    if (schedule.category is ScheduleOverseas &&
                        category.id == 4 &&
                        isDeducted)
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Text(
                          '(-10%)',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    Text(
                      '${NumberFormat('#,###').format(settlement)} ${schedule.category is ScheduleOverseas ? '\$' : '₩'}',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        if (schedule.category is ScheduleDomestic && category.id == 3)
          Container(
            width: 120.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Intl.message('report_form_settlement'),
                  style: TextStyle(color: colorScheme.onSurface.strong),
                ),
                Text(
                  '${NumberFormat('#,###').format(settlement - total)} ₩',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        Divider(),
      ],
    );
  }
}
