part of '../controller.dart';

@freezed
abstract class WorkReportFilterState with _$WorkReportFilterState {
  factory WorkReportFilterState({
    WorkReportSort? sort,
    Order? order,
    String? search,
    List<int>? clients,
    List<int>? categories,
    DateTime? start,
    DateTime? end,
  }) = _WorkReportFilterState;
}
