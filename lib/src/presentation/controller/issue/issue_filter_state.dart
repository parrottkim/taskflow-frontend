part of '../controller.dart';

@freezed
abstract class IssueFilterState with _$IssueFilterState {
  factory IssueFilterState({
    @Default([]) List<TransactionItemCategory> transactionCategories,
  }) = _IssueFilterState;
}
