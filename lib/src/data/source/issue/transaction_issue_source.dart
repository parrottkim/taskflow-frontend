part of '../../data.dart';

class TransactionIssueDataSource implements TransactionIssueRepository {
  final TransactionIssueService _service;

  TransactionIssueDataSource({required this._service});

  @override
  Future<List<TransactionIssueItemCategory>> getAllTransactionCategories() =>
      _service.getAllTransactionCategories();

  @override
  Future<List<TransactionIssueItem>> getTransactionIssueItems({
    required int id,
  }) => _service.getTransactionIssueItems(id: id);

  @override
  Future<HttpResponse<TransactionIssue?>> getTransactionIssue({
    required int id,
  }) => _service.getTransactionIssue(id: id);

  @override
  Future<Issue> createTransactionIssue({
    required CreateTransactionIssueRequest request,
  }) => _service.createTransactionIssue(request: request);

  @override
  Future<Issue> updateTransactionIssue({
    required int id,
    required UpdateTransactionIssueRequest request,
  }) => _service.updateTransactionIssue(id: id, request: request);
}

@riverpod
TransactionIssueRepository transactionIssueRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return TransactionIssueDataSource(service: TransactionIssueService(dio));
}
