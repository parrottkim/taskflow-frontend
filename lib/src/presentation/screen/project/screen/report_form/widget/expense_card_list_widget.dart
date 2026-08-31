import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/expense_card_widget.dart';

class ExpenseCardListWidget extends HookWidget {
  final List<TripActualExpense> expenses;
  final List<Currency> currencies;
  final bool requiresCurrency;
  final ExpenseValueChanged onPriceChanged;
  final ExpenseValueChanged onDetailsChanged;
  final ExpenseCurrencyChanged onCurrencyChanged;
  final ExpensePaymentDateChanged onPaymentDateChanged;
  final ExpenseRemoved onRemove;
  final VoidCallback onAdd;

  const ExpenseCardListWidget({
    super.key,
    required this.expenses,
    required this.currencies,
    required this.requiresCurrency,
    required this.onPriceChanged,
    required this.onDetailsChanged,
    required this.onCurrencyChanged,
    required this.onPaymentDateChanged,
    required this.onRemove,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final pendingPriceFocusIndex = useState<int?>(null);

    return Column(
      children: [
        for (final (index, expense) in expenses.indexed) ...[
          ExpenseCardWidget(
            key: ValueKey('${expense.id ?? 'new'}-$index'),
            expense: expense,
            currencies: currencies,
            requiresCurrency: requiresCurrency,
            onPriceChanged: onPriceChanged,
            onDetailsChanged: onDetailsChanged,
            onCurrencyChanged: onCurrencyChanged,
            onPaymentDateChanged: onPaymentDateChanged,
            onRemove: onRemove,
            onSubmitted: index == expenses.length - 1
                ? () {
                    pendingPriceFocusIndex.value = expenses.length;
                    onAdd();
                  }
                : null,
            requestPriceFocus: pendingPriceFocusIndex.value == index,
            onPriceFocusRequested: () => pendingPriceFocusIndex.value = null,
          ),
          if (index != expenses.length - 1) const SizedBox(height: 8.0),
        ],
      ],
    );
  }
}
