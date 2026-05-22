part of '../data.dart';

abstract class IssueRepository {
  Future<IssueCategory> getCategory({required int id});

  Future<List<IssueCategory>> getAllCategories();

  Future<List<TransactionIssueItemCategory>> getAllTransactionCategories();

  Future<Result<LatestIssue>> getLatestIssues({int page = 1, int limit = 20});

  Future<HttpResponse<List<int>>> exportPurchaseRequest({required int id});

  Future<HttpResponse<List<int>>> exportPurchaseOrder({required int id});

  Future<List<ContractIssueItem>> getContractIssueItems({required int id});

  Future<List<TransactionIssueItem>> getTransactionIssueItems({
    required int id,
  });

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

  Future<void> sendMail({required int id, required SendIssueMailDto request});

  Future<Issue> createContractIssue({required CreateContractIssueDto request});

  Future<Issue> createKickoffIssue({required CreateKickoffIssueDto request});

  Future<Issue> createTransactionIssue({
    required CreateTransactionIssueDto request,
  });

  Future<Issue> createApprovalIssue({required CreateApprovalIssueDto request});

  Future<Issue> createProcurementIssueRequest({
    required int id,
    required CreateProcurementIssueRequestDto request,
  });

  Future<void> approveProcurementIssueRequest({required int id});

  Future<Issue> createProcurementIssue({
    required CreateProcurementIssueDto request,
  });

  Future<Issue> createPaymentIssue({required CreatePaymentIssueDto request});

  Future<Issue> updateContractIssue({
    required int id,
    required UpdateContractIssueDto request,
  });

  Future<Issue> updateKickoffIssue({
    required int id,
    required UpdateKickoffIssueDto request,
  });

  Future<Issue> updateTransactionIssue({
    required int id,
    required UpdateTransactionIssueDto request,
  });

  Future<Issue> updateApprovalIssue({
    required int id,
    required UpdateApprovalIssueDto request,
  });

  Future<Issue> updateProcurementIssue({
    required int id,
    required UpdateProcurementIssueDto request,
  });

  Future<Issue> updatePaymentIssue({
    required int id,
    required UpdatePaymentIssueDto request,
  });

  Future<Issue> deleteIssue({required int id});

  Future<void> restoreIssue({required int id});

  Future<List<IssueAttachment>> uploadAttachments({
    required int issueId,
    required List<MultipartFile> files,
  });

  Future<void> deleteAttachment({required int issueId, required int fileId});
}
