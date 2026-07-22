part of '../controller.dart';

@freezed
abstract class WorkReportListState with _$WorkReportListState {
  factory WorkReportListState({
    @Default([]) List<WorkReportListItem> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _WorkReportListState;
}
