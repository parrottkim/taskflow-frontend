part of '../../data.dart';

class IssueDataSource implements IssueRepository {
  final IssueService _service;

  IssueDataSource({required this._service});

  @override
  Future<List<IssueCategory>> getAllCategories() => _service.getAllCategories();

  @override
  Future<Result<LatestIssue>> getLatestIssues({int page = 1, int limit = 20}) =>
      _service.getLatestIssues(page: page, limit: limit);

  @override
  Future<IssueCategory> getCategory({required int id}) =>
      _service.getCategory(id: id);

  @override
  Future<void> sendMail({required int id, required SendMailRequest request}) =>
      _service.sendMail(id: id, request: request);

  @override
  Future<Issue> getIssueForEdit({required int id}) =>
      _service.getIssueForEdit(id: id);

  @override
  Future<Issue> getIssue({required int id}) => _service.getIssue(id: id);

  @override
  Future<Issue> deleteIssue({required int id}) => _service.deleteIssue(id: id);

  @override
  Future<Issue> restoreIssue({required int id}) =>
      _service.restoreIssue(id: id);
}

@riverpod
IssueRepository issueRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return IssueDataSource(service: IssueService(dio));
}
