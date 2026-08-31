part of '../controller.dart';

@freezed
abstract class WorkProjectFilterState with _$WorkProjectFilterState {
  factory WorkProjectFilterState({
    @Default(ProjectStatusFilter.all) ProjectStatusFilter status,
    WorkProjectSortOption? sort,
    SortDirection? order,
    String? search,
    List<int>? clients,
    List<int>? categories,
  }) = _WorkProjectFilterState;
}
