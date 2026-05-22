part of '../controller.dart';

@freezed
abstract class UserFormState with _$UserFormState {
  factory UserFormState({
    @Default(false) bool isAdmin,
    @Default(false) bool isAuthorized,
    int? positionId,
    int? departmentId,
  }) = _UserFormState;
}
