part of '../data.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('auth/login')
  Future<Token> login({@Body() required LoginDto login});

  @POST('auth/register')
  Future<User> register({@Body() required RegisterDto request});

  @POST('auth/refresh')
  Future<Token> refresh();

  @POST('auth/forgot-password')
  Future<void> forgotPassword({@Body() required ForgotPasswordDto request});

  @POST('auth/reset-password')
  Future<void> resetPassword({@Body() required ResetPasswordDto request});
}
