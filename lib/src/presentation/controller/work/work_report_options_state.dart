part of '../controller.dart';

@freezed
abstract class WorkReportOptionsState with _$WorkReportOptionsState {
  const factory WorkReportOptionsState({
    @Default([]) List<ClientGroup> clientItems,
    @Default([]) List<ScheduleCategory> categoryItems,
    @Default(0) int maxClientDepth,
  }) = _WorkReportOptionsState;
}
