part of '../controller.dart';

@freezed
abstract class ScheduleOptionsState with _$ScheduleOptionsState {
  factory ScheduleOptionsState({
    @Default([]) List<ScheduleCategory> categoryItems,
    @Default([]) List<UserDepartmentGroup> departmentGroups,
    @Default([]) List<UserDepartment> departmentItems,
  }) = _ScheduleOptionsState;
}
