import 'package:flutter/material.dart' hide DatePickerDialog;
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';

class ItemEditWidget extends HookWidget {
  final List<ProcurementIssueItem> items;
  final Set<int> selectedSupplierIds;
  final Map<int, String> titles;
  final Map<int, DateTime?> deliveryDates;
  final Map<int, String?> paymentTerms;
  final Map<int, bool> hasFees;
  final Map<int, String?> notes;
  final ValueNotifier<Set<int>> invalidTitleSupplierIds;
  final ValueNotifier<Set<int>> nullableDeliverySupplierIds;
  final ValueNotifier<Set<int>> nullablePaymentTermsSupplierIds;
  final ValueNotifier<Set<int>> invalidDeliverySupplierIds;
  final ValueNotifier<Set<int>> invalidPaymentTermsSupplierIds;
  final ValueNotifier<Set<int>> hasProcurementIssueItems;
  final ValueNotifier<Set<int>> isProcurementIssueItemEmpty;
  final void Function({required int supplierId, String? value}) onTitleChanged;
  final void Function({required int supplierId, DateTime? date})
  onDeliveryDateChanged;
  final void Function({required int supplierId, String? value})
  onPaymentTermsChanged;
  final void Function({required int supplierId, required bool hasFee})
  onHasFeeChanged;
  final void Function({required int supplierId, String? note}) onNoteChanged;
  final void Function({
    required int supplierId,
    required int index,
    String? item,
    String? spec,
    String? quantity,
    String? unitPrice,
    String? totalAmount,
  })
  onItemChanged;

  const ItemEditWidget({
    super.key,
    required this.items,
    required this.selectedSupplierIds,
    required this.titles,
    required this.deliveryDates,
    required this.paymentTerms,
    required this.hasFees,
    required this.notes,
    required this.invalidTitleSupplierIds,
    required this.nullableDeliverySupplierIds,
    required this.nullablePaymentTermsSupplierIds,
    required this.invalidDeliverySupplierIds,
    required this.invalidPaymentTermsSupplierIds,
    required this.hasProcurementIssueItems,
    required this.isProcurementIssueItemEmpty,
    required this.onTitleChanged,
    required this.onDeliveryDateChanged,
    required this.onPaymentTermsChanged,
    required this.onHasFeeChanged,
    required this.onNoteChanged,
    required this.onItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final itemControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.item))
          .toList(),
      [items.length],
    );
    final specControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.spec))
          .toList(),
      [items.length],
    );
    final quantityControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.quantity))
          .toList(),
      [items.length],
    );
    final unitPriceControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.unitPrice))
          .toList(),
      [items.length],
    );
    final totalAmountControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.totalAmount))
          .toList(),
      [items.length],
    );

    final itemFocuses = useMemoized(
      () => items.map((_) => FocusNode()).toList(),
      [items.length],
    );
    final specFocuses = useMemoized(
      () => items.map((_) => FocusNode()).toList(),
      [items.length],
    );
    final quantityFocuses = useMemoized(
      () => items.map((_) => FocusNode()).toList(),
      [items.length],
    );
    final unitPriceFocuses = useMemoized(
      () => items.map((_) => FocusNode()).toList(),
      [items.length],
    );

    final suppliers = selectedSupplierIds.toList()..sort();

    return ListView.separated(
      padding: const EdgeInsets.all(24.0),
      itemCount: suppliers.length,
      itemBuilder: (context, index) {
        final supplierId = suppliers[index];
        final supplierItemIndexes = <int>[];
        for (var i = 0; i < items.length; i++) {
          if (items[i].supplier?.id == supplierId) {
            supplierItemIndexes.add(i);
          }
        }
        final itemsBySupplier = supplierItemIndexes
            .map((itemIndex) => items[itemIndex])
            .toList();

        final supplier = itemsBySupplier.first.supplier!;
        final isDeliveryNullable = nullableDeliverySupplierIds.value.contains(
          supplierId,
        );
        final isPaymentTermsNullable = nullablePaymentTermsSupplierIds.value
            .contains(supplierId);

        final total = itemsBySupplier.map((e) => e.totalAmount).fold(0.0, (
          sum,
          totalAmountString,
        ) {
          String cleanedPrice = totalAmountString.replaceAll(',', '');
          double price = double.tryParse(cleanedPrice) ?? 0.0;

          return sum + price;
        });

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                                fit: BoxFit.contain, // 이미지가 컨테이너를 꽉 채우도록 설정
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    Intl.message('issue_form_procurement_requested_6'),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    key: ValueKey('request-title-$supplierId'),
                    initialValue: titles[supplierId] ?? '',
                    onChanged: (value) {
                      onTitleChanged(supplierId: supplierId, value: value);
                    },
                  ),
                  ValidationErrorMessage(
                    visible: invalidTitleSupplierIds.value.contains(supplierId),
                    text: Intl.message(
                      'issue_form_procurement_requested_invalid_4',
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    Intl.message('issue_form_procurement_requested_2'),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  IgnorePointer(
                    ignoring: isDeliveryNullable,
                    child: Opacity(
                      opacity: isDeliveryNullable ? 0.4 : 1.0,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (_) => DatePickerDialog(
                              initialDate: deliveryDates[supplierId],
                            ),
                          );

                          if (result == null) return;

                          onDeliveryDateChanged(
                            supplierId: supplierId,
                            date: result,
                          );
                        },
                        icon: Icon(Symbols.date_range_rounded),
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (deliveryDates[supplierId] == null)
                              Text(
                                Intl.message(
                                  'issue_form_procurement_requested_2',
                                ),
                              )
                            else
                              Text(
                                DateFormat.yMMMd(
                                  Intl.getCurrentLocale(),
                                ).format(deliveryDates[supplierId]!),
                              ),
                            SizedBox(width: 8.0),
                            if (deliveryDates[supplierId] == null)
                              Icon(Symbols.chevron_right_rounded)
                            else
                              InkWell(
                                onTap: () {
                                  onDeliveryDateChanged(
                                    supplierId: supplierId,
                                    date: null,
                                  );
                                },
                                borderRadius: BorderRadius.circular(4.0),
                                child: const Icon(Symbols.close_rounded),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  AppToggleButton(
                    value: isDeliveryNullable,
                    onChanged: (value) {
                      final checked = value;
                      nullableDeliverySupplierIds.value = {
                        ...nullableDeliverySupplierIds.value,
                      };

                      if (checked) {
                        nullableDeliverySupplierIds.value = {
                          ...nullableDeliverySupplierIds.value,
                          supplierId,
                        };
                        onDeliveryDateChanged(
                          supplierId: supplierId,
                          date: null,
                        );
                      } else {
                        nullableDeliverySupplierIds.value = {
                          ...nullableDeliverySupplierIds.value,
                        }..remove(supplierId);
                      }
                    },
                    child: Text(
                      Intl.message('issue_form_procurement_requested_5'),
                    ),
                  ),
                  ValidationErrorMessage(
                    visible:
                        !isDeliveryNullable &&
                        invalidDeliverySupplierIds.value.contains(supplierId),
                    text: Intl.message(
                      'issue_form_procurement_requested_invalid_2',
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    Intl.message('issue_form_procurement_requested_3'),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  IgnorePointer(
                    ignoring: isPaymentTermsNullable,
                    child: Opacity(
                      opacity: isPaymentTermsNullable ? 0.4 : 1.0,
                      child: TextFormField(
                        key: ValueKey('request-payment-terms-$supplierId'),
                        initialValue: paymentTerms[supplierId] ?? '',
                        onChanged: (value) {
                          onPaymentTermsChanged(
                            supplierId: supplierId,
                            value: value,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  AppToggleButton(
                    value: isPaymentTermsNullable,
                    onChanged: (value) {
                      final checked = value;

                      if (checked) {
                        nullablePaymentTermsSupplierIds.value = {
                          ...nullablePaymentTermsSupplierIds.value,
                          supplierId,
                        };
                        onPaymentTermsChanged(
                          supplierId: supplierId,
                          value: null,
                        );
                      } else {
                        nullablePaymentTermsSupplierIds.value = {
                          ...nullablePaymentTermsSupplierIds.value,
                        }..remove(supplierId);
                      }
                    },
                    child: Text(
                      Intl.message('issue_form_procurement_requested_5'),
                    ),
                  ),
                  ValidationErrorMessage(
                    visible:
                        !isPaymentTermsNullable &&
                        invalidPaymentTermsSupplierIds.value.contains(
                          supplierId,
                        ),
                    text: Intl.message(
                      'issue_form_procurement_requested_invalid_3',
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    Intl.message('issue_form_procurement_requested_4'),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  if (hasFees[supplierId] == true)
                    Text(
                      '(${NumberFormat('#,###').format(total)} × 10%) ${NumberFormat('#,###').format(total + (total / 10))} ₩',
                    )
                  else
                    Text('${NumberFormat('#,###').format(total)} ₩'),
                  SizedBox(height: 8.0),
                  AppToggleButton(
                    value: hasFees[supplierId],
                    onChanged: (value) {
                      onHasFeeChanged(supplierId: supplierId, hasFee: value);
                    },
                    child: Text(
                      Intl.message('issue_form_procurement_requested_1'),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    Intl.message('common_note'),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    key: ValueKey('request-note-$supplierId'),
                    initialValue: notes[supplierId] ?? '',
                    maxLines: 3,
                    onChanged: (value) {
                      onNoteChanged(supplierId: supplierId, note: value);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            SingleChildScrollView(
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
                    color: colorScheme.outline.subtle,
                    width: 1.0,
                  ),
                  horizontalInside: BorderSide(
                    color: colorScheme.outline.subtle,
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    color: colorScheme.outline.subtle,
                    width: 1.0,
                  ),
                ),
                columns: [
                  DataColumn(
                    columnWidth: FixedColumnWidth(220.0),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.text_fields_rounded,
                            color: colorScheme.onSurface.strong,
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_2'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface.strong,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    columnWidth: FixedColumnWidth(220.0),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.text_fields_rounded,
                            color: colorScheme.onSurface.strong,
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_3'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface.strong,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    columnWidth: FixedColumnWidth(90.0),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.numbers_rounded,
                            color: colorScheme.onSurface.strong,
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_4'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface.strong,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    columnWidth: FixedColumnWidth(150.0),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.numbers_rounded,
                            color: colorScheme.onSurface.strong,
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_5'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface.strong,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    columnWidth: FixedColumnWidth(170.0),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Symbols.numbers_rounded,
                            color: colorScheme.onSurface.strong,
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            Intl.message('issue_form_procurement_6'),
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface.strong,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                rows: List.generate(itemsBySupplier.length, (itemIndex) {
                  final globalIndex = supplierItemIndexes[itemIndex];

                  void updateTotalAmountFromInputs() {
                    final quantity = quantityControllers[globalIndex].text
                        .trim()
                        .replaceAll(',', '');
                    final unitPrice = unitPriceControllers[globalIndex].text
                        .trim()
                        .replaceAll(',', '');

                    final parsedQuantity = int.tryParse(quantity);
                    final parsedUnitPrice = int.tryParse(unitPrice);

                    if (parsedQuantity == null || parsedUnitPrice == null) {
                      return;
                    }

                    final totalAmount = NumberFormat(
                      '#,###',
                    ).format(parsedQuantity * parsedUnitPrice);
                    totalAmountControllers[globalIndex].text = totalAmount;

                    onItemChanged(
                      supplierId: supplierId,
                      index: itemIndex,
                      totalAmount: totalAmount,
                    );
                  }

                  return DataRow(
                    cells: [
                      DataCell(
                        SizedBox(
                          width: 220.0,
                          child: ListenableBuilder(
                            listenable: itemFocuses[globalIndex],
                            builder: (_, _) => Material(
                              elevation: itemFocuses[globalIndex].hasFocus
                                  ? 1.0
                                  : 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                              color: itemFocuses[globalIndex].hasFocus
                                  ? colorScheme.surfaceBright
                                  : colorScheme.surfaceContainerLow,
                              child: TextField(
                                controller: itemControllers[globalIndex],
                                focusNode: itemFocuses[globalIndex],
                                maxLines: 1,
                                style: textTheme.bodyMedium,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      width: 2.0,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  onItemChanged(
                                    supplierId: supplierId,
                                    index: itemIndex,
                                    item: value,
                                  );
                                },
                                onSubmitted: (_) =>
                                    specFocuses[globalIndex].requestFocus(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 220.0,
                          child: ListenableBuilder(
                            listenable: specFocuses[globalIndex],
                            builder: (_, _) => Material(
                              elevation: specFocuses[globalIndex].hasFocus
                                  ? 1.0
                                  : 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                              color: specFocuses[globalIndex].hasFocus
                                  ? colorScheme.surfaceBright
                                  : colorScheme.surfaceContainerLow,
                              child: TextField(
                                controller: specControllers[globalIndex],
                                focusNode: specFocuses[globalIndex],
                                maxLines: 1,
                                style: textTheme.bodyMedium,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      width: 2.0,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  onItemChanged(
                                    supplierId: supplierId,
                                    index: itemIndex,
                                    spec: value,
                                  );
                                },
                                onSubmitted: (_) =>
                                    quantityFocuses[globalIndex].requestFocus(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 90.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(8.0),
                            color: colorScheme.surfaceContainerLow,
                            child: TextField(
                              controller: quantityControllers[globalIndex],
                              focusNode: quantityFocuses[globalIndex],
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              maxLines: 1,
                              textAlign: TextAlign.end,
                              style: textTheme.bodyMedium,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    width: 2.0,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                updateTotalAmountFromInputs();
                                onItemChanged(
                                  supplierId: supplierId,
                                  index: itemIndex,
                                  quantity: value,
                                );
                              },
                              onSubmitted: (_) =>
                                  unitPriceFocuses[globalIndex].requestFocus(),
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 150.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(8.0),
                            color: colorScheme.surfaceContainerLow,
                            child: TextField(
                              controller: unitPriceControllers[globalIndex],
                              focusNode: unitPriceFocuses[globalIndex],
                              keyboardType: TextInputType.number,
                              inputFormatters: [DecimalInputFormatter()],
                              maxLines: 1,
                              textAlign: TextAlign.end,
                              style: textTheme.bodyMedium,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    width: 2.0,
                                    color: colorScheme.primary,
                                  ),
                                ),
                                suffixText: '₩',
                              ),
                              onChanged: (value) {
                                updateTotalAmountFromInputs();
                                onItemChanged(
                                  supplierId: supplierId,
                                  index: itemIndex,
                                  unitPrice: value,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 170.0,
                          child: TextField(
                            controller: totalAmountControllers[globalIndex],
                            textAlign: TextAlign.end,
                            keyboardType: TextInputType.number,
                            inputFormatters: [DecimalInputFormatter()],
                            style: textTheme.bodyMedium,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              suffixText: '₩',
                            ),
                            onChanged: (value) {
                              onItemChanged(
                                supplierId: supplierId,
                                index: itemIndex,
                                totalAmount: value,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            ValidationErrorMessage(
              visible: hasProcurementIssueItems.value.contains(supplierId),
              text: Intl.message('issue_form_procurement_item_invalid_1'),
            ),
            ValidationErrorMessage(
              visible: isProcurementIssueItemEmpty.value.contains(supplierId),
              text: Intl.message('issue_form_procurement_item_invalid_2'),
            ),
          ],
        );
      },
      separatorBuilder: (_, _) => SizedBox(height: 36.0),
    );
  }
}
