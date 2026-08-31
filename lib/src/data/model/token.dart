part of '../data.dart';

@freezed
abstract class Token with _$Token {
  factory Token({
    required String accessToken,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
