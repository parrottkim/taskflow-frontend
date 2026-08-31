part of '../controller.dart';

@freezed
abstract class IssueValidationState with _$IssueValidationState {
  factory IssueValidationState({
    @Default(false) bool contentInvalid,
    @Default(false) bool contractItemsMissing,
    @Default(false) bool contractItemInvalid,
    @Default(false) bool transactionItemsMissing,
    @Default(false) bool transactionItemInvalid,
    @Default(false) bool ratioInvalid,
    @Default(false) bool kickoffDateMissing,
    @Default(false) bool procurementItemsMissing,
    @Default(false) bool procurementItemInvalid,
  }) = _IssueValidationState;
}
