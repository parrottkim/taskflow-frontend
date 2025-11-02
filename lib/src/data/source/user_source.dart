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
  Future<User> getUser({required int id}) => _service.getUser(id: id);

  @override
  Future<Result<User>> getUsers({
    int page = 1,
    int limit = 20,
    int? departmentId,
    int? positionId,
    String? search,
  }) =>
      _service.getUsers(
        page: page,
        limit: limit,
        departmentId: departmentId,
        positionId: positionId,
        search: search,
      );
}

@riverpod
UserRepository userRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return UserDataSource(service: UserService(dio));
}
