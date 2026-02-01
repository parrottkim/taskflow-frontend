part of '../controller.dart';

@freezed
abstract class IssueListState with _$IssueListState {
  factory IssueListState({
    ContractIssue? contract,
    KickoffIssue? kickoff,
    TransactionIssue? transaction,
    PaymentIssue? payment,
    @Default([]) List<ApprovalIssue> approvals,
    @Default(1) int approvalsPage,
    @Default(0) int approvalsTotal,
    @Default(false) bool approvalsHasReachEnd,
    @Default([]) List<ProcurementIssue> procurements,
    @Default(1) int procurementsPage,
    @Default(0) int procurementsTotal,
    @Default(false) bool procurementsHasReachEnd,
    @Default([]) List<ContractItem> contractItems,
    @Default([]) List<TransactionItem> transactionItems,
  }) = _IssueListState;
}
