import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';

class FuelExpenseWidget extends HookWidget {
  final TripFuelExpense fuel;

  const FuelExpenseWidget({
    super.key,
    required this.fuel,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final settlement = useMemoized(
      () {
        if (fuel.rate == null ||
            fuel.mileage == null ||
            fuel.distance == null) {
          return 0.0;
        }

        final cleanedRate = fuel.rate?.replaceAll(',', '') ?? '0';
        final cleanedMileage = fuel.mileage?.replaceAll(',', '') ?? '0';
        final cleanedDistance = fuel.distance?.replaceAll(',', '') ?? '0';

        final rate = double.tryParse(cleanedRate) ?? 0.0;
        final mileage = double.tryParse(cleanedMileage) ?? 0.0;
        final distance = double.tryParse(cleanedDistance) ?? 0.0;

        return rate * (distance / mileage);
      },
      [fuel],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataTable(
          headingRowHeight: 36.0,
          showCheckboxColumn: false,
          horizontalMargin: 12.0,
          dataRowMinHeight: 34.0,
          dataRowMaxHeight: double.infinity,
          headingRowColor: WidgetStatePropertyAll(
            colorScheme.surfaceContainer,
          ),
          columns: [
            DataColumn(
              columnWidth: FlexColumnWidth(1.0),
              label: Text(
                Intl.message('report_form_column_6'),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            DataColumn(
              columnWidth: FlexColumnWidth(0.4),
              label: Text(
                Intl.message('report_form_column_7'),
                style: TextStyle(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
            DataColumn(
              columnWidth: FlexColumnWidth(0.4),
              label: Text(
                Intl.message('report_form_column_8'),
                style: TextStyle(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
            DataColumn(
              columnWidth: FlexColumnWidth(0.4),
              label: Text(
                Intl.message('report_form_column_9'),
                style: TextStyle(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(SizedBox()),
                DataCell(
                  Text('${fuel.rate ?? 0} ₩'),
                ),
                DataCell(
                  Text('${fuel.mileage ?? 0} km/L'),
                ),
                DataCell(
                  Text('${fuel.distance ?? 0} km'),
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Container(
          width: 120.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Intl.message('report_form_settlement'),
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              Text(
                '${NumberFormat('#,###').format(settlement)} ₩',
                style: textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
