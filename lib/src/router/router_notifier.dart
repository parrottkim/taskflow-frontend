part of 'router.dart';

@riverpod
class RouterNotifier extends _$RouterNotifier with ChangeNotifier {
  AuthState userState = const AuthInitial();

  @override
  Future<void> build() async {
    ref.listen<AuthState>(
      authControllerProvider,
      (previous, next) {
        userState = next;
        if (!state.isLoading) {
          notifyListeners();
        }
      },
      fireImmediately: true,
    );
  }
}
