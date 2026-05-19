part of '../controller.dart';

@freezed
abstract class IssueFormState with _$IssueFormState {
  const factory IssueFormState({
    IssueCategory? category,
    String? content,
    List<IssueAttachment>? attachments,
    List<XFile>? files,
    Currency? currency,
    DateTime? kickoffDate,
    @Default(false) bool isRequested,
    @Default(false) bool isOrdered,
    @Default([]) List<ContractIssueItem> contractItems,
    @Default([]) List<TransactionIssueItem> transactionItems,
    @Default([]) List<ProcurementIssueItem> procurementItems,
  }) = _IssueFormState;
}
