part of '../controller.dart';

@riverpod
Future<UserFormState> userForm(Ref ref, {required int userId}) async {
  final result = await ref.read(userRepositoryProvider).getUser(id: userId);

  return UserFormState(
    isAdmin: result.isAdmin,
    isAuthorized: result.isAuthorized,
    positionId: result.position?.id,
    departmentId: result.department?.id,
  );
}
