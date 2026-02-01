part of '../controller.dart';

@freezed
abstract class ProjectDetailState with _$ProjectDetailState {
  factory ProjectDetailState({
    required Project project,
    @Default(0) contracts,
    @Default(0) approvals,
    @Default(0) procurements,
    @Default(0) reports,
  }) = _ProjectDetailState;
}
