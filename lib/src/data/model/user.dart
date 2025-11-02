part of '../data.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String email,
    required String username,
    @Default(false) bool isAdmin,
    @Default(false) bool isAuthorized,
    UserPosition? position,
    UserDepartment? department,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.dummy() => User(
        id: 0,
        email: 'gdhong@dan-tech.com',
        username: '홍길동',
        position: UserPosition.dummy(),
        department: UserDepartment.dummy(),
      );
}

@freezed
abstract class UserPosition with _$UserPosition {
  const factory UserPosition({
    required int id,
    required String name,
  }) = _UserPosition;

  factory UserPosition.fromJson(Map<String, dynamic> json) =>
      _$UserPositionFromJson(json);

  factory UserPosition.dummy() => UserPosition(id: 0, name: 'Position');
}

@freezed
abstract class UserDepartment with _$UserDepartment {
  const factory UserDepartment({
    required int id,
    required String name,
  }) = _UserDepartment;

  factory UserDepartment.fromJson(Map<String, dynamic> json) =>
      _$UserDepartmentFromJson(json);

  factory UserDepartment.dummy() => UserDepartment(id: 0, name: 'Department');
}
