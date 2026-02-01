part of '../controller.dart';

@freezed
abstract class IssueFilterState with _$IssueFilterState {
  factory IssueFilterState({
    @Default([]) List<IssueCategory> categories,
    @Default([]) List<TransactionItemCategory> transactionCategories,
    @Default([]) List<Currency> currencies,
  }) = _IssueFilterState;
}
