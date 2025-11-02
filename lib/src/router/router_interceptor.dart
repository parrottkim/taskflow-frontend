part of 'router.dart';

/// 라우터 인터셉터 인터페이스
abstract class RouterInterceptorInterface {
  FutureOr<String?> canGo(BuildContext context, GoRouterState routerState);
}

/// 라우터 인터셉터를 생성하는 함수
@riverpod
RouterInterceptor routerInterceptor(Ref ref) {
  return RouterInterceptor(ref);
}

/// 라우터 인터셉터 구현 클래스
class RouterInterceptor implements RouterInterceptorInterface {
  final Ref ref;

  RouterInterceptor(this.ref);

  @override
  FutureOr<String?> canGo(BuildContext context, GoRouterState state) async {
    final userState = ref.read(authControllerProvider);
    final uri = state.uri;
    final redirect = uri.queryParameters['redirect_to'];

    // 스플래시 페이지에서 처리
    if (state.matchedLocation == Routes.splash) {
      if (userState is AuthAuthenticated) {
        // 로그인된 상태에서 리다이렉트 처리
        if (redirect != null &&
            redirect != Routes.splash &&
            !redirect.startsWith(Routes.login)) {
          return redirect;
        }
        // 홈으로 이동
        return state.namedLocation(RouteNames.dashboard);
      } else if (userState is AuthUnauthenticated ||
          userState is AuthFailed ||
          userState is AuthForbidden ||
          userState is AuthConflict) {
        // 로그인되지 않은 상태에서 리다이렉트 처리
        if (redirect != null) {
          if (redirect.startsWith(Routes.login)) {
            return redirect;
          } else {
            return state.namedLocation(
              RouteNames.login,
              queryParameters: {'redirect_to': redirect},
            );
          }
        }
        // 로그인 페이지로 이동
        return state.namedLocation(RouteNames.login);
      }
    }

    // 스플래시 페이지 이외의 경우
    if (state.matchedLocation != Routes.splash) {
      switch (userState) {
        case AuthInitial():
          return state.namedLocation(RouteNames.splash,
              queryParameters: {'redirect_to': redirect ?? uri.toString()});
        case AuthUnauthenticated():
          // 로그인되지 않은 상태에서 리다이렉트 처리
          if (!state.matchedLocation.startsWith(Routes.login)) {
            return state.namedLocation(
              RouteNames.login,
              queryParameters: {'redirect_to': state.uri.toString()},
            );
          }
          break;
        case AuthAuthenticated():
          // 로그인된 상태에서 리다이렉트 처리
          if (state.matchedLocation.startsWith(Routes.login)) {
            // redirect_to 파라미터가 있으면 해당 경로로 이동
            if (redirect != null && !redirect.startsWith(Routes.login)) {
              return redirect;
            }
            // 없으면 대시보드 페이지로 이동
            return state.namedLocation(RouteNames.dashboard);
          }

          // 그 외, 일반적인 로그인된 상태에서의 리다이렉트 처리
          if (redirect != null && !redirect.startsWith(Routes.login)) {
            return redirect;
          }
      }
    }

    // 리다이렉트 없음
    return null;
  }
}
