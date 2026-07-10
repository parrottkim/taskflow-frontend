part of '../controller.dart';

@freezed
abstract class ProjectFilterState with _$ProjectFilterState {
  const factory ProjectFilterState({
    String? view,
    ProjectSort? sort,
    Order? order,
    String? search,
    bool? bookmark,
    List<int>? clients,
    List<int>? categories,
  }) = _ProjectFilterState;
}
