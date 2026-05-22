part of '../controller.dart';

@riverpod
class UserFormController extends _$UserFormController {
  @override
  FutureOr<UserFormState> build({required int userId}) => _init();

  Future<UserFormState> _init() async {
    final result = await ref.read(userRepositoryProvider).getUser(id: userId);

    return UserFormState(
      isAdmin: result.isAdmin,
      isAuthorized: result.isAuthorized,
      positionId: result.position?.id,
      departmentId: result.department?.id,
    );
  }
}
