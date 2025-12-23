part of '../controller.dart';

@freezed
abstract class IssueFormState with _$IssueFormState {
  const factory IssueFormState({
    @Default([]) List<IssueCategory> categories,
    IssueCategory? category,
    String? content,
    List<IssueAttachment>? attachments,
    List<XFile>? files,
    Currency? currency,
    DateTime? kickoffDate,
    @Default([]) List<ContractItem> contractItems,
    @Default([]) List<ProcurementItem> procurementItems,
    @Default([]) List<TransactionItem> transactionItems,
  }) = _IssueFormState;
}
