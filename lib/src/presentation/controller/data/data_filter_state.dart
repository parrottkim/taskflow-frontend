part of '../controller.dart';

@freezed
abstract class DataFilterState with _$DataFilterState {
  factory DataFilterState({String? view}) = _DataFilterState;
}
