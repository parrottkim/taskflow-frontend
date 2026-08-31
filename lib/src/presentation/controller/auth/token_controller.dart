part of '../controller.dart';

@riverpod
class TokenController extends _$TokenController {
  @override
  TokenState build() {
    ref.keepAlive();
    return TokenState();
  }

  void set(String token) => state = state.copyWith(token: token);
  void clear() => state = state.copyWith(token: null);
}
