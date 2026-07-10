part of '../controller.dart';

@freezed
abstract class UserOptionsState with _$UserOptionsState {
  factory UserOptionsState({
    @Default([]) List<UserDepartmentGroup> departmentGroups,
    @Default([]) List<UserDepartment> departmentItems,
    @Default([]) List<UserPosition> positionItems,
  }) = _UserOptionsState;
}
