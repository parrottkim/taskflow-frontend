part of '../data.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('auth/login')
  Future<Token> login({@Body() required LoginRequest login});

  @POST('auth/register')
  Future<User> register({@Body() required RegisterRequest request});

  @POST('auth/refresh')
  Future<Token> refresh();

  @POST('auth/forgot-password')
  Future<void> forgotPassword({@Body() required ForgotPasswordRequest request});

  @POST('auth/reset-password')
  Future<void> resetPassword({@Body() required ResetPasswordRequest request});
}
