part of '../data.dart';

class AuthDataSource implements AuthRepository {
  final AuthService _service;

  AuthDataSource({required AuthService service}) : _service = service;

  @override
  Future<Token> login({required LoginRequest login}) =>
      _service.login(login: login);

  @override
  Future<User> register({required RegisterRequest register}) =>
      _service.register(register: register);

  @override
  Future<Token> refresh() => _service.refresh();
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return AuthDataSource(service: AuthService(dio));
}
