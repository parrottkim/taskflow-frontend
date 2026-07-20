part of '../data.dart';

abstract class AuthRepository {
  Future<Token> login({required LoginRequest login});

  Future<User> register({required RegisterRequest request});

  Future<Token> refresh();

  Future<void> forgotPassword({required ForgotPasswordRequest request});

  Future<void> resetPassword({required ResetPasswordRequest request});
}
