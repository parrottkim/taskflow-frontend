part of '../controller.dart';

@freezed
abstract class IssueValidationState with _$IssueValidationState {
  factory IssueValidationState({
    @Default(false) bool contentInvalid,
    @Default(false) bool contractDateMissing,
    @Default(false) bool contractItemsMissing,
    @Default(false) bool contractItemInvalid,
    @Default(false) bool transactionItemsMissing,
    @Default(false) bool transactionItemInvalid,
    @Default(false) bool ratioInvalid,
    @Default(false) bool kickoffDateMissing,
    @Default(false) bool kickoffParticipantItemsMissing,
    @Default(false) bool kickoffParticipantItemInvalid,
    @Default(false) bool kickoffTripItemsMissing,
    @Default(false) bool kickoffTripItemInvalid,
    @Default(false) bool procurementItemsMissing,
    @Default(false) bool procurementItemInvalid,
  }) = _IssueValidationState;
}
