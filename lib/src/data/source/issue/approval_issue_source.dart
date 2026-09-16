part of '../../data.dart';

class ApprovalIssueDataSource implements ApprovalIssueRepository {
  final ApprovalIssueService _service;

  ApprovalIssueDataSource({required this._service});

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
  Future<Issue> createApprovalIssue({
    required CreateApprovalIssueRequest request,
  }) => _service.createApprovalIssue(request: request);

  @override
  Future<Issue> updateApprovalIssue({
    required int id,
    required UpdateApprovalIssueRequest request,
  }) => _service.updateApprovalIssue(id: id, request: request);
}

@riverpod
ApprovalIssueRepository approvalIssueRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return ApprovalIssueDataSource(service: ApprovalIssueService(dio));
}
