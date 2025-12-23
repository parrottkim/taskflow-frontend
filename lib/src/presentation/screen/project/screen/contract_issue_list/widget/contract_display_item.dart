import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';

class ContractDisplayItem extends StatelessWidget {
  final Currency currency;
  final List<ContractItem> contractItems;
  final List<TransactionItem> transactionItems;

  const ContractDisplayItem({
    super.key,
    required this.currency,
    required this.contractItems,
    required this.transactionItems,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final total = contractItems.fold<Map<String, double>>({}, (totals, item) {
      final price = double.tryParse(item.price.replaceAll(',', '')) ?? 0.0;
      final code = currency.code;
      totals[code] = (totals[code] ?? 0) + price;
      return totals;
    });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    columnWidth: FlexColumnWidth(0.6),
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
                            Intl.message('issue_form_contract_3'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    columnWidth: FlexColumnWidth(0.4),
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
                            Intl.message('issue_form_contract_4'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                rows: List.generate(
                  contractItems.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          width: double.infinity,
                          child: Text(contractItems[index].item),
                        ),
                      ),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          width: double.infinity,
                          child: Text(
                            '${contractItems[index].price} ${currency.code}',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.2),
                      width: 1.0,
                    ),
                  ),
                  color: colorScheme.surfaceContainer,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Intl.message('issue_form_contract_8'),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: 8.0,
                        children: total.entries
                            .map(
                              (entry) => Text(
                                '${NumberFormat('#,###').format(entry.value)} ${entry.key}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataTable(
                headingRowHeight: 36.0,
                showCheckboxColumn: false,
                horizontalMargin: 0.0,
                dataRowMinHeight: 34.0,
                dataRowMaxHeight: 34.0,
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
                    columnWidth: FixedColumnWidth(140.0),
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
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
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
                            Symbols.pie_chart_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_transaction_4'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    columnWidth: FlexColumnWidth(0.6),
                    label: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.attach_money_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_transaction_5'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                rows: List.generate(
                  transactionItems.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            transactionItems[index].category!.name,
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '${transactionItems[index].ratio} %',
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '${transactionItems[index].price} ${currency.symbol}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
