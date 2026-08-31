import 'package:flutter/material.dart' hide DatePickerDialog;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';

typedef ExpenseValueChanged =
    void Function(TripActualExpense expense, String value);
typedef ExpenseCurrencyChanged =
    void Function(TripActualExpense expense, Currency currency);
typedef ExpensePaymentDateChanged =
    void Function(TripActualExpense expense, DateTime? date);
typedef ExpenseRemoved = Future<void> Function(TripActualExpense expense);

class ExpenseCardWidget extends HookWidget {
  final TripActualExpense expense;
  final List<Currency> currencies;
  final bool requiresCurrency;
  final ExpenseValueChanged onPriceChanged;
  final ExpenseValueChanged onDetailsChanged;
  final ExpenseCurrencyChanged onCurrencyChanged;
  final ExpensePaymentDateChanged onPaymentDateChanged;
  final ExpenseRemoved onRemove;
  final VoidCallback? onSubmitted;
  final bool requestPriceFocus;
  final VoidCallback onPriceFocusRequested;

  const ExpenseCardWidget({
    super.key,
    required this.expense,
    required this.currencies,
    required this.requiresCurrency,
    required this.onPriceChanged,
    required this.onDetailsChanged,
    required this.onCurrencyChanged,
    required this.onPaymentDateChanged,
    required this.onRemove,
    required this.onSubmitted,
    required this.requestPriceFocus,
    required this.onPriceFocusRequested,
  });

  @override
  Widget build(BuildContext context) {
    final priceController = useTextEditingController(text: expense.price);
    final detailsController = useTextEditingController(text: expense.details);
    final priceFocusNode = useFocusNode();
    final detailsFocusNode = useFocusNode();
    final selectedCurrency = currencies.firstWhere(
      (currency) => currency.id == expense.currencyId,
      orElse: () => currencies.first,
    );

    useListenable(priceFocusNode);
    useListenable(detailsFocusNode);
    _useRequestedFocus(
      context: context,
      requested: requestPriceFocus,
      focusNode: priceFocusNode,
      onHandled: onPriceFocusRequested,
    );
    _useSyncedText(
      controller: priceController,
      focusNode: priceFocusNode,
      value: expense.price,
    );
    _useSyncedText(
      controller: detailsController,
      focusNode: detailsFocusNode,
      value: expense.details,
    );

    return ContentContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      borderRadius: BorderRadius.circular(12.0),
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (requiresCurrency) ...[
                _CurrencySelector(
                  currencies: currencies,
                  selected: selectedCurrency,
                  onChanged: (currency) => onCurrencyChanged(expense, currency),
                ),
                const SizedBox(width: 8.0),
              ],
              Expanded(
                child: _ExpenseTextField(
                  label: Intl.message('report_form_expense_amount'),
                  controller: priceController,
                  focusNode: priceFocusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [DecimalInputFormatter()],
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.end,
                  suffixText: selectedCurrency.symbol,
                  onChanged: (value) => onPriceChanged(expense, value),
                  onSubmitted: (_) => detailsFocusNode.requestFocus(),
                ),
              ),
            ],
          ),
          if (requiresCurrency) ...[
            const SizedBox(height: 8.0),
            _PaymentDateButton(
              date: expense.paymentDate,
              onChanged: (date) => onPaymentDateChanged(expense, date),
            ),
          ],
          const SizedBox(height: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: _ExpenseTextField(
                  label: Intl.message('report_form_expense_details'),
                  controller: detailsController,
                  focusNode: detailsFocusNode,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) => onDetailsChanged(expense, value),
                  onSubmitted: (_) => _submitIfValid(priceController.text),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
                child: ElevatedIconButton(
                  onTap: () => onRemove(expense),
                  padding: const EdgeInsets.all(4.0),
                  borderRadius: BorderRadius.circular(4.0),
                  icon: Symbols.delete_rounded,
                  size: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitIfValid(String price) {
    if (onSubmitted == null ||
        price.trim().isEmpty ||
        (requiresCurrency &&
            ((expense.currencyId ?? 0) <= 0 || expense.paymentDate == null))) {
      return;
    }
    onSubmitted!();
  }
}

class _CurrencySelector extends StatelessWidget {
  final List<Currency> currencies;
  final Currency selected;
  final ValueChanged<Currency> onChanged;

  const _CurrencySelector({
    required this.currencies,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => ElevatedDropdownButton<Currency>(
    showClose: false,
    items: currencies,
    value: selected,
    icon: Text(
      selected.symbol,
      style: Theme.of(
        context,
      ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
    ),
    label: Text(Intl.message('unspecified')),
    itemBuilder: (currency) => Text(currency.code),
    onChanged: onChanged,
  );
}

class _PaymentDateButton extends StatelessWidget {
  final DateTime? date;
  final ValueChanged<DateTime?> onChanged;

  const _PaymentDateButton({required this.date, required this.onChanged});

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: () => _selectDate(context),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Symbols.event_rounded),
        const SizedBox(width: 8.0),
        Text(
          date == null
              ? Intl.message('report_form_expense_payment_date')
              : DateFormat.yMMMd(Intl.getCurrentLocale()).format(date!),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: 8.0),
        if (date == null)
          const Icon(Symbols.chevron_right_rounded)
        else
          InkWell(
            onTap: () => onChanged(null),
            borderRadius: BorderRadius.circular(4.0),
            child: const Icon(Symbols.close_rounded),
          ),
      ],
    ),
  );

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDialog<DateTime>(
      context: context,
      builder: (_) => DatePickerDialog(
        initialDate: date,
        title: Intl.message('date_title'),
      ),
    );
    if (selectedDate != null) onChanged(selectedDate);
  }
}

class _ExpenseTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final String? suffixText;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;

  const _ExpenseTextField({
    required this.label,
    required this.controller,
    required this.focusNode,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.suffixText,
    required this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
          child: Text(
            label,
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface.strong,
            ),
          ),
        ),
        Material(
          elevation: focusNode.hasFocus ? 1.0 : 0.0,
          borderRadius: BorderRadius.circular(8.0),
          color: focusNode.hasFocus
              ? colorScheme.surfaceBright
              : colorScheme.surfaceContainerLow,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            textAlign: textAlign,
            style: textTheme.bodyMedium,
            maxLines: 1,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(width: 2.0, color: colorScheme.primary),
              ),
              suffixText: suffixText,
            ),
            onChanged: onChanged,
            onSubmitted: onSubmitted,
          ),
        ),
      ],
    );
  }
}

void _useRequestedFocus({
  required BuildContext context,
  required bool requested,
  required FocusNode focusNode,
  required VoidCallback onHandled,
}) {
  useEffect(() {
    if (!requested) return null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
      focusNode.requestFocus();
      onHandled();
    });
    return null;
  }, [requested]);
}

void _useSyncedText({
  required TextEditingController controller,
  required FocusNode focusNode,
  required String? value,
}) {
  useEffect(() {
    if (!focusNode.hasFocus && controller.text != (value ?? '')) {
      controller.text = value ?? '';
    }
    return null;
  }, [value]);
}
