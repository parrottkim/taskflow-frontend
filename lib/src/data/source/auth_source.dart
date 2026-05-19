part of '../data.dart';

class AuthDataSource implements AuthRepository {
  final AuthService _service;

  AuthDataSource({required AuthService service}) : _service = service;

  @override
  Future<Token> login({required LoginDto login}) =>
      _service.login(login: login);

  @override
  Future<User> register({required RegisterDto request}) =>
      _service.register(request: request);

  @override
  Future<Token> refresh() => _service.refresh();

  @override
  Future<void> forgotPassword({required ForgotPasswordDto request}) =>
      _service.forgotPassword(request: request);

  @override
  Future<void> resetPassword({required ResetPasswordDto request}) =>
      _service.resetPassword(request: request);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return AuthDataSource(service: AuthService(dio));
}
