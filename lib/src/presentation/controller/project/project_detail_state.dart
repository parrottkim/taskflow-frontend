part of '../controller.dart';

@freezed
abstract class ProjectDetailState with _$ProjectDetailState {
  factory ProjectDetailState({
    required Project project,
  }) = _ProjectDetailState;
}
