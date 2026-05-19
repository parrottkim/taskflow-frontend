part of '../controller.dart';

@riverpod
class ProcurementIssueFormController extends _$ProcurementIssueFormController {
  @override
  FutureOr<ProcurementIssueFormState> build({required int issueId}) => _init();

  Future<ProcurementIssueFormState> _init() async {
    final issue = await ref.read(issueRepositoryProvider).getIssue(id: issueId);

    return ProcurementIssueFormState(
      items: issue.procurementItems,
      requests: issue.requests,
    );
  }

  void setSelectedSupplierIds({required Set<int> selectedSupplierIds}) {
    final value = state.value;

    if (value == null) return;

    final nextDeliveryDates = <int, DateTime?>{};
    final nextPaymentTerms = <int, String>{};
    final nextHasFees = <int, bool>{};
    final nextNotes = <int, String>{};

    for (final supplierId in selectedSupplierIds) {
      nextDeliveryDates[supplierId] = value.deliveryDates[supplierId];
      nextPaymentTerms[supplierId] = value.paymentTerms[supplierId] ?? '';
      nextHasFees[supplierId] = value.hasFees[supplierId] ?? false;
      nextNotes[supplierId] = value.notes[supplierId] ?? '';
    }

    state = AsyncData(
      value.copyWith(
        selectedSupplierIds: selectedSupplierIds,
        deliveryDates: nextDeliveryDates,
        paymentTerms: nextPaymentTerms,
        hasFees: nextHasFees,
        notes: nextNotes,
      ),
    );
  }

  void updateSupplierRequest({
    required int supplierId,
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

    final nextDeliveryDates = {...value.deliveryDates};
    final nextPaymentTerms = {...value.paymentTerms};
    final nextHasFees = {...value.hasFees};
    final nextNotes = {...value.notes};

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
