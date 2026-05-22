part of '../controller.dart';

@freezed
abstract class OperationFilterState with _$OperationFilterState {
  factory OperationFilterState({String? view}) = _OperationFilterState;
}
