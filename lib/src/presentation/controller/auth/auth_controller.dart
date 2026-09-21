part of '../controller.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthInitial();
  }

  bool _isUnauthorizedRefresh(DioException error) {
    final requestPath = error.requestOptions.path.split('?').first;

    return error.response?.statusCode == 401 &&
        requestPath.endsWith('auth/refresh');
  }

  Future<void> init() async {
    try {
      final token = await ref.read(authRepositoryProvider).refresh();
      ref.read(tokenControllerProvider.notifier).set(token.accessToken);

      final decoded = decodeJwt(token.accessToken);
      final user = await ref
          .read(userRepositoryProvider)
          .getUser(id: decoded['sub']);

      state = AuthAuthenticated(user: user);
    } on DioException catch (error) {
      if (_isUnauthorizedRefresh(error)) {
        expireSession();
      }
    }
  }

  void authenticate({required User user, required String accessToken}) {
    ref.read(tokenControllerProvider.notifier).set(accessToken);
    state = AuthAuthenticated(user: user);
  }

  Future<bool> register({required RegisterRequest request}) async {
    try {
      await ref.read(authRepositoryProvider).register(request: request);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await ref.read(authRepositoryProvider).logout();
    } finally {
      expireSession();
    }
  }

  void expireSession() {
    ref.read(tokenControllerProvider.notifier).clear();
    state = const AuthUnauthenticated();
  }

  Future<void> forgotPassword({required ForgotPasswordRequest request}) async {
    await ref.read(authRepositoryProvider).forgotPassword(request: request);
  }

  Future<void> resetPassword({required ResetPasswordRequest request}) async {
    await ref.read(authRepositoryProvider).resetPassword(request: request);
  }
}
