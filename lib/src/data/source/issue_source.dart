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
  Future<List<TransactionIssueItemCategory>> getAllTransactionCategories() =>
      _service.getAllTransactionCategories();

  @override
  Future<Result<LatestIssue>> getLatestIssues({int page = 1, int limit = 20}) =>
      _service.getLatestIssues(page: page, limit: limit);

  @override
  Future<HttpResponse<List<int>>> exportPurchaseRequest({required int id}) =>
      _service.exportPurchaseRequest(id: id);

  @override
  Future<HttpResponse<List<int>>> exportPurchaseOrder({required int id}) =>
      _service.exportPurchaseOrder(id: id);

  @override
  Future<List<ContractIssueItem>> getContractIssueItems({required int id}) =>
      _service.getContractIssueItems(id: id);

  @override
  Future<List<TransactionIssueItem>> getTransactionIssueItems({
    required int id,
  }) => _service.getTransactionIssueItems(id: id);

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
  Future<void> sendMail({required int id, required SendIssueMailDto request}) =>
      _service.sendMail(id: id, request: request);

  @override
  Future<Issue> createContractIssue({
    required CreateContractIssueDto request,
  }) => _service.createContractIssue(request: request);

  @override
  Future<Issue> createKickoffIssue({required CreateKickoffIssueDto request}) =>
      _service.createKickoffIssue(request: request);

  @override
  Future<Issue> createTransactionIssue({
    required CreateTransactionIssueDto request,
  }) => _service.createTransactionIssue(request: request);

  @override
  Future<Issue> createApprovalIssue({
    required CreateApprovalIssueDto request,
  }) => _service.createApprovalIssue(request: request);

  @override
  Future<Issue> createProcurementIssueRequest({
    required int id,
    required CreateProcurementIssueRequestDto request,
  }) => _service.createProcurementIssueRequest(id: id, request: request);

  @override
  Future<void> approveProcurementIssueRequest({required int id}) =>
      _service.approveProcurementIssueRequest(id: id);

  @override
  Future<Issue> createProcurementIssue({
    required CreateProcurementIssueDto request,
  }) => _service.createProcurementIssue(request: request);

  @override
  Future<Issue> createPaymentIssue({required CreatePaymentIssueDto request}) =>
      _service.createPaymentIssue(request: request);

  @override
  Future<Issue> updateContractIssue({
    required int id,
    required UpdateContractIssueDto request,
  }) => _service.updateContractIssue(id: id, request: request);

  @override
  Future<Issue> updateKickoffIssue({
    required int id,
    required UpdateKickoffIssueDto request,
  }) => _service.updateKickoffIssue(id: id, request: request);

  @override
  Future<Issue> updateTransactionIssue({
    required int id,
    required UpdateTransactionIssueDto request,
  }) => _service.updateTransactionIssue(id: id, request: request);

  @override
  Future<Issue> updateApprovalIssue({
    required int id,
    required UpdateApprovalIssueDto request,
  }) => _service.updateApprovalIssue(id: id, request: request);

  @override
  Future<Issue> updateProcurementIssue({
    required int id,
    required UpdateProcurementIssueDto request,
  }) => _service.updateProcurementIssue(id: id, request: request);

  @override
  Future<Issue> updatePaymentIssue({
    required int id,
    required UpdatePaymentIssueDto request,
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
