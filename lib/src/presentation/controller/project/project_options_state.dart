part of '../controller.dart';

@freezed
abstract class ProjectOptionsState with _$ProjectOptionsState {
  const factory ProjectOptionsState({
    @Default([]) List<IssueCategory> categoryItems,
    @Default([]) List<ClientGroup> clientItems,
    @Default(0) int maxClientDepth,
  }) = _ProjectOptionsState;
}
