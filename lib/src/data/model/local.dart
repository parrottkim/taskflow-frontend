part of '../data.dart';

@freezed
abstract class Keyword with _$Keyword {
  const factory Keyword({required String keyword, required DateTime date}) =
      _Keyword;

  factory Keyword.fromJson(Map<String, dynamic> json) =>
      _$KeywordFromJson(json);
}
