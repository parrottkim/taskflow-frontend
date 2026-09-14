part of '../../data.dart';

abstract class TransactionIssueRepository {
  Future<List<TransactionIssueItemCategory>> getAllTransactionCategories();
  Future<List<TransactionIssueItem>> getTransactionIssueItems({
    required int id,
  });
  Future<HttpResponse<TransactionIssue?>> getTransactionIssue({
    required int id,
  });

  Future<Issue> createTransactionIssue({
    required CreateTransactionIssueRequest request,
  });

  Future<Issue> updateTransactionIssue({
    required int id,
    required UpdateTransactionIssueRequest request,
  });
}
