part of '../data.dart';

abstract class LocalRepository {
  Future<bool> getPersistLogin();

  Future<void> setPersistLogin({required bool flag});

  Future<List<Keyword>> getKeywords();

  Future<void> setKeyword({required List<Keyword> keywords});

  Future<void> removeKeywords();
}
