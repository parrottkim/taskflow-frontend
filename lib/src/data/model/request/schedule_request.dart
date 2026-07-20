part of '../../data.dart';

@freezed
abstract class UpsertScheduleRequest with _$UpsertScheduleRequest {
  factory UpsertScheduleRequest({
    required String summary,
    String? description,
    required String url,
    required int projectId,
    required int categoryId,
    required DateTime start,
    required DateTime end,
  }) = _UpsertScheduleRequest;

  factory UpsertScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$UpsertScheduleRequestFromJson(json);
}
