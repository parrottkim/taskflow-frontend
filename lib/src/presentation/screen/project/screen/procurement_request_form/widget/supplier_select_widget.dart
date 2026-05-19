import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SupplierSelectWidget extends StatelessWidget {
  final List<ProcurementIssueItem> items;
  final List<ProcurementIssueRequest> requests;
  final Set<int> selectedSupplierIds;
  final ValueChanged<(int supplierId, bool selected)>
  onSupplierSelectionChanged;
  final ValueNotifier<bool> isSelectedSupplierEmpty;

  const SupplierSelectWidget({
    super.key,
    required this.items,
    required this.requests,
    required this.selectedSupplierIds,
    required this.onSupplierSelectionChanged,
    required this.isSelectedSupplierEmpty,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final requestedSupplierIds = requests
        .map((request) => request.supplier.id)
        .toSet();

    final groupedItems = groupBy(items, (item) => item.supplier).entries.where((
      entry,
    ) {
      final supplier = entry.key;
      return supplier != null && supplier.id != 47;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(24.0),
          itemCount: groupedItems.length,
          itemBuilder: (context, index) {
            final supplier = groupedItems[index].key!;
            final groupList = groupedItems[index].value;
            final isDisabled = requestedSupplierIds.contains(supplier.id);

            final total = groupList.map((e) => e.totalAmount).fold(0.0, (
              sum,
              totalAmountString,
            ) {
              String cleanedPrice = totalAmountString.replaceAll(',', '');
              double price = double.tryParse(cleanedPrice) ?? 0.0;

              return sum + price;
            });

            return IgnorePointer(
              ignoring: isDisabled,
              child: Opacity(
                opacity: isDisabled ? 0.4 : 1.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 600.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomToggleButton(
                                  value: selectedSupplierIds.contains(
                                    supplier.id,
                                  ),
                                  onChanged: isDisabled
                                      ? null
                                      : (checked) {
                                          onSupplierSelectionChanged((
                                            supplier.id,
                                            checked ?? false,
                                          ));
                                        },
                                ),
                                SizedBox(width: 8.0),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: supplier.logo != null
                                        ? Colors.white
                                        : colorScheme.primary,
                                  ),
                                  child: supplier.logo != null
                                      ? Image.network(
                                          supplier.logo!,
                                          fit: BoxFit
                                              .contain, // 이미지가 컨테이너를 꽉 채우도록 설정
                                          errorBuilder: (_, _, _) => Icon(
                                            Symbols.public_rounded,
                                            size: 20.0,
                                            color: colorScheme.onPrimary,
                                          ),
                                        )
                                      : Icon(
                                          Symbols.public_rounded,
                                          size: 20.0,
                                          color: colorScheme.onPrimary,
                                        ),
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  supplier.name,
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: isDisabled
                                        ? colorScheme.onSurface.withValues(
                                            alpha: 0.4,
                                          )
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.0),
                          SingleChildScrollView(
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              headingRowHeight: 36.0,
                              showCheckboxColumn: false,
                              horizontalMargin: 0.0,
                              dataRowMinHeight: 34.0,
                              dataRowMaxHeight: 34.0,
                              showBottomBorder: true,
                              border: TableBorder(
                                verticalInside: BorderSide(
                                  color: colorScheme.outline.withValues(
                                    alpha: 0.2,
                                  ),
                                  width: 1.0,
                                ),
                                horizontalInside: BorderSide(
                                  color: colorScheme.outline.withValues(
                                    alpha: 0.2,
                                  ),
                                  width: 1.0,
                                ),
                                bottom: BorderSide(
                                  color: colorScheme.outline.withValues(
                                    alpha: 0.2,
                                  ),
                                  width: 1.0,
                                ),
                              ),
                              columns: [
                                DataColumn(
                                  columnWidth: FixedColumnWidth(200.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.text_fields_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_2',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  columnWidth: FixedColumnWidth(200.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.text_fields_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_3',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  columnWidth: FixedColumnWidth(80.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.numbers_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_4',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  columnWidth: FixedColumnWidth(150.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.numbers_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_5',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  columnWidth: FixedColumnWidth(180.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.numbers_rounded,
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_6',
                                          ),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              rows: List.generate(
                                groupList.length,
                                (groupIndex) => DataRow(
                                  cells: [
                                    DataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 8.0,
                                        ),
                                        width: double.infinity,
                                        child: Text(groupList[groupIndex].item),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 8.0,
                                        ),
                                        width: double.infinity,
                                        child: Text(groupList[groupIndex].spec),
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
                                          groupList[groupIndex].quantity,
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
                                          '${groupList[groupIndex].unitPrice} ₩',
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
                                          '${groupList[groupIndex].totalAmount} ₩',
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 600.0),
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
                        children: [
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 8.0,
                              ),
                              child: Text(
                                Intl.message('issue_form_procurement_15'),
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 8.0,
                              ),
                              child: Text(
                                '${NumberFormat('#,###').format(total)} ₩',
                                textAlign: TextAlign.end,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.0);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: InvalidWidget(
            visible: isSelectedSupplierEmpty.value,
            text: Intl.message('issue_form_procurement_requested_invalid_1'),
          ),
        ),
      ],
    );
  }
}
