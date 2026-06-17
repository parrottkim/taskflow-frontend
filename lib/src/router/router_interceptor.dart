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
    final matchedLocation = state.matchedLocation;

    // 1. 스플래시 페이지에서 처리 (Switch 구문으로 변경)
    if (matchedLocation == Routes.splash) {
      switch (userState) {
        case AuthAuthenticated(user: _):
          // 로그인된 상태에서 리다이렉트 처리
          if (redirect != null &&
              redirect != Routes.splash &&
              !redirect.startsWith(Routes.login)) {
            return redirect;
          }
          // 홈으로 이동
          return state.namedLocation(RouteNames.dashboard);

        case AuthUnauthenticated():
        case AuthFailed():
        case AuthForbidden():
        case AuthConflict():
        case AuthNetworkError():
          // 로그인되지 않았거나 실패/거부/충돌 상태
          if (redirect != null) {
            if (redirect.startsWith(Routes.login)) {
              return redirect; // 인증 관련 경로면 이동 허용
            } else {
              // 그 외 경로는 로그인 페이지로 리다이렉트
              return state.namedLocation(
                RouteNames.login,
                queryParameters: {'redirect_to': redirect},
              );
            }
          }
          // 로그인 페이지로 이동
          return state.namedLocation(RouteNames.login);

        case AuthInitial():
        case AuthRequest():
        case AuthPending():
          // 상태 확인 중이거나 요청/대기 중. 스플래시 화면에 머무름 (리다이렉트 없음)
          return null;
      }
    }

    // 2. 스플래시 페이지 이외의 경우 (기존 로직 유지)
    if (matchedLocation != Routes.splash) {
      switch (userState) {
        case AuthInitial():
          // 인증 상태 초기화 상태일 때만 스플래시로 이동
          return state.namedLocation(
            RouteNames.splash,
            queryParameters: {'redirect_to': redirect ?? uri.toString()},
          );

        case AuthRequest():
        case AuthPending():
          // 현재 페이지에서 로딩 상태 유지 (리다이렉트 없음)
          return null;

        case AuthUnauthenticated():
        case AuthFailed():
        case AuthForbidden():
        case AuthConflict():
        case AuthNetworkError():
          // 현재 접근하려는 경로가 인증 관련 경로일 경우 (login, register, forgotPassword 등)
          if (matchedLocation.startsWith(Routes.login)) {
            return null;
          }

          // 그 외 인증이 필요한 경로로의 접근 시도 시, 로그인 페이지로 리다이렉트
          return state.namedLocation(
            RouteNames.login,
            queryParameters: {'redirect_to': state.uri.toString()},
          );

        case AuthAuthenticated(user: _):
          // 로그인된 상태에서 인증 관련 페이지로 접근 시
          if (matchedLocation.startsWith(Routes.login)) {
            // redirect_to 파라미터가 있고, 인증 관련 경로가 아니면 해당 경로로 이동
            if (redirect != null && !redirect.startsWith(Routes.login)) {
              return redirect;
            }
            // 없으면 대시보드 페이지로 이동
            return state.namedLocation(RouteNames.dashboard);
          }

          // 그 외, 일반적인 로그인된 상태에서의 리다이렉트 처리
          // 리다이렉트 경로가 있고, 그 경로가 인증 관련 경로가 아니면 리다이렉트
          if (redirect != null && !matchedLocation.startsWith(Routes.login)) {
            return redirect;
          }
          break; // 현재 경로는 접근 허용 (로그인된 상태에서 인증 관련 페이지가 아님)
      }
    }

    // 리다이렉트 없음
    return null;
  }
}
