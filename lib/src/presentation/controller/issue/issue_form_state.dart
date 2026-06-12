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
    @Default([]) List<ContractIssueItem> contractItems,
    @Default([]) List<TransactionIssueItem> transactionItems,
    @Default([]) List<ProcurementIssueItem> procurementItems,
    @Default([]) List<ProcurementIssueRequest> requests,
  }) = _IssueFormState;
}
