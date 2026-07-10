part of '../data.dart';

abstract class IssueRepository {
  // --- 공통 & 글로벌 마스터 (최상단 고정 주소 매핑) ---
  Future<List<IssueCategory>> getAllCategories();
  Future<Result<LatestIssue>> getLatestIssues({int page = 1, int limit = 20});
  Future<List<TransactionIssueItemCategory>> getAllTransactionCategories();

  // --- 도메인별 목록 조회 API ---
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

  // --- 도메인별 세부 액션 및 하위 조회 API (/:id/하위주소) ---
  Future<List<ContractIssueItem>> getContractIssueItems({required int id});
  Future<HttpResponse<List<int>>> exportPurchaseRequest({required int id});
  Future<HttpResponse<List<int>>> exportPurchaseOrder({required int id});
  Future<Issue> createProcurementIssueRequest({
    required int id,
    required CreateProcurementIssueRequestDto request,
  });
  Future<Issue> updateProcurementIssueRequest({
    required int id,
    required CreateProcurementIssueRequestDto request,
  });
  Future<void> approveProcurementIssueRequest({required int id});
  Future<void> deleteProcurementIssueRequest({required int id});
  Future<List<TransactionIssueItem>> getTransactionIssueItems({
    required int id,
  });

  // --- 도메인별 단독 ID 및 CUD API ---
  // CONTRACT
  Future<HttpResponse<ContractIssue?>> getContractIssue({required int id});
  Future<Issue> createContractIssue({required CreateContractIssueDto request});
  Future<Issue> updateContractIssue({
    required int id,
    required UpdateContractIssueDto request,
  });

  // KICKOFF
  Future<HttpResponse<KickoffIssue?>> getKickoffIssue({required int id});
  Future<Issue> createKickoffIssue({required CreateKickoffIssueDto request});
  Future<Issue> updateKickoffIssue({
    required int id,
    required UpdateKickoffIssueDto request,
  });

  // APPROVAL
  Future<Issue> createApprovalIssue({required CreateApprovalIssueDto request});
  Future<Issue> updateApprovalIssue({
    required int id,
    required UpdateApprovalIssueDto request,
  });

  // PROCUREMENT
  Future<Issue> createProcurementIssue({
    required CreateProcurementIssueDto request,
  });
  Future<Issue> updateProcurementIssue({
    required int id,
    required UpdateProcurementIssueDto request,
  });

  // TRANSACTION
  Future<HttpResponse<TransactionIssue?>> getTransactionIssue({
    required int id,
  });
  Future<Issue> createTransactionIssue({
    required CreateTransactionIssueDto request,
  });
  Future<Issue> updateTransactionIssue({
    required int id,
    required UpdateTransactionIssueDto request,
  });

  // PAYMENT
  Future<HttpResponse<PaymentIssue?>> getPaymentIssue({required int id});
  Future<Issue> createPaymentIssue({required CreatePaymentIssueDto request});
  Future<Issue> updatePaymentIssue({
    required int id,
    required UpdatePaymentIssueDto request,
  });

  // --- 글로벌 터미널 및 공통 ID 액션 (최하단 격리) ---
  Future<IssueCategory> getCategory({required int id});
  Future<void> sendMail({required int id, required SendIssueMailDto request});
  Future<Issue> getIssueForProcurementRequest({required int id});
  Future<Issue> getIssueForEdit({required int id});
  Future<Issue> getIssue({required int id});
  Future<Issue> deleteIssue({required int id});
  Future<Issue> restoreIssue({required int id});
  Future<List<IssueAttachment>> uploadAttachments({
    required int issueId,
    required List<MultipartFile> files,
  });
  Future<void> deleteAttachment({required int issueId, required int fileId});
}
