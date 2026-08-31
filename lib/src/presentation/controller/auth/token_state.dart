part of '../controller.dart';

@freezed
abstract class TokenState with _$TokenState {
  factory TokenState({String? token}) = _TokenState;
}
