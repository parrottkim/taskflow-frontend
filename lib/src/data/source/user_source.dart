part of '../data.dart';

class UserDataSource implements UserRepository {
  final UserService _service;

  UserDataSource({required UserService service}) : _service = service;

  @override
  Future<List<UserDepartment>> getAllDepartments() =>
      _service.getAllDepartments();

  @override
  Future<List<UserPosition>> getAllPositions() => _service.getAllPositions();

  @override
  Future<List<User>> getAllUsers() => _service.getAllUsers();

  @override
  Future<User> getUser({required int id}) => _service.getUser(id: id);

  @override
  Future<Result<User>> getUsers({
    int page = 1,
    int limit = 20,
    int? departmentId,
    int? positionId,
    String? search,
  }) => _service.getUsers(
    page: page,
    limit: limit,
    departmentId: departmentId,
    positionId: positionId,
    search: search,
  );

  @override
  Future<User> updateUserPermission({
    required int id,
    required UpdateUserPermissionDto request,
  }) => _service.updateUserPermission(id: id, request: request);

  @override
  Future<User> updateUser({required int id, required UpdateUserDto request}) =>
      _service.updateUser(id: id, request: request);

  @override
  Future<void> deleteUser({required int id}) => _service.deleteUser(id: id);
}

@riverpod
UserRepository userRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return UserDataSource(service: UserService(dio));
}
