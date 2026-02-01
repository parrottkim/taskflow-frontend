part of '../controller.dart';

@riverpod
class LocalController extends _$LocalController {
  @override
  FutureOr<LocalState> build() async {
    return init();
  }

  Future<LocalState> init() async {
    final persistLogin = await ref
        .watch(localRepositoryProvider)
        .getPersistLogin();
    final keywords = await ref.watch(localRepositoryProvider).getKeywords();
    return LocalState(persistLogin: persistLogin, keywords: keywords);
  }

  Future<void> getPersistLogin() =>
      ref.watch(localRepositoryProvider).getPersistLogin();

  Future<void> setPersistLogin({required bool flag}) async {
    final value = state.value;

    if (value != null) {
      state = await AsyncValue.guard(() async {
        await ref.watch(localRepositoryProvider).setPersistLogin(flag: flag);
        return value.copyWith(persistLogin: flag);
      });
    }
  }

  Future<void> addKeywords({required String text}) async {
    final value = state.value;

    if (value != null) {
      state = await AsyncValue.guard(() async {
        final keyword = Keyword(keyword: text, date: DateTime.now());
        final List<Keyword> list =
            value.keywords.isNotEmpty && value.keywords.first.keyword == text
            ? value.keywords
            : [keyword, ...value.keywords];
        if (list.length > 5) {
          list.removeLast();
        }
        await ref.watch(localRepositoryProvider).setKeyword(keywords: list);
        return value.copyWith(keywords: list);
      });
    }
  }

  Future<void> removeKeywords() async {
    final value = state.value;

    if (value != null) {
      state = await AsyncValue.guard(() async {
        await ref.watch(localRepositoryProvider).removeKeywords();
        return value.copyWith(keywords: []);
      });
    }
  }
}
