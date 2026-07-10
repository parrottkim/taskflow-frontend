part of '../controller.dart';

@freezed
abstract class OrganizationState with _$OrganizationState {
  factory OrganizationState({
    @Default([]) List<UserDepartmentGroup> departmentGroups,
    @Default([]) List<UserDepartment> departmentItems,
    @Default([]) List<User> users,
  }) = _OrganizationState;
}
