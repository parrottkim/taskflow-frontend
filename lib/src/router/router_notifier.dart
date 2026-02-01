part of 'router.dart';

@riverpod
class RouterListenableNotifier extends _$RouterListenableNotifier
    implements Listenable {
  VoidCallback? _routerListener;

  @override
  FutureOr<void> build() async {
    // 인증 상태가 변경될 때마다 GoRouter에 알림을 보냄
    ref.listen(authControllerProvider, (previous, next) {
      _routerListener?.call(); // GoRouter에게 변경 알림
    });
  }

  // GoRouter가 리스너를 등록할 때 호출됨
  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  // GoRouter가 리스너를 해제할 때 호출됨
  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
