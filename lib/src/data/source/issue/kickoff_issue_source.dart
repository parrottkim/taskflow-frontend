part of '../../data.dart';

class KickoffIssueDataSource implements KickoffIssueRepository {
  final KickoffIssueService _service;

  KickoffIssueDataSource({required this._service});

  @override
  Future<HttpResponse<KickoffIssue?>> getKickoffIssue({required int id}) =>
      _service.getKickoffIssue(id: id);

  @override
  Future<Issue> createKickoffIssue({
    required CreateKickoffIssueRequest request,
  }) => _service.createKickoffIssue(request: request);

  @override
  Future<Issue> updateKickoffIssue({
    required int id,
    required UpdateKickoffIssueRequest request,
  }) => _service.updateKickoffIssue(id: id, request: request);
}

@riverpod
KickoffIssueRepository kickoffIssueRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return KickoffIssueDataSource(service: KickoffIssueService(dio));
}
