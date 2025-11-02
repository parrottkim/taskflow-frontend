part of '../controller.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.unauthenticated({
    @Default('') String email,
  }) = AuthUnauthenticated;
  const factory AuthState.authenticated({
    required User user,
  }) = AuthAuthenticated;
  const factory AuthState.request() = AuthRequest;
  const factory AuthState.pending() = AuthPending;
  const factory AuthState.forbidden() = AuthForbidden; // 로그인 관리자 미인증
  const factory AuthState.conflict() = AuthConflict; // 회원가입 이메일 중복
  const factory AuthState.failed() = AuthFailed; // 로그인 실패
}
