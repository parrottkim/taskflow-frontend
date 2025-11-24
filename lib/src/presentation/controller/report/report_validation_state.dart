part of '../controller.dart';

@freezed
abstract class ReportValidationState with _$ReportValidationState {
  factory ReportValidationState({
    @Default({}) Map<int, bool> stepValidations,
    @Default(false) bool fuelInvalid,
    @Default(false) bool contentInvalid,
  }) = _ReportValidationState;
}
