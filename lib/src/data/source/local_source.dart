part of '../data.dart';

class LocalDataSource implements LocalRepository {
  final FlutterSecureStorage _secure;
  final SharedPreferencesAsync _prefs;

  LocalDataSource({
    required FlutterSecureStorage secure,
    required SharedPreferencesAsync prefs,
  }) : _secure = secure,
       _prefs = prefs;

  @override
  Future<String?> getAccessToken() => _secure.read(key: 'auth.access-token');

  @override
  Future<void> setAccessToken({required String accessToken}) {
    return _secure.write(key: 'auth.access-token', value: accessToken);
  }

  @override
  Future<void> removeAccessToken() => _secure.delete(key: 'auth.access-token');

  @override
  Future<String?> getRefreshToken() => _secure.read(key: 'auth.refresh-token');

  @override
  Future<void> setRefreshToken({required String refreshToken}) =>
      _secure.write(key: 'auth.refresh-token', value: refreshToken);

  @override
  Future<void> removeRefreshToken() =>
      _secure.delete(key: 'auth.refresh-token');

  @override
  Future<bool> getPersistLogin() async =>
      await _prefs.getBool('auth.persist-login') ?? false;

  @override
  Future<void> setPersistLogin({required bool flag}) =>
      _prefs.setBool('auth.persist-login', flag);

  @override
  Future<List<Keyword>> getKeywords() async {
    final keywordsString = await _prefs.getString('search.keywords');

    return keywordsString != null
        ? (json.decode(keywordsString) as List<dynamic>)
              .map((json) => Keyword.fromJson(json))
              .toList()
        : [];
  }

  @override
  Future<void> setKeyword({required List<Keyword> keywords}) =>
      _prefs.setString('search.keywords', json.encode(keywords));

  @override
  Future<void> removeKeywords() => _prefs.remove('search.keywords');
}

@riverpod
LocalRepository localRepository(Ref ref) {
  final secure = ref.watch(flutterSecureStorageProvider);
  final prefs = ref.watch(sharedPreferencesAsyncProvider);

  return LocalDataSource(secure: secure, prefs: prefs);
}
