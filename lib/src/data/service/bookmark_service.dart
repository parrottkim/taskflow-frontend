part of '../data.dart';

@RestApi()
abstract class BookmarkService {
  factory BookmarkService(Dio dio, {String baseUrl}) = _BookmarkService;

  @POST('bookmark/{id}')
  Future<Bookmark> addBookmark({@Path() required int id});

  @DELETE('bookmark/{id}')
  Future<Bookmark> deleteBookmark({@Path() required int id});
}
