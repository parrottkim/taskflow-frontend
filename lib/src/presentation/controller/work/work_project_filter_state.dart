part of '../controller.dart';

@freezed
abstract class WorkProjectFilterState with _$WorkProjectFilterState {
  factory WorkProjectFilterState({
    @Default(ProjectSegment.all) ProjectSegment status,
    WorkProjectSort? sort,
    Order? order,
    String? search,
    List<int>? clients,
    List<int>? categories,
  }) = _WorkProjectFilterState;
}
