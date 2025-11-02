part of '../controller.dart';

@freezed
abstract class ProjectDetailFilterState with _$ProjectDetailFilterState {
  factory ProjectDetailFilterState({
    String? view,
  }) = _ProjectDetailFilterState;
}
