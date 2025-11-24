part of '../controller.dart';

@freezed
abstract class ReportListState with _$ReportListState {
  factory ReportListState({
    @Default([]) List<Report> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _ReportListState;
}
