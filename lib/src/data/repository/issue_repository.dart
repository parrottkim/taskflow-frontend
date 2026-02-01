part of '../data.dart';

abstract class IssueRepository {
  Future<IssueCategory> getCategory({required int id});

  Future<List<IssueCategory>> getAllCategories();

  Future<List<TransactionItemCategory>> getAllTransactionCategories();

  Future<Result<LatestIssue>> getLatestIssues({int page = 1, int limit = 20});

  Future<List<ContractItem>> getContractItems({required int id});

  Future<List<TransactionItem>> getTransactionItems({required int id});

  Future<HttpResponse<ContractIssue?>> getContractIssue({required int id});

  Future<HttpResponse<KickoffIssue?>> getKickoffIssue({required int id});

  Future<HttpResponse<TransactionIssue?>> getTransactionIssue({
    required int id,
  });

  Future<HttpResponse<PaymentIssue?>> getPaymentIssue({required int id});

  Future<Result<ApprovalIssue>> getApprovalIssues({
    int page = 1,
    int limit = 10,
    required int projectId,
  });

  Future<Result<ProcurementIssue>> getProcurementIssues({
    int page = 1,
    int limit = 10,
    required int projectId,
  });

  Future<Issue> getIssue({required int id});

  Future<void> sendMail({required int id});

  Future<Issue> createIssue({required CreateIssueRequest request});

  Future<Issue> updateIssue({
    required int id,
    required UpdateIssueRequest request,
  });

  Future<Issue> deleteIssue({required int id});

  Future<void> restoreIssue({required int id});

  Future<List<IssueAttachment>> uploadAttachments({
    required int issueId,
    required List<MultipartFile> files,
  });

  Future<void> deleteAttachment({required int issueId, required int fileId});
}
