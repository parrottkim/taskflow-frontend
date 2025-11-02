part of '../data.dart';

@freezed
abstract class Bookmark with _$Bookmark {
  factory Bookmark({
    required int userId,
    required int projectId,
    required DateTime createdAt,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);
}
