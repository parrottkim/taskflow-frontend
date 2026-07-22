part of '../controller.dart';

@freezed
abstract class WorkProjectListState with _$WorkProjectListState {
  factory WorkProjectListState({
    @Default([]) List<WorkProjectListItem> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _WorkProjectListState;
}
