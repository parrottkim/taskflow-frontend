import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DailyAllowanceSummary extends StatelessWidget {
  final DailyAllowancePreview value;
  final bool isDomestic;

  const DailyAllowanceSummary({
    super.key,
    required this.value,
    required this.isDomestic,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ContentContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      borderRadius: BorderRadius.circular(12.0),
      color: colorScheme.surfaceContainerLowest,
      child: Column(
        children: [
          _SummaryRow(
            label: Intl.message('report_form_total_trip_days'),
            value: '${value.totalTripDays}${Intl.message('common_days')}',
          ),
          if (value.domestic != null) ...[
            _SummaryRow(
              label: Intl.message('report_form_domestic_holiday_work_days'),
              value:
                  '${value.domestic!.workDays}${Intl.message('common_days')}',
            ),
            _SummaryRow(
              label: Intl.message('report_form_domestic_holiday_travel_days'),
              value:
                  '${value.domestic!.travelDays}${Intl.message('common_days')}',
            ),
          ],
          if (value.overseas != null)
            _SummaryRow(
              label: Intl.message('report_form_overseas_special_days'),
              value: '${value.overseas!.days}${Intl.message('common_days')}',
            ),
          if (!isDomestic) ...[
            const Divider(height: 24.0),
            _SummaryRow(
              label: Intl.message('report_form_deduction_rate'),
              value: '${(value.deductionRate * 100).toStringAsFixed(0)}%',
              valueColor: value.deductionRate > 0 ? colorScheme.error : null,
            ),
            _SummaryRow(
              label: Intl.message('report_form_exchange_rate'),
              value:
                  '${NumberFormat.currency(symbol: '', decimalDigits: 2).format(value.exchangeRate)} ₩',
            ),
          ],
          const Divider(height: 24.0),
          _SummaryRow(
            label: Intl.message('report_form_daily_amount'),
            value: _formatMoney(value.dailyAmount, value.currencyCode),
            valueDescription:
                '${_formatMoney(value.dailyRate, value.currencyCode)} × ${value.totalTripDays}',
          ),
          if (value.overseas != null)
            _SummaryRow(
              label: Intl.message('report_form_special_allowance_amount'),
              value: _formatMoney(value.overseas!.amount, value.currencyCode),
              valueDescription:
                  '${_formatMoney(value.overseas!.rate, value.currencyCode)} × ${value.overseas!.days}',
            ),
          const Divider(height: 24.0),
          _SummaryRow(
            label: Intl.message('report_form_total_daily_amount'),
            value: _formatMoney(
              value.totalAmount,
              isDomestic ? value.currencyCode : 'KRW',
            ),
            emphasized: true,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final String? valueDescription;
  final bool emphasized;
  final Color? valueColor;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.valueDescription,
    this.emphasized = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: (emphasized ? textTheme.titleSmall : textTheme.bodyMedium)
                  ?.copyWith(
                    fontWeight: emphasized ? FontWeight.w700 : FontWeight.w500,
                    color: colorScheme.onSurface.strong,
                  ),
            ),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                textAlign: TextAlign.end,
                style:
                    (emphasized ? textTheme.titleMedium : textTheme.bodyMedium)
                        ?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: valueColor,
                        ),
              ),
              if (valueDescription != null) ...[
                const SizedBox(height: 2.0),
                Text(
                  valueDescription!,
                  textAlign: TextAlign.end,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.strong,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

String _formatMoney(double amount, String currencyCode) {
  final isDollar = currencyCode == 'USD';
  final number = NumberFormat.currency(
    symbol: '',
    decimalDigits: isDollar ? 2 : 0,
  ).format(amount).trim();

  return '${isDollar ? r'$' : '₩'}$number';
}
