part of '../../data.dart';

abstract class IssueRepository {
  Future<List<IssueCategory>> getAllCategories();
  Future<Result<LatestIssue>> getLatestIssues({int page = 1, int limit = 20});
  Future<IssueCategory> getCategory({required int id});
  Future<void> sendMail({required int id, required SendMailRequest request});
  Future<Issue> getIssueForEdit({required int id});
  Future<Issue> getIssue({required int id});
  Future<Issue> deleteIssue({required int id});
  Future<Issue> restoreIssue({required int id});
}
