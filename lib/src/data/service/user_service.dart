part of '../data.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET('user/department')
  Future<List<UserDepartment>> getAllDepartments();

  @GET('user/position')
  Future<List<UserPosition>> getAllPositions();

  @GET('user/all')
  Future<List<User>> getAllUsers();

  @GET('user/{id}')
  Future<User> getUser({@Path('id') required int id});

  @GET('user')
  Future<Result<User>> getUsers({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('departmentId') int? departmentId,
    @Query('positionId') int? positionId,
    @Query('search') String? search,
  });

  @PATCH('user/{id}')
  Future<User> updateUser({
    @Path('id') required int id,
    @Body() required UpdateUserDto request,
  });
}
