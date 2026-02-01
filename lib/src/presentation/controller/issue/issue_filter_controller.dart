part of '../controller.dart';

@riverpod
class IssueFilterController extends _$IssueFilterController {
  @override
  FutureOr<IssueFilterState> build() async {
    return _init();
  }

  Future<IssueFilterState> _init() async {
    final categories = await ref
        .read(issueRepositoryProvider)
        .getAllCategories();

    final transactionCategories = await ref
        .read(issueRepositoryProvider)
        .getAllTransactionCategories();

    final currencies = await ref
        .read(currencyRepositoryProvider)
        .getAllCurrencies();

    return IssueFilterState(
      categories: categories,
      transactionCategories: transactionCategories,
      currencies: currencies,
    );
  }
}
