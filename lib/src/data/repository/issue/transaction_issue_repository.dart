part of '../../data.dart';

abstract class TransactionIssueRepository {
  Future<List<TransactionIssueItemCategory>> getAllTransactionCategories();
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
