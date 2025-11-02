part of '../controller.dart';

@freezed
abstract class ProjectStatsState with _$ProjectStatsState {
  factory ProjectStatsState({
    @Default([]) List<ProjectStats> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _ProjectStatsState;
}
