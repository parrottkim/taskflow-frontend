part of '../controller.dart';

@riverpod
class UserSubmitController extends _$UserSubmitController {
  @override
  UserSubmitState build() => UserSubmitState.idle();

  Future<void> toggleAdmin({required int userId, required bool flag}) async {
    state = UserSubmitState.pending();

    final request = UpdateUserPermissionRequest(isAdmin: flag);

    try {
      final user = await ref
          .read(userRepositoryProvider)
          .updateUserPermission(id: userId, request: request);

      ref
          .read(userListControllerProvider(UserFilterScope.dataPage).notifier)
          .updateListItem(item: user);

      state = UserSubmitState.updated(user);
    } catch (e) {
      state = UserSubmitState.failure(e.toString());
    }
  }

  Future<void> toggleAuthorized({
    required int userId,
    required bool flag,
  }) async {
    state = UserSubmitState.pending();

    final request = UpdateUserPermissionRequest(isAuthorized: flag);

    try {
      final user = await ref
          .read(userRepositoryProvider)
          .updateUserPermission(id: userId, request: request);

      ref
          .read(userListControllerProvider(UserFilterScope.dataPage).notifier)
          .updateListItem(item: user);

      state = UserSubmitState.updated(user);
    } catch (e) {
      state = UserSubmitState.failure(e.toString());
    }
  }

  Future<void> updateUser({
    required int userId,
    int? rankId,
    int? positionId,
    int? departmentId,
  }) async {
    state = UserSubmitState.pending();

    final request = UpdateUserPermissionRequest(
      rankId: rankId,
      positionId: positionId,
      departmentId: departmentId,
    );

    try {
      final user = await ref
          .read(userRepositoryProvider)
          .updateUserPermission(id: userId, request: request);

      ref
          .read(userListControllerProvider(UserFilterScope.dataPage).notifier)
          .updateListItem(item: user);

      state = UserSubmitState.updated(user);
    } catch (e) {
      state = UserSubmitState.failure(e.toString());
    }
  }

  Future<void> deleteUser({required int userId}) async {
    state = UserSubmitState.pending();

    try {
      await ref.read(userRepositoryProvider).deleteUser(id: userId);

      ref
          .read(userListControllerProvider(UserFilterScope.dataPage).notifier)
          .removeListItem(id: userId);

      state = UserSubmitState.deleted();
    } catch (e) {
      state = UserSubmitState.failure(e.toString());
    }
  }
}
