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

  Future<Issue> createContractIssue({
    required CreateContractIssueRequest request,
  });

  Future<Issue> createKickoffIssue({
    required CreateKickoffIssueRequest request,
  });

  Future<Issue> createTransactionIssue({
    required CreateTransactionIssueRequest request,
  });

  Future<Issue> createApprovalIssue({
    required CreateApprovalIssueRequest request,
  });

  Future<Issue> createProcurementIssue({
    required CreateProcurementIssueRequest request,
  });

  Future<Issue> createPaymentIssue({
    required CreatePaymentIssueRequest request,
  });

  Future<Issue> updateContractIssue({
    required int id,
    required UpdateContractIssueRequest request,
  });

  Future<Issue> updateKickoffIssue({
    required int id,
    required UpdateKickoffIssueRequest request,
  });

  Future<Issue> updateTransactionIssue({
    required int id,
    required UpdateTransactionIssueRequest request,
  });

  Future<Issue> updateApprovalIssue({
    required int id,
    required UpdateApprovalIssueRequest request,
  });

  Future<Issue> updateProcurementIssue({
    required int id,
    required UpdateProcurementIssueRequest request,
  });

  Future<Issue> updatePaymentIssue({
    required int id,
    required UpdatePaymentIssueRequest request,
  });

  Future<Issue> deleteIssue({required int id});

  Future<void> restoreIssue({required int id});

  Future<List<IssueAttachment>> uploadAttachments({
    required int issueId,
    required List<MultipartFile> files,
  });

  Future<void> deleteAttachment({required int issueId, required int fileId});
}
