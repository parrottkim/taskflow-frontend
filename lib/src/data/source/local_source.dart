part of '../data.dart';

class LocalDataSource implements LocalRepository {
  final SharedPreferencesAsync _prefs;

  LocalDataSource({required this._prefs});

  @override
  Future<bool> getPersistLogin() async =>
      await _prefs.getBool('auth.persist-login') ?? false;

  @override
  Future<void> setPersistLogin({required bool flag}) =>
      _prefs.setBool('auth.persist-login', flag);

  @override
  Future<List<Keyword>> getKeywords() async {
    final value = await _prefs.getString('search.keywords');

    if (value == null) return [];

    return (json.decode(value) as List<dynamic>)
        .map((json) => Keyword.fromJson(json))
        .toList();
  }

  @override
  Future<void> setKeyword({required List<Keyword> keywords}) =>
      _prefs.setString('search.keywords', json.encode(keywords));

  @override
  Future<void> removeKeywords() => _prefs.remove('search.keywords');
}

@riverpod
LocalRepository localRepository(Ref ref) {
  final prefs = ref.watch(sharedPreferencesAsyncProvider);

  return LocalDataSource(prefs: prefs);
}
