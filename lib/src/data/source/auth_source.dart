part of '../data.dart';

class AuthDataSource implements AuthRepository {
  final AuthService _service;

  AuthDataSource({required this._service});

  @override
  Future<Token> login({required LoginRequest login}) =>
      _service.login(login: login);

  @override
  Future<User> register({required RegisterRequest request}) =>
      _service.register(request: request);

  @override
  Future<Token> refresh() => _service.refresh();

  @override
  Future<void> logout() => _service.logout();

  @override
  Future<void> forgotPassword({required ForgotPasswordRequest request}) =>
      _service.forgotPassword(request: request);

  @override
  Future<void> resetPassword({required ResetPasswordRequest request}) =>
      _service.resetPassword(request: request);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return AuthDataSource(service: AuthService(dio));
}
