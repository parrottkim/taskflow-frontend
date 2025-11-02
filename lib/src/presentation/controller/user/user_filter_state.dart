part of '../controller.dart';

@freezed
abstract class UserFilterState with _$UserFilterState {
  factory UserFilterState({
    String? search,
    UserDepartment? department,
    UserPosition? position,
    @Default([]) List<UserDepartment> departmentItems,
    @Default([]) List<UserPosition> positionItems,
  }) = _UserFilterState;
}
