part of '../controller.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.idle() = LoginIdle;
  const factory LoginState.pending() = LoginPending;
  const factory LoginState.forbidden() = LoginForbidden;
  const factory LoginState.failed() = LoginFailed;
  const factory LoginState.networkError() = LoginNetworkError;
}
