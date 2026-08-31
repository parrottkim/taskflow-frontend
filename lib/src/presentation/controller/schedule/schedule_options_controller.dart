part of '../controller.dart';

@riverpod
Future<ScheduleOptionsState> scheduleOptions(Ref ref) async {
  final categories = await ref
      .read(scheduleRepositoryProvider)
      .getAllCategories();
  final departmentGroups = await ref
      .read(userRepositoryProvider)
      .getAllDepartments();

  return ScheduleOptionsState(
    categoryItems: categories,
    departmentGroups: departmentGroups,
    departmentItems: departmentGroups.expand((group) => group.items).toList(),
  );
}
