part of '../controller.dart';

@riverpod
class UserOptionsController extends _$UserOptionsController {
  @override
  FutureOr<UserOptionsState> build() async {
    final departmentGroups = await ref
        .read(userRepositoryProvider)
        .getAllDepartments();
    final positions = await ref.read(userRepositoryProvider).getAllPositions();

    return UserOptionsState(
      departmentGroups: departmentGroups,
      departmentItems: departmentGroups.expand((group) => group.items).toList(),
      positionItems: positions,
    );
  }
}
