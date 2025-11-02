part of '../controller.dart';

@freezed
abstract class UserListState with _$UserListState {
  factory UserListState({
    @Default([]) List<User> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _UserListState;
}
