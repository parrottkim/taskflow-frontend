part of '../controller.dart';

@freezed
abstract class IssueFormState with _$IssueFormState {
  const factory IssueFormState({
    required IssueCategory category,
    String? content,
    @Default(<IssueAttachment>[]) List<IssueAttachment> attachments,
    @Default(<XFile>[]) List<XFile> files,
    Currency? currency,
    DateTime? kickoffDate,
    @Default([]) List<ContractIssueItem> contractItems,
    @Default([]) List<TransactionIssueItem> transactionItems,
    @Default([]) List<ProcurementIssueItem> procurementItems,
    @Default([]) List<ProcurementIssueRequest> requests,
  }) = _IssueFormState;
}
