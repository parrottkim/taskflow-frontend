part of '../controller.dart';

@freezed
abstract class IssueOptionsState with _$IssueOptionsState {
  factory IssueOptionsState({
    @Default([]) List<IssueCategory> categories,
    @Default([]) List<KickoffIssueTripItemCategory> tripCategories,
    @Default([]) List<TransactionIssueItemCategory> transactionCategories,
    @Default([]) List<Currency> currencies,
  }) = _IssueOptionsState;
}
