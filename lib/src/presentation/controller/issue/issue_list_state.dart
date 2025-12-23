part of '../controller.dart';

@freezed
abstract class IssueListState with _$IssueListState {
  factory IssueListState({
    ContractIssue? contract,
    KickoffIssue? kickoff,
    TransactionIssue? transaction,
    PaymentIssue? payment,
    @Default([]) List<DeclarationIssue> declarations,
    @Default(1) int declarationsPage,
    @Default(0) int declarationsTotal,
    @Default(false) bool declarationsHasReachEnd,
    @Default([]) List<ProcurementIssue> procurements,
    @Default(1) int procurementsPage,
    @Default(0) int procurementsTotal,
    @Default(false) bool procurementsHasReachEnd,
  }) = _IssueListState;
}
