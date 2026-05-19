part of '../controller.dart';

@freezed
abstract class ProcurementIssueFormState with _$ProcurementIssueFormState {
  const ProcurementIssueFormState._();
  factory ProcurementIssueFormState({
    @Default([]) List<ProcurementIssueItem> items,
    @Default([]) List<ProcurementIssueRequest> requests,
    @Default(<int>{}) Set<int> selectedSupplierIds,
    @Default({}) Map<int, DateTime?> deliveryDates,
    @Default({}) Map<int, String?> paymentTerms,
    @Default({}) Map<int, bool> hasFees,
    @Default({}) Map<int, String?> notes,
  }) = _ProcurementIssueFormState;

  List<String> get steps => ['select', 'edit'];
}
