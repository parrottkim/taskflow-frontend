part of '../controller.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginState build() => const LoginState.idle();

  Future<bool> login({required LoginRequest login}) async {
    state = const LoginState.pending();

    try {
      final token = await ref.read(authRepositoryProvider).login(login: login);
      ref.read(tokenControllerProvider.notifier).set(token.accessToken);

      final decodedToken = decodeJwt(token.accessToken);
      final user = await ref
          .read(userRepositoryProvider)
          .getUser(id: decodedToken['sub']);

      state = const LoginState.idle();
      ref
          .read(authControllerProvider.notifier)
          .authenticate(user: user, accessToken: token.accessToken);
      return true;
    } on DioException catch (e) {
      ref.read(tokenControllerProvider.notifier).clear();
      state = switch (e.type) {
        DioExceptionType.badResponse when e.response?.statusCode == 403 =>
          const LoginState.forbidden(),
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout ||
        DioExceptionType.connectionError => const LoginState.networkError(),
        _ => const LoginState.failed(),
      };
      return false;
    } catch (_) {
      ref.read(tokenControllerProvider.notifier).clear();
      state = const LoginState.failed();
      return false;
    }
  }
}
