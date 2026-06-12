part of '../controller.dart';

@freezed
abstract class AccountFilterState with _$AccountFilterState {
  factory AccountFilterState({String? view}) = _AccountFilterState;
}
