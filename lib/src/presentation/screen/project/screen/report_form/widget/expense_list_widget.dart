import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/expense_card_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/regulation_rate_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/report_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ExpenseListWidget extends ConsumerWidget {
  final Schedule schedule;
  final List<TripStep> steps;
  final List<Currency> currencies;
  final List<TripRegulation>? regulations;
  final List<TripActualExpense>? expenses;
  final List<TripRegulationRate>? rates;

  const ExpenseListWidget({
    super.key,
    required this.schedule,
    required this.steps,
    required this.currencies,
    this.regulations,
    this.expenses,
    this.rates,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = _ExpenseActions(
      controller: ReportFormScope.of(context).controller(ref),
      expenses: expenses ?? const [],
      rates: rates ?? const [],
    );
    final validation = ref.watch(reportValidationControllerProvider);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: steps.length,
      itemBuilder: (context, index) => _ExpenseItemWidget(
        key: ValueKey(steps[index].id),
        schedule: schedule,
        step: steps[index],
        currencies: currencies,
        regulations: regulations,
        expenses: expenses,
        rates: rates,
        validation: validation,
        actions: actions,
      ),
      separatorBuilder: (_, _) => const SizedBox(height: 16.0),
    );
  }
}

class _ExpenseItemWidget extends HookWidget {
  final Schedule schedule;
  final TripStep step;
  final List<Currency> currencies;
  final List<TripRegulation>? regulations;
  final List<TripActualExpense>? expenses;
  final List<TripRegulationRate>? rates;
  final ReportValidationState validation;
  final _ExpenseActions actions;

  const _ExpenseItemWidget({
    super.key,
    required this.schedule,
    required this.step,
    required this.currencies,
    this.regulations,
    this.expenses,
    this.rates,
    required this.validation,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final stepExpenses = expenses
        ?.where((expense) => expense.stepId == step.id)
        .toList();
    final regulation = regulations?.firstWhereOrNull(
      (item) => item.stepId == step.id,
    );
    final regulationRate = rates?.firstWhereOrNull(
      (item) => item.stepId == step.id,
    );

    final isExpanded =
        (stepExpenses?.isNotEmpty ?? false) ||
        (regulation != null && stepExpenses == null);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 150),
      initialValue: isExpanded ? 1.0 : 0.0,
    );

    useEffect(() {
      if (isExpanded) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return null;
    }, [isExpanded]);

    final total =
        stepExpenses?.fold<double>(
          0,
          (sum, expense) =>
              sum +
              (double.tryParse(expense.price?.replaceAll(',', '') ?? '') ?? 0),
        ) ??
        0;
    final regulationPrice =
        double.tryParse(regulation?.rate.replaceAll(',', '') ?? '') ?? 0;
    final regulationDays =
        double.tryParse(regulationRate?.days?.replaceAll(',', '') ?? '') ?? 0;
    final settlement = regulationPrice * regulationDays;
    final requiresCurrency = step.requiresExpenseCurrency;
    final defaultCurrency = currencies.firstWhere(
      (currency) => currency.code == 'KRW',
      orElse: () => currencies.first,
    );
    final totalsByCurrency = <Currency, double>{};
    for (final expense in stepExpenses ?? <TripActualExpense>[]) {
      final currency = currencies.firstWhere(
        (currency) => currency.id == expense.currencyId,
        orElse: () => defaultCurrency,
      );
      final price =
          double.tryParse(expense.price?.replaceAll(',', '') ?? '') ?? 0;
      totalsByCurrency.update(
        currency,
        (total) => total + price,
        ifAbsent: () => price,
      );
    }

    final isStepInvalid = validation.stepValidations[step.id] ?? false;
    final isRegulationRateInvalid =
        validation.regulationRateValidations[step.id] ?? false;
    final hasInvalidExpense =
        stepExpenses?.any(
          (expense) =>
              !(expense.price?.trim().isNotEmpty ?? false) ||
              (requiresCurrency &&
                  ((expense.currencyId ?? 0) <= 0 ||
                      expense.paymentDate == null)),
        ) ??
        false;
    final hasInvalidRegulationRate =
        regulationRate != null &&
        (!(regulationRate.days?.trim().isNotEmpty ?? false) ||
            !(regulationRate.rate?.trim().isNotEmpty ?? false));

    Future<void> removeExpense(TripActualExpense expense) async {
      if (stepExpenses?.length == 1) {
        await animationController.reverse();
        if (regulationRate != null) {
          actions.removeRate(regulationRate);
        }
      }

      actions.removeExpense(expense);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          step.name,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        if (step.description != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              step.description!,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.strong,
              ),
            ),
          ),
        if (stepExpenses != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: TextButton.icon(
              onPressed: () => actions.addExpense(step, defaultCurrency),
              icon: const Icon(Symbols.add_rounded),
              label: Text(Intl.message('issue_form_contract_5')),
            ),
          ),
        SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: animationController,
            curve: Curves.easeInQuad,
          ),
          child: FadeTransition(
            opacity: animationController,
            child: Column(
              children: [
                if (regulation != null)
                  RegulationRateWidget(
                    schedule: schedule,
                    regulation: regulation,
                    rate: regulationRate,
                    bottomPadding: stepExpenses != null ? 8.0 : 0.0,
                    onChanged: (value) {
                      if (regulationRate == null) {
                        if (value.isNotEmpty && value != '0') {
                          actions.addRate(step, regulation, value);
                        }
                        return;
                      }

                      final index = rates!.indexOf(regulationRate);
                      if (value.isEmpty || value == '0') {
                        actions.removeRateAt(index);
                        return;
                      }

                      actions.updateRate(index, regulation, value);
                    },
                  ),
                if (stepExpenses?.isNotEmpty ?? false)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: ExpenseCardListWidget(
                      expenses: stepExpenses!,
                      currencies: currencies,
                      requiresCurrency: requiresCurrency,
                      onPriceChanged: actions.updatePrice,
                      onDetailsChanged: actions.updateDetails,
                      onCurrencyChanged: actions.updateCurrency,
                      onPaymentDateChanged: actions.updatePaymentDate,
                      onRemove: removeExpense,
                      onAdd: () => actions.addExpense(step, defaultCurrency),
                    ),
                  ),
                if ((stepExpenses?.isNotEmpty ?? false) && requiresCurrency)
                  for (final totalByCurrency in totalsByCurrency.entries)
                    _SummaryRow(
                      label:
                          '${Intl.message('report_form_total')} (${totalByCurrency.key.code})',
                      value: totalByCurrency.value,
                      currency: totalByCurrency.key,
                    ),
                if ((stepExpenses?.isNotEmpty ?? false) && !requiresCurrency)
                  _SummaryRow(
                    label: Intl.message('report_form_total'),
                    value: total,
                    currency: defaultCurrency,
                  ),
                if (regulation != null)
                  _SummaryRow(
                    label: Intl.message('report_form_regulation'),
                    value: settlement,
                    currency: defaultCurrency,
                  ),
                if (regulation != null && stepExpenses != null)
                  _SummaryRow(
                    label: Intl.message('report_form_settlement'),
                    value: settlement - total,
                    currency: defaultCurrency,
                  ),
              ],
            ),
          ),
        ),
        ValidationErrorMessage(
          visible: isStepInvalid && hasInvalidExpense,
          text: Intl.message('report_form_invalid_2', args: [step.name]),
        ),
        ValidationErrorMessage(
          visible: isRegulationRateInvalid && hasInvalidRegulationRate,
          text: Intl.message('report_form_invalid_3', args: [step.name]),
        ),
      ],
    );
  }
}

class _ExpenseActions {
  final ReportFormController controller;
  final List<TripActualExpense> expenses;
  final List<TripRegulationRate> rates;

  const _ExpenseActions({
    required this.controller,
    required this.expenses,
    required this.rates,
  });

  void addExpense(TripStep step, Currency currency) {
    controller.addActualExpense(
      item: TripActualExpense(stepId: step.id, currencyId: currency.id),
    );
  }

  void removeExpense(TripActualExpense expense) {
    controller.removeActualExpense(index: expenses.indexOf(expense));
  }

  void updatePrice(TripActualExpense expense, String value) {
    controller.updateActualExpense(
      index: expenses.indexOf(expense),
      price: value,
    );
  }

  void updateDetails(TripActualExpense expense, String value) {
    controller.updateActualExpense(
      index: expenses.indexOf(expense),
      details: value,
    );
  }

  void updateCurrency(TripActualExpense expense, Currency currency) {
    controller.updateActualExpenseCurrency(
      index: expenses.indexOf(expense),
      currencyId: currency.id,
    );
  }

  void updatePaymentDate(TripActualExpense expense, DateTime? date) {
    controller.updateActualExpensePaymentDate(
      index: expenses.indexOf(expense),
      paymentDate: date,
    );
  }

  void addRate(TripStep step, TripRegulation regulation, String days) {
    controller.addRegulationRate(
      item: TripRegulationRate(
        stepId: step.id,
        days: days,
        rate: regulation.rate,
      ),
    );
  }

  void updateRate(int index, TripRegulation regulation, String days) {
    controller.updateRegulationRate(
      index: index,
      days: days,
      rate: regulation.rate,
    );
  }

  void removeRate(TripRegulationRate rate) => removeRateAt(rates.indexOf(rate));

  void removeRateAt(int index) {
    controller.removeRegulationRate(index: index);
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final Currency currency;

  const _SummaryRow({
    required this.label,
    required this.value,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outline.subtle)),
        color: colorScheme.surfaceContainer,
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(
            child: Text(
              '${NumberFormat.currency(locale: Intl.getCurrentLocale(), name: currency.code, symbol: '').format(value)} ${currency.symbol}',
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
