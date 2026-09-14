part of '../../data.dart';

abstract class KickoffIssueRepository {
  Future<HttpResponse<KickoffIssue?>> getKickoffIssue({required int id});

  Future<Issue> createKickoffIssue({
    required CreateKickoffIssueRequest request,
  });

  Future<Issue> updateKickoffIssue({
    required int id,
    required UpdateKickoffIssueRequest request,
  });
}
