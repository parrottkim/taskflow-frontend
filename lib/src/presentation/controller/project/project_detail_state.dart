part of '../controller.dart';

@freezed
abstract class ProjectDetailState with _$ProjectDetailState {
  factory ProjectDetailState({
    required Project item,
  }) = _ProjectDetailState;
}
