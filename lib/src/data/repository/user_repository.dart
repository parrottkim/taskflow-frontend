part of '../data.dart';

abstract class UserRepository {
  Future<List<UserDepartment>> getAllDepartments();

  Future<List<UserPosition>> getAllPositions();

  Future<User> getUser({required int id});

  Future<Result<User>> getUsers({
    int page = 1,
    int limit = 20,
    int? departmentId,
    int? positionId,
    String? search,
  });
}
