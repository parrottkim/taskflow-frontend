part of '../controller.dart';

@riverpod
Future<OrganizationState> organization(Ref ref) async {
  final departments = await ref
      .read(userRepositoryProvider)
      .getAllDepartments();
  final users = await ref.read(userRepositoryProvider).getAllUsers();

  return OrganizationState(
    departmentGroups: departments,
    departmentItems: departments.expand((group) => group.items).toList(),
    users: users,
  );
}
