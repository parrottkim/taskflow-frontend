part of '../controller.dart';

@riverpod
class IssueFilterController extends _$IssueFilterController {
  @override
  FutureOr<IssueFilterState> build() async {
    return _init();
  }

  Future<IssueFilterState> _init() async {
    final transactionCategories =
        await ref.read(issueRepositoryProvider).getAllTransactionCategories();

    final currencies =
        await ref.read(currencyRepositoryProvider).getAllCurrencies();

    return IssueFilterState(
        transactionCategories: transactionCategories, currencies: currencies);
  }
}
