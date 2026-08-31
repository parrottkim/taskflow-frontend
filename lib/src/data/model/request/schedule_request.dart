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
    List<UpdateScheduleHolidayRequest>? holidays,
  }) = _UpsertScheduleRequest;

  factory UpsertScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$UpsertScheduleRequestFromJson(json);
}

@freezed
abstract class UpdateScheduleHolidayRequest
    with _$UpdateScheduleHolidayRequest {
  factory UpdateScheduleHolidayRequest({
    required DateTime date,
    required bool isTravelOnly,
    DateTime? compensatoryLeaveDate,
  }) = _UpdateScheduleHolidayRequest;

  factory UpdateScheduleHolidayRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateScheduleHolidayRequestFromJson(json);
}
