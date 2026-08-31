part of '../controller.dart';

@riverpod
Future<IssueOptionsState> issueOptions(Ref ref) async {
  final categories = await ref.read(issueRepositoryProvider).getAllCategories();
  final transactionCategories = await ref
      .read(issueRepositoryProvider)
      .getAllTransactionCategories();
  final currencies = await ref
      .read(currencyRepositoryProvider)
      .getAllCurrencies();

  return IssueOptionsState(
    categories: categories,
    transactionCategories: transactionCategories,
    currencies: currencies,
  );
}
