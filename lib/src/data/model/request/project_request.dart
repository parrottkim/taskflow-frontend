part of '../../data.dart';

@freezed
abstract class CreateProjectRequest with _$CreateProjectRequest {
  factory CreateProjectRequest({
    int? managerId,
    required int clientId,
    required String projectCode,
    required String projectName,
    bool? isPreexecuted,
  }) = _CreateProjectRequest;

  factory CreateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectRequestFromJson(json);
}

@freezed
abstract class UpdateProjectRequest with _$UpdateProjectRequest {
  factory UpdateProjectRequest({
    int? managerId,
    int? clientId,
    String? projectCode,
    String? projectName,
    bool? isPreexecuted,
    int? categoryId,
    bool? isContracted,
  }) = _UpdateProjectRequest;

  factory UpdateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectRequestFromJson(json);
}

@freezed
abstract class CloseProjectRequest with _$CloseProjectRequest {
  const factory CloseProjectRequest({required String closureMessage}) =
      _CloseProjectRequest;

  factory CloseProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$CloseProjectRequestFromJson(json);
}

@freezed
abstract class SendMailRequest with _$SendMailRequest {
  factory SendMailRequest({List<int>? userIds}) = _SendMailRequest;

  factory SendMailRequest.fromJson(Map<String, dynamic> json) =>
      _$SendMailRequestFromJson(json);
}
