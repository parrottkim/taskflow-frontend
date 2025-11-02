part of '../data.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('auth/login')
  Future<Token> login({@Body() required LoginRequest login});

  @POST('auth/register')
  Future<User> register({@Body() required RegisterRequest register});

  @POST('auth/refresh')
  Future<Token> refresh();
}
