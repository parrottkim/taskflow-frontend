part of '../controller.dart';

@freezed
abstract class UserFilterState with _$UserFilterState {
  factory UserFilterState({
    @Default('') String search,
    List<int>? departments,
    int? positionId,
  }) = _UserFilterState;
}
