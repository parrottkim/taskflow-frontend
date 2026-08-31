part of '../controller.dart';

@freezed
abstract class WorkIssueFilterState with _$WorkIssueFilterState {
  factory WorkIssueFilterState({
    WorkIssueSortOption? sort,
    SortDirection? order,
    String? search,
    List<int>? clients,
    List<int>? categories,
  }) = _WorkIssueFilterState;
}
