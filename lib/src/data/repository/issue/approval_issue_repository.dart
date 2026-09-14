part of '../../data.dart';

abstract class ApprovalIssueRepository {
  Future<Result<ApprovalIssue>> getApprovalIssues({
    int page = 1,
    int limit = 10,
    required int projectId,
  });

  Future<Issue> createApprovalIssue({
    required CreateApprovalIssueRequest request,
  });

  Future<Issue> updateApprovalIssue({
    required int id,
    required UpdateApprovalIssueRequest request,
  });
}
