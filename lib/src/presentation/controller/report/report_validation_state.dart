part of '../controller.dart';

@freezed
abstract class ReportValidationState with _$ReportValidationState {
  factory ReportValidationState({
    @Default({}) Map<int, bool> stepValidations,
    @Default({}) Map<int, bool> regulationRateValidations,
    @Default(false) bool fuelInvalid,
    @Default(false) bool holidaysInvalid,
    @Default(false) bool contentInvalid,
    @Default(false) bool optionsInvalid,
  }) = _ReportValidationState;
}
