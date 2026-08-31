part of '../../data.dart';

@freezed
abstract class UpdateUserRequest with _$UpdateUserRequest {
  factory UpdateUserRequest({
    String? username,
    String? email,
    String? password,
  }) = _UpdateUserRequest;

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);
}

@freezed
abstract class UpdateUserPermissionRequest with _$UpdateUserPermissionRequest {
  factory UpdateUserPermissionRequest({
    bool? isAdmin,
    bool? isAuthorized,
    bool? isGuest,
    int? rankId,
    int? positionId,
    int? departmentId,
  }) = _UpdateUserPermissionRequest;

  factory UpdateUserPermissionRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserPermissionRequestFromJson(json);
}
