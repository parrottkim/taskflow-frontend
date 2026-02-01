import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class TransactionDisplayItem extends StatelessWidget {
  final Currency currency;
  final List<TransactionItem> items;

  const TransactionDisplayItem({
    super.key,
    required this.currency,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDesktop(context))
          DataTable(
            headingRowHeight: 36.0,
            showCheckboxColumn: false,
            horizontalMargin: 0.0,
            dataRowMinHeight: 36.0,
            dataRowMaxHeight: 36.0,
            showBottomBorder: true,
            border: TableBorder(
              verticalInside: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.2),
                width: 1.0,
              ),
              horizontalInside: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.2),
                width: 1.0,
              ),
              bottom: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.2),
                width: 1.0,
              ),
            ),
            columns: [
              DataColumn(
                columnWidth: FlexColumnWidth(0.4),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.checkbook_rounded,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_form_transaction_3'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(0.15),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.numbers_rounded,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_form_transaction_4'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(0.2),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.numbers_rounded,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_form_transaction_5'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(0.15),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.check_box_rounded,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_form_transaction_6'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(0.3),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.text_fields_rounded,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_form_transaction_7'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            rows: List.generate(
              items.length,
              (index) => DataRow(
                cells: [
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      width: double.infinity,
                      child: Text(items[index].category!.name),
                    ),
                  ),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      width: double.infinity,
                      child: Text(
                        '${items[index].ratio} %',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      width: double.infinity,
                      child: Text(
                        '${items[index].price} ${currency.symbol}',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      width: double.infinity,
                      child: IgnorePointer(
                        child: CustomToggleButton(value: items[index].isPaid),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      width: double.infinity,
                      child: Text(items[index].note ?? ''),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 36.0,
              showCheckboxColumn: false,
              horizontalMargin: 0.0,
              dataRowMinHeight: 36.0,
              dataRowMaxHeight: 36.0,
              showBottomBorder: true,
              border: TableBorder(
                verticalInside: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                  width: 1.0,
                ),
                horizontalInside: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                  width: 1.0,
                ),
                bottom: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                  width: 1.0,
                ),
              ),
              columns: [
                DataColumn(
                  columnWidth: FixedColumnWidth(100.0),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.checkbook_rounded,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          Intl.message('issue_form_transaction_3'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  columnWidth: FixedColumnWidth(120.0),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.numbers_rounded,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          Intl.message('issue_form_transaction_4'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  columnWidth: FixedColumnWidth(200.0),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.numbers_rounded,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          Intl.message('issue_form_transaction_5'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  columnWidth: FixedColumnWidth(120.0),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.check_box_rounded,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          Intl.message('issue_form_transaction_6'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  columnWidth: FixedColumnWidth(200.0),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.text_fields_rounded,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          Intl.message('issue_form_transaction_7'),
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              rows: List.generate(
                items.length,
                (index) => DataRow(
                  cells: [
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        width: double.infinity,
                        child: Text(items[index].category!.name),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        width: double.infinity,
                        child: Text(
                          '${items[index].ratio} %',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        width: double.infinity,
                        child: Text(
                          '${items[index].price} ${currency.symbol}',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        width: double.infinity,
                        child: IgnorePointer(
                          child: CustomToggleButton(value: items[index].isPaid),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        width: double.infinity,
                        child: Text(items[index].note ?? ''),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
