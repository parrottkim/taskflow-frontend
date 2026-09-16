part of '../controller.dart';

@freezed
abstract class UserFilterState with _$UserFilterState {
  factory UserFilterState({
    String? search,
    List<int>? departments,
    int? rankId,
    int? positionId,
  }) = _UserFilterState;
}
