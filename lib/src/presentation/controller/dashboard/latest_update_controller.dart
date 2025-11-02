part of '../controller.dart';

@riverpod
class LatestUpdateController extends _$LatestUpdateController {
  @override
  FutureOr<LatestUpdateState> build() {
    return init();
  }

  Future<LatestUpdateState> init() async {
    final result = await ref.watch(issueRepositoryProvider).getLatestIssues();

    return LatestUpdateState(items: result.items);
  }
}
