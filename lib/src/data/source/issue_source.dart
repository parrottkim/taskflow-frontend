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
  Future<void> sendMail({required int id}) => _service.sendMail(id: id);

  @override
  Future<Issue> createIssue({required CreateIssueRequest request}) =>
      _service.createIssue(request: request);

  @override
  Future<Issue> updateIssue({
    required int id,
    required UpdateIssueRequest request,
  }) => _service.updateIssue(id: id, request: request);

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
