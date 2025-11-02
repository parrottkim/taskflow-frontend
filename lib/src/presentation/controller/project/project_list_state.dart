part of '../controller.dart';

@freezed
abstract class ProjectListState with _$ProjectListState {
  factory ProjectListState({
    @Default([]) List<Project> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _ProjectListState;
}
