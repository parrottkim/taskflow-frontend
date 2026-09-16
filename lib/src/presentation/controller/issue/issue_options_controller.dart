part of '../controller.dart';

@riverpod
Future<IssueOptionsState> issueOptions(Ref ref) async {
  final categories = await ref.read(issueRepositoryProvider).getAllCategories();
  final tripCategories = await ref
      .read(kickoffIssueRepositoryProvider)
      .getAllTripCategories();
  final transactionCategories = await ref
      .read(transactionIssueRepositoryProvider)
      .getAllTransactionCategories();
  final currencies = await ref
      .read(currencyRepositoryProvider)
      .getAllCurrencies();

  return IssueOptionsState(
    categories: categories,
    tripCategories: tripCategories,
    transactionCategories: transactionCategories,
    currencies: currencies,
  );
}
