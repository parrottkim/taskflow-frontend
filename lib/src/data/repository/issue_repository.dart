part of '../data.dart';

abstract class IssueRepository {
  Future<List<IssueCategory>> getAllCategories();

  Future<List<TransactionItemCategory>> getAllTransactionCategories();

  Future<Result<LatestIssue>> getLatestIssues({
    int page = 1,
    int limit = 20,
  });

  Future<Issue> getIssue({required int id});

  Future<Result<Issue>> getIssues({
    int page = 1,
    int limit = 10,
    required int projectId,
  });

  Future<Issue> createIssue({
    required CreateIssueRequest request,
  });

  Future<Issue> updateIssue({
    required int id,
    required UpdateIssueRequest request,
  });

  Future<void> deleteIssue({required int id});

  Future<void> restoreIssue({required int id});

  Future<List<IssueAttachment>> uploadAttachments({
    required int issueId,
    required List<MultipartFile> files,
  });

  Future<void> deleteAttachment({
    required int issueId,
    required int fileId,
  });
}
