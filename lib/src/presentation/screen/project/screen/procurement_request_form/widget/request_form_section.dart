import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/project/screen/procurement_request_form/widget/item_edit_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/procurement_request_form/widget/supplier_select_widget.dart';

class RequestFormSection extends StatelessWidget {
  final String? step;
  final List<ProcurementIssueItem> items;
  final List<ProcurementIssueRequest> requests;
  final Set<int> selectedSupplierIds;
  final ValueNotifier<bool> isSelectedSupplierEmpty;
  final ValueChanged<(int supplierId, bool selected)>
  onSupplierSelectionChanged;
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
  onRequestedItemChanged;

  const RequestFormSection({
    super.key,
    this.step,
    required this.items,
    required this.requests,
    required this.selectedSupplierIds,
    required this.isSelectedSupplierEmpty,
    required this.onSupplierSelectionChanged,
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
    required this.onRequestedItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return switch (step) {
      'select' => SupplierSelectWidget(
        items: items,
        requests: requests,
        selectedSupplierIds: selectedSupplierIds,
        onSupplierSelectionChanged: onSupplierSelectionChanged,
        isSelectedSupplierEmpty: isSelectedSupplierEmpty,
      ),
      'edit' => ItemEditWidget(
        items: items,
        selectedSupplierIds: selectedSupplierIds,
        titles: titles,
        deliveryDates: deliveryDates,
        paymentTerms: paymentTerms,
        hasFees: hasFees,
        notes: notes,
        invalidTitleSupplierIds: invalidTitleSupplierIds,
        nullableDeliverySupplierIds: nullableDeliverySupplierIds,
        nullablePaymentTermsSupplierIds: nullablePaymentTermsSupplierIds,
        invalidDeliverySupplierIds: invalidDeliverySupplierIds,
        invalidPaymentTermsSupplierIds: invalidPaymentTermsSupplierIds,
        hasProcurementIssueItems: hasProcurementIssueItems,
        isProcurementIssueItemEmpty: isProcurementIssueItemEmpty,
        onTitleChanged: onTitleChanged,
        onDeliveryDateChanged: onDeliveryDateChanged,
        onPaymentTermsChanged: onPaymentTermsChanged,
        onHasFeeChanged: onHasFeeChanged,
        onNoteChanged: onNoteChanged,
        onItemChanged: onRequestedItemChanged,
      ),
      _ => Center(child: Text(Intl.message('unknown_step'))),
    };
  }
}
