part of '../controller.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthInitial();
  }

  Future<void> init() async {
    try {
      final accessToken =
          await ref.read(localRepositoryProvider).getAccessToken();
      final persistLogin =
          await ref.read(localRepositoryProvider).getPersistLogin();

      if (accessToken != null && persistLogin) {
        final decodedToken = decodeJwt(accessToken);
        final user = await ref
            .read(userRepositoryProvider)
            .getUser(id: decodedToken['sub']);
        state = AuthAuthenticated(user: user);
      } else {
        state = const AuthUnauthenticated();
      }
    } on DioException {
      state = AuthUnauthenticated();
    }
  }

  Future<void> login({required LoginDto login}) async {
    state = const AuthPending();
    try {
      final token = await ref.watch(authRepositoryProvider).login(login: login);

      await ref
          .read(localRepositoryProvider)
          .setAccessToken(accessToken: token.accessToken);
      await ref
          .read(localRepositoryProvider)
          .setRefreshToken(refreshToken: token.refreshToken);
      final decodedToken = decodeJwt(token.accessToken);

      final user = await ref
          .read(userRepositoryProvider)
          .getUser(id: decodedToken['sub']);
      state = AuthAuthenticated(user: user);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        if (e.response?.statusCode == 403) {
          state = const AuthForbidden();
        } else if (e.response?.statusCode == 409) {
          state = const AuthConflict();
        } else {
          state = const AuthFailed();
        }
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        state = const AuthNetworkError();
      } else {
        state = const AuthFailed();
      }
    }
  }

  Future<void> register({required RegisterDto request}) async {
    state = const AuthPending();
    try {
      await ref
          .read(authRepositoryProvider)
          .register(request: request)
          .then((value) async {
        state = const AuthRequest();
      });
    } catch (e) {
      state = const AuthFailed();
    }
  }

  Future<void> logout() async {
    await ref.read(localRepositoryProvider).removeAccessToken();
    await ref.read(localRepositoryProvider).removeRefreshToken();
    state = const AuthUnauthenticated();
  }

  Future<void> forgotPassword({required ForgotPasswordDto request}) async {
    await ref.read(authRepositoryProvider).forgotPassword(request: request);
  }

  Future<void> resetPassword({required ResetPasswordDto request}) async {
    await ref.read(authRepositoryProvider).resetPassword(request: request);
  }
}
