part of '../controller.dart';

@riverpod
class LocalController extends _$LocalController {
  static const _maxKeywordCount = 5;

  @override
  FutureOr<LocalState> build() async {
    return init();
  }

  Future<LocalState> init() async {
    final persistLogin = await ref
        .watch(localRepositoryProvider)
        .getPersistLogin();
    final keywords = await ref.watch(localRepositoryProvider).getKeywords();
    return LocalState(
      persistLogin: persistLogin,
      keywords: keywords.take(_maxKeywordCount).toList(),
    );
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
    final nextText = text.trim();

    if (value != null && nextText.isNotEmpty) {
      state = await AsyncValue.guard(() async {
        final keyword = Keyword(keyword: nextText, date: DateTime.now());
        final list = [
          keyword,
          ...value.keywords.where((item) => item.keyword != nextText),
        ].take(_maxKeywordCount).toList();

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
