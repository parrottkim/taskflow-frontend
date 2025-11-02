part of '../data.dart';

abstract class LocalRepository {
  Future<String?> getAccessToken();

  Future<void> setAccessToken({required String accessToken});

  Future<void> removeAccessToken();

  Future<String?> getRefreshToken();

  Future<void> setRefreshToken({required String refreshToken});

  Future<void> removeRefreshToken();

  Future<bool> getPersistLogin();

  Future<void> setPersistLogin({required bool flag});

  Future<List<Keyword>> getKeywords();

  Future<void> setKeyword({required List<Keyword> keywords});

  Future<void> removeKeywords();
}
