part of '../controller.dart';

@riverpod
class ProcurementIssueFormController extends _$ProcurementIssueFormController {
  @override
  FutureOr<ProcurementIssueFormState> build({
    required int issueId,
    int? requestId,
  }) => _init();

  Future<ProcurementIssueFormState> _init() async {
    final issue = await ref
        .read(issueRepositoryProvider)
        .getIssueForProcurementRequest(id: issueId);

    if (requestId != null) {
      final request = issue.requests.firstWhereOrNull(
        (request) => request.id == requestId,
      );

      if (request != null) {
        final supplierId = request.supplier.id;

        return ProcurementIssueFormState(
          items: request.items
              .map(
                (item) => ProcurementIssueItem(
                  id: item.id,
                  item: item.item,
                  spec: item.spec,
                  quantity: item.quantity,
                  unitPrice: item.unitPrice,
                  totalAmount: item.totalAmount,
                  isOnlinePurchase: item.isOnlinePurchase,
                  purchaseUrl: item.purchaseUrl,
                  supplier: request.supplier,
                  note: item.note,
                ),
              )
              .toList(),
          requests: issue.requests,
          selectedSupplierIds: {supplierId},
          titles: {supplierId: request.title},
          deliveryDates: {supplierId: request.deliveryDate},
          paymentTerms: {supplierId: request.paymentTerms},
          hasFees: {supplierId: request.hasFee},
          notes: {supplierId: request.note},
        );
      }
    }

    return ProcurementIssueFormState(
      items: issue.procurementItems,
      requests: issue.requests,
    );
  }

  void setSelectedSupplierIds({required Set<int> selectedSupplierIds}) {
    final value = state.value;

    if (value == null) return;

    final nextTitles = <int, String>{};
    final nextDeliveryDates = <int, DateTime?>{};
    final nextPaymentTerms = <int, String>{};
    final nextHasFees = <int, bool>{};
    final nextNotes = <int, String>{};

    for (final supplierId in selectedSupplierIds) {
      nextTitles[supplierId] = value.titles[supplierId] ?? '';
      nextDeliveryDates[supplierId] = value.deliveryDates[supplierId];
      nextPaymentTerms[supplierId] = value.paymentTerms[supplierId] ?? '';
      nextHasFees[supplierId] = value.hasFees[supplierId] ?? false;
      nextNotes[supplierId] = value.notes[supplierId] ?? '';
    }

    state = AsyncData(
      value.copyWith(
        selectedSupplierIds: selectedSupplierIds,
        titles: nextTitles,
        deliveryDates: nextDeliveryDates,
        paymentTerms: nextPaymentTerms,
        hasFees: nextHasFees,
        notes: nextNotes,
      ),
    );
  }

  void updateSupplierRequest({
    required int supplierId,
    String? title,
    DateTime? deliveryDate,
    String? paymentTerms,
    bool? hasFee,
    String? note,
    bool updateDeliveryDate = false,
    bool updatePaymentTerms = false,
    bool updateNote = false,
  }) {
    final value = state.value;
    if (value == null) return;

    final nextTitles = {...value.titles};
    final nextDeliveryDates = {...value.deliveryDates};
    final nextPaymentTerms = {...value.paymentTerms};
    final nextHasFees = {...value.hasFees};
    final nextNotes = {...value.notes};

    if (title != null) {
      nextTitles[supplierId] = title;
    }

    if (updateDeliveryDate) {
      nextDeliveryDates[supplierId] = deliveryDate;
    }
    if (updatePaymentTerms) {
      nextPaymentTerms[supplierId] = paymentTerms;
    }
    if (hasFee != null) {
      nextHasFees[supplierId] = hasFee;
    }
    if (updateNote) {
      nextNotes[supplierId] = note;
    }

    state = AsyncData(
      value.copyWith(
        titles: nextTitles,
        deliveryDates: nextDeliveryDates,
        paymentTerms: nextPaymentTerms,
        hasFees: nextHasFees,
        notes: nextNotes,
      ),
    );
  }

  void updateSupplierRequestItem({
    required int supplierId,
    required int index,
    String? item,
    String? spec,
    String? quantity,
    String? unitPrice,
    String? totalAmount,
  }) {
    final value = state.value;

    if (value == null) return;

    final supplierItemIndexes = <int>[];
    for (var i = 0; i < value.items.length; i++) {
      if (value.items[i].supplier?.id == supplierId) {
        supplierItemIndexes.add(i);
      }
    }

    if (index < 0 || index >= supplierItemIndexes.length) {
      return;
    }

    final targetIndex = supplierItemIndexes[index];
    final updatedItems = [...value.items];
    final old = updatedItems[targetIndex];
    updatedItems[targetIndex] = old.copyWith(
      item: item ?? old.item,
      spec: spec ?? old.spec,
      quantity: quantity ?? old.quantity,
      unitPrice: unitPrice ?? old.unitPrice,
      totalAmount: totalAmount ?? old.totalAmount,
    );

    state = AsyncData(value.copyWith(items: updatedItems));
  }
}
