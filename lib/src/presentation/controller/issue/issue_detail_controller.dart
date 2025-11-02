part of '../controller.dart';

@riverpod
class IssueDetailController extends _$IssueDetailController {
  @override
  FutureOr<IssueDetailState> build({required int issueId}) async {
    return _init(issueId: issueId);
  }

  Future<IssueDetailState> _init({required int issueId}) async {
    final result =
        await ref.read(issueRepositoryProvider).getIssue(id: issueId);

    return IssueDetailState(issue: result);
  }
}
