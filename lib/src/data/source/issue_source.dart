part of '../data.dart';

class IssueDataSource implements IssueRepository {
  final IssueService _service;

  IssueDataSource({required IssueService service}) : _service = service;

  @override
  Future<IssueCategory> getCategory({required int id}) =>
      _service.getCategory(id: id);

  @override
  Future<List<IssueCategory>> getAllCategories() => _service.getAllCategories();

  @override
  Future<List<TransactionItemCategory>> getAllTransactionCategories() =>
      _service.getAllTransactionCategories();

  @override
  Future<Result<LatestIssue>> getLatestIssues({int page = 1, int limit = 20}) =>
      _service.getLatestIssues(page: page, limit: limit);

  @override
  Future<HttpResponse<List<int>>> exportPurchaseRequest({required int id}) =>
      _service.exportPurchaseRequest(id: id);

  @override
  Future<List<ContractItem>> getContractItems({required int id}) =>
      _service.getContractItems(id: id);

  @override
  Future<List<TransactionItem>> getTransactionItems({required int id}) =>
      _service.getTransactionItems(id: id);

  @override
  Future<HttpResponse<ContractIssue?>> getContractIssue({required int id}) =>
      _service.getContractIssue(id: id);

  @override
  Future<HttpResponse<KickoffIssue?>> getKickoffIssue({required int id}) =>
      _service.getKickoffIssue(id: id);

  @override
  Future<HttpResponse<TransactionIssue?>> getTransactionIssue({
    required int id,
  }) => _service.getTransactionIssue(id: id);

  @override
  Future<HttpResponse<PaymentIssue?>> getPaymentIssue({required int id}) =>
      _service.getPaymentIssue(id: id);

  @override
  Future<Result<ApprovalIssue>> getApprovalIssues({
    int page = 1,
    int limit = 10,
    required int projectId,
  }) => _service.getApprovalIssues(
    page: page,
    limit: limit,
    projectId: projectId,
  );

  @override
  Future<Result<ProcurementIssue>> getProcurementIssues({
    int page = 1,
    int limit = 10,
    required int projectId,
  }) => _service.getProcurementIssues(
    page: page,
    limit: limit,
    projectId: projectId,
  );

  @override
  Future<Issue> getIssue({required int id}) => _service.getIssue(id: id);

  @override
  Future<void> sendMail({
    required int id,
    required SendIssueMailRequest request,
  }) => _service.sendMail(id: id, request: request);

  @override
  Future<Issue> createContractIssue({
    required CreateContractIssueRequest request,
  }) => _service.createContractIssue(request: request);

  @override
  Future<Issue> createKickoffIssue({
    required CreateKickoffIssueRequest request,
  }) => _service.createKickoffIssue(request: request);

  @override
  Future<Issue> createTransactionIssue({
    required CreateTransactionIssueRequest request,
  }) => _service.createTransactionIssue(request: request);

  @override
  Future<Issue> createApprovalIssue({
    required CreateApprovalIssueRequest request,
  }) => _service.createApprovalIssue(request: request);

  @override
  Future<Issue> createProcurementIssue({
    required CreateProcurementIssueRequest request,
  }) => _service.createProcurementIssue(request: request);

  @override
  Future<Issue> createPaymentIssue({
    required CreatePaymentIssueRequest request,
  }) => _service.createPaymentIssue(request: request);

  @override
  Future<Issue> updateContractIssue({
    required int id,
    required UpdateContractIssueRequest request,
  }) => _service.updateContractIssue(id: id, request: request);

  @override
  Future<Issue> updateKickoffIssue({
    required int id,
    required UpdateKickoffIssueRequest request,
  }) => _service.updateKickoffIssue(id: id, request: request);

  @override
  Future<Issue> updateTransactionIssue({
    required int id,
    required UpdateTransactionIssueRequest request,
  }) => _service.updateTransactionIssue(id: id, request: request);

  @override
  Future<Issue> updateApprovalIssue({
    required int id,
    required UpdateApprovalIssueRequest request,
  }) => _service.updateApprovalIssue(id: id, request: request);

  @override
  Future<Issue> updateProcurementIssue({
    required int id,
    required UpdateProcurementIssueRequest request,
  }) => _service.updateProcurementIssue(id: id, request: request);

  @override
  Future<Issue> updatePaymentIssue({
    required int id,
    required UpdatePaymentIssueRequest request,
  }) => _service.updatePaymentIssue(id: id, request: request);

  @override
  Future<Issue> deleteIssue({required int id}) => _service.deleteIssue(id: id);

  @override
  Future<Issue> restoreIssue({required int id}) =>
      _service.restoreIssue(id: id);

  @override
  Future<List<IssueAttachment>> uploadAttachments({
    required int issueId,
    required List<MultipartFile> files,
  }) => _service.uploadAttachments(issueId: issueId, files: files);

  @override
  Future<void> deleteAttachment({required int issueId, required int fileId}) =>
      _service.deleteAttachment(issueId: issueId, fileId: fileId);
}

@riverpod
IssueRepository issueRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return IssueDataSource(service: IssueService(dio));
}
