part of '../data.dart';

class BookmarkDataSource implements BookmarkRepository {
  final BookmarkService _service;

  BookmarkDataSource({required BookmarkService service}) : _service = service;

  @override
  Future<Bookmark> addBookmark({required int id}) =>
      _service.addBookmark(id: id);

  @override
  Future<Bookmark> deleteBookmark({required int id}) =>
      _service.deleteBookmark(id: id);
}

@riverpod
BookmarkRepository bookmarkRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return BookmarkDataSource(service: BookmarkService(dio));
}
