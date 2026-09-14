part of '../../data.dart';

class ProcurementIssueDataSource implements ProcurementIssueRepository {
  final ProcurementIssueService _service;

  ProcurementIssueDataSource({required this._service});

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
  Future<HttpResponse<List<int>>> exportPurchaseRequest({required int id}) =>
      _service.exportPurchaseRequest(id: id);

  @override
  Future<HttpResponse<List<int>>> exportPurchaseOrder({required int id}) =>
      _service.exportPurchaseOrder(id: id);

  @override
  Future<Issue> getIssueForProcurementRequest({required int id}) =>
      _service.getIssueForProcurementRequest(id: id);

  @override
  Future<Issue> createProcurementIssueRequest({
    required int id,
    required UpsertProcurementRequest request,
  }) => _service.createProcurementIssueRequest(id: id, request: request);

  @override
  Future<Issue> updateProcurementIssueRequest({
    required int id,
    required UpsertProcurementRequest request,
  }) => _service.updateProcurementIssueRequest(id: id, request: request);

  @override
  Future<void> approveProcurementIssueRequest({required int id}) =>
      _service.approveProcurementIssueRequest(id: id);

  @override
  Future<void> deleteProcurementIssueRequest({required int id}) =>
      _service.deleteProcurementIssueRequest(id: id);

  @override
  Future<Issue> createProcurementIssue({
    required CreateProcurementIssueRequest request,
  }) => _service.createProcurementIssue(request: request);

  @override
  Future<Issue> updateProcurementIssue({
    required int id,
    required UpdateProcurementIssueRequest request,
  }) => _service.updateProcurementIssue(id: id, request: request);
}

@riverpod
ProcurementIssueRepository procurementIssueRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return ProcurementIssueDataSource(service: ProcurementIssueService(dio));
}
