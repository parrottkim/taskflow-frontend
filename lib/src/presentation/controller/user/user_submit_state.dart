part of '../controller.dart';

@freezed
abstract class UserSubmitState with _$UserSubmitState {
  factory UserSubmitState.idle() = UserSubmitIdle;
  factory UserSubmitState.pending() = UserSubmitPending;
  factory UserSubmitState.success(User user) = UserSubmitSuccess;
  factory UserSubmitState.deleted() = UserSubmitDeleted;
  factory UserSubmitState.failure(String message) = UserSubmitFailure;
}
