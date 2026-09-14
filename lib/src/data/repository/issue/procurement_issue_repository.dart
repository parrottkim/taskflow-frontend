part of '../../data.dart';

abstract class ProcurementIssueRepository {
  Future<Result<ProcurementIssue>> getProcurementIssues({
    int page = 1,
    int limit = 10,
    required int projectId,
  });

  Future<HttpResponse<List<int>>> exportPurchaseRequest({required int id});
  Future<HttpResponse<List<int>>> exportPurchaseOrder({required int id});
  Future<Issue> getIssueForProcurementRequest({required int id});

  Future<Issue> createProcurementIssueRequest({
    required int id,
    required UpsertProcurementRequest request,
  });

  Future<Issue> updateProcurementIssueRequest({
    required int id,
    required UpsertProcurementRequest request,
  });

  Future<void> approveProcurementIssueRequest({required int id});
  Future<void> deleteProcurementIssueRequest({required int id});

  Future<Issue> createProcurementIssue({
    required CreateProcurementIssueRequest request,
  });

  Future<Issue> updateProcurementIssue({
    required int id,
    required UpdateProcurementIssueRequest request,
  });
}
