part of '../data.dart';

abstract class UserRepository {
  Future<List<UserDepartmentGroup>> getAllDepartments();

  Future<List<UserPosition>> getAllPositions();

  Future<List<User>> getAllUsers();

  Future<User> getUser({required int id});

  Future<Result<User>> getUsers({
    int page = 1,
    int limit = 20,
    int? departmentId,
    int? positionId,
    String? search,
  });

  Future<User> updateUserPermission({
    required int id,
    required UpdateUserPermissionRequest request,
  });

  Future<User> updateUser({
    required int id,
    required UpdateUserRequest request,
  });

  Future<void> deleteUser({required int id});
}
