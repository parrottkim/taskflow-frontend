part of '../../data.dart';

// ⭐️ [신규] 보고서 생성 전체 요청 모델 (CreateReportRequest 대응)
@freezed
abstract class CreateReportRequest with _$CreateReportRequest {
  factory CreateReportRequest({
    int? scheduleId,
    required int projectId,
    required String content,
    required List<ReportAttachment> attachments,
    CreateTripReportRequest? trip, // ⭐️ 선택적 Trip 상세 정보
  }) = _CreateReportRequest;

  factory CreateReportRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReportRequestFromJson(json);
}

@freezed
abstract class CreateTripReportRequest with _$CreateTripReportRequest {
  factory CreateTripReportRequest({
    // scheduleId 제거
    required List<CreateActualExpenseRequest> expenses,
    required List<CreateRegulationRateRequest> rates,
    CreateFuelExpenseRequest? fuel, // ⭐️ 타입 변경
    bool? isDeducted, // DTO에 맞게 required로 변경
    List<UpdateScheduleHolidayRequest>? holidays,
  }) = _CreateTripReportRequest;

  factory CreateTripReportRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTripReportRequestFromJson(json);
}

@freezed
abstract class CreateFuelExpenseRequest with _$CreateFuelExpenseRequest {
  factory CreateFuelExpenseRequest({
    required String rate,
    required String mileage,
    required String distance,
  }) = _CreateFuelExpenseRequest;

  factory CreateFuelExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateFuelExpenseRequestFromJson(json);
}

@freezed
abstract class CreateActualExpenseRequest with _$CreateActualExpenseRequest {
  factory CreateActualExpenseRequest({
    required int stepId,
    int? currencyId,
    required String price,
    DateTime? paymentDate,
    String? details,
  }) = _CreateActualExpenseRequest;
  factory CreateActualExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateActualExpenseRequestFromJson(json);
}

@freezed
abstract class CreateRegulationRateRequest with _$CreateRegulationRateRequest {
  factory CreateRegulationRateRequest({
    required int stepId,
    required String days,
    required String rate,
    String? details,
  }) = _CreateRegulationRateRequest;
  factory CreateRegulationRateRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRegulationRateRequestFromJson(json);
}

// ⭐️ [신규] 보고서 업데이트 전체 요청 모델 (UpdateReportRequest 대응)
@freezed
abstract class UpdateReportRequest with _$UpdateReportRequest {
  factory UpdateReportRequest({
    int? scheduleId,
    required int projectId,
    required String content,
    required List<ReportAttachment> attachments,
    UpdateTripReportRequest? trip, // ⭐️ 선택적 Trip 상세 정보
  }) = _UpdateReportRequest;

  factory UpdateReportRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateReportRequestFromJson(json);
}

// ⭐️ [수정] Trip 상세 정보 모델 (UpdateTripReportRequest 대응)
@freezed
abstract class UpdateTripReportRequest with _$UpdateTripReportRequest {
  factory UpdateTripReportRequest({
    // scheduleId 제거
    List<UpdateActualExpenseRequest>? expenses, // ⭐️ Optional
    List<UpdateRegulationRateRequest>? rates, // ⭐️ Optional
    UpdateFuelExpenseRequest? fuel, // ⭐️ 타입 변경 및 Optional
    bool? isDeducted, // ⭐️ Optional
    List<UpdateScheduleHolidayRequest>? holidays,
  }) = _UpdateTripReportRequest;

  factory UpdateTripReportRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTripReportRequestFromJson(json);
}

// ⭐️ [신규] 유류비 업데이트 요청 모델 (UpdateFuelExpenseRequest 대응)
@freezed
abstract class UpdateFuelExpenseRequest with _$UpdateFuelExpenseRequest {
  factory UpdateFuelExpenseRequest({
    int? id,
    String? rate,
    String? mileage,
    String? distance,
  }) = _UpdateFuelExpenseRequest;

  factory UpdateFuelExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateFuelExpenseRequestFromJson(json);
}

// UpdateActualExpenseRequest (유지)
@freezed
abstract class UpdateActualExpenseRequest with _$UpdateActualExpenseRequest {
  factory UpdateActualExpenseRequest({
    int? id,
    required int stepId,
    int? currencyId,
    required String price,
    DateTime? paymentDate,
    String? details,
  }) = _UpdateActualExpenseRequest;
  factory UpdateActualExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateActualExpenseRequestFromJson(json);
}

// UpdateRegulationRateRequest (유지)
@freezed
abstract class UpdateRegulationRateRequest with _$UpdateRegulationRateRequest {
  factory UpdateRegulationRateRequest({
    int? id,
    required int stepId,
    required String days,
    required String rate,
    String? details,
  }) = _UpdateRegulationRateRequest;
  factory UpdateRegulationRateRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateRegulationRateRequestFromJson(json);
}
