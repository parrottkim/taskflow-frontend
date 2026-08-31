part of '../controller.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.unauthenticated({@Default('') String email}) =
      AuthUnauthenticated;
  const factory AuthState.authenticated({required User user}) =
      AuthAuthenticated;
}
