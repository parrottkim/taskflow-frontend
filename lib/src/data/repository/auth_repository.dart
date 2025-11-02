part of '../data.dart';

abstract class AuthRepository {
  Future<Token> login({required LoginRequest login});

  Future<User> register({required RegisterRequest register});

  Future<Token> refresh();
}
