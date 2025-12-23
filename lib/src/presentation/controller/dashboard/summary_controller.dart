part of '../controller.dart';

@riverpod
class SummaryController extends _$SummaryController {
  @override
  FutureOr<SummaryState> build({
    required DateTime start,
    required DateTime end,
  }) async {
    return init(start: start, end: end);
  }

  Future<SummaryState> init({
    required DateTime start,
    required DateTime end,
  }) async {
    final result = await ref
        .read(dashboardRepositoryProvider)
        .getProjectSummary(start: start, end: end);

    return SummaryState(summary: result);
  }
}
