part of '../controller.dart';

@freezed
abstract class LocalState with _$LocalState {
  factory LocalState({
    required bool persistLogin,
    @Default([]) List<Keyword> keywords,
  }) = _LocalState;
}
