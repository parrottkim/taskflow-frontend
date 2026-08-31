part of '../controller.dart';

@riverpod
Future<UserOptionsState> userOptions(Ref ref) async {
  final departmentGroups = await ref
      .read(userRepositoryProvider)
      .getAllDepartments();
  final ranks = await ref.read(userRepositoryProvider).getAllRanks();
  final positions = await ref.read(userRepositoryProvider).getAllPositions();

  return UserOptionsState(
    departmentGroups: departmentGroups,
    departmentItems: departmentGroups.expand((group) => group.items).toList(),
    rankItems: ranks,
    positionItems: positions,
  );
}
