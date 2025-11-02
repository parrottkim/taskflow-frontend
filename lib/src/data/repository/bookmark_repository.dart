part of '../data.dart';

abstract class BookmarkRepository {
  Future<Bookmark> addBookmark({required int id});

  Future<Bookmark> deleteBookmark({required int id});
}
