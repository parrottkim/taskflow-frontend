part of '../controller.dart';

@riverpod
class OrganizationController extends _$OrganizationController {
  @override
  FutureOr<OrganizationState> build() async {
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
}
