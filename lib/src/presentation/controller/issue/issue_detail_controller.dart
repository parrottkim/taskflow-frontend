part of '../controller.dart';

@riverpod
class IssueDetailController extends _$IssueDetailController {
  @override
  FutureOr<IssueDetailState> build({required int issueId}) async {
    return _init();
  }

  Future<IssueDetailState> _init() async {
    if (issueId == 0) return IssueDetailState(issue: Issue.dummy());

    final result =
        await ref.read(issueRepositoryProvider).getIssue(id: issueId);

    return IssueDetailState(issue: result);
  }
}
