part of '../controller.dart';

@riverpod
class UserSubmitController extends _$UserSubmitController {
  @override
  UserSubmitState build() => UserSubmitState.idle();

  Future<void> toggleAdmin({required int userId, required bool flag}) async {
    final value = ref.read(userFormControllerProvider(userId: userId)).value;

    if (value == null) return;

    final request = UpdateUserDto(isAdmin: flag);

    await ref
        .read(userRepositoryProvider)
        .updateUser(id: userId, request: request);
  }

  Future<void> toggleAuthorized({
    required int userId,
    required bool flag,
  }) async {
    final value = ref.read(userFormControllerProvider(userId: userId)).value;

    if (value == null) return;

    final request = UpdateUserDto(isAuthorized: flag);

    await ref
        .read(userRepositoryProvider)
        .updateUser(id: userId, request: request);
  }

  Future<void> updateUser({required int userId}) async {
    final value = ref.read(userFormControllerProvider(userId: userId)).value;

    if (value == null) return;

    state = UserSubmitState.pending();

    final request = UpdateUserDto(
      isAdmin: value.isAdmin,
      isAuthorized: value.isAuthorized,
      positionId: value.positionId,
      departmentId: value.departmentId,
    );

    try {
      final user = await ref
          .read(userRepositoryProvider)
          .updateUser(id: userId, request: request);

      ref.read(userListControllerProvider.notifier).updateListItem(item: user);

      state = UserSubmitState.success(user);
    } catch (e) {
      state = UserSubmitState.failure(e.toString());
    }
  }
}
