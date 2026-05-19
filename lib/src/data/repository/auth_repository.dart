part of '../data.dart';

abstract class AuthRepository {
  Future<Token> login({required LoginDto login});

  Future<User> register({required RegisterDto request});

  Future<Token> refresh();

  Future<void> forgotPassword({required ForgotPasswordDto request});

  Future<void> resetPassword({required ResetPasswordDto request});
}
