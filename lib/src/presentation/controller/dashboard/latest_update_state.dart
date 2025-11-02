part of '../controller.dart';

@freezed
abstract class LatestUpdateState with _$LatestUpdateState {
  factory LatestUpdateState({
    @Default('updatedAt') String? orderBy,
    @Default('DESC') String? orderDirection,
    @Default([]) List<LatestIssue> items,
  }) = _LatestUpdateState;
}
