part of '../controller.dart';

@freezed
abstract class IssueFilterState with _$IssueFilterState {
  factory IssueFilterState({
    @Default([]) List<IssueCategory> categories,
    @Default([]) List<TransactionIssueItemCategory> transactionCategories,
    @Default([]) List<Currency> currencies,
  }) = _IssueFilterState;
}
