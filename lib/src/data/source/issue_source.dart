part of '../data.dart';

class IssueDataSource implements IssueRepository {
  final IssueService _service;

  IssueDataSource({required IssueService service}) : _service = service;

  @override
  Future<List<IssueCategory>> getAllCategories() => _service.getAllCategories();

  @override
  Future<List<TransactionItemCategory>> getAllTransactionCategories() =>
      _service.getAllTransactionCategories();

  @override
  Future<Result<LatestIssue>> getLatestIssues({
    int page = 1,
    int limit = 20,
  }) =>
      _service.getLatestIssues(page: page, limit: limit);

  @override
  Future<Issue> getIssue({required int id}) => _service.getIssue(id: id);

  @override
  Future<Result<Issue>> getIssues(
          {int page = 1, int limit = 10, required int projectId}) =>
      _service.getIssues(page: page, limit: limit, projectId: projectId);

  @override
  Future<Issue> createIssue({
    required CreateIssueRequest request,
  }) =>
      _service.createIssue(request: request);

  @override
  Future<Issue> updateIssue({
    required int id,
    required UpdateIssueRequest request,
  }) =>
      _service.updateIssue(
        id: id,
        request: request,
      );

  @override
  Future<void> deleteIssue({required int id}) => _service.deleteIssue(id: id);

  @override
  Future<Issue> restoreIssue({required int id}) =>
      _service.restoreIssue(id: id);

  @override
  Future<List<IssueAttachment>> uploadAttachments(
          {required int issueId, required List<MultipartFile> files}) =>
      _service.uploadAttachments(issueId: issueId, files: files);

  @override
  Future<void> deleteAttachment({required int issueId, required int fileId}) =>
      _service.deleteAttachment(issueId: issueId, fileId: fileId);
}

@riverpod
IssueRepository issueRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return IssueDataSource(service: IssueService(dio));
}
