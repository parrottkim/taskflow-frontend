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

    return IssueFilterState(transactionCategories: transactionCategories);
  }
}
