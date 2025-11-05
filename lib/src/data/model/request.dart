part of '../data.dart';

@freezed
abstract class LoginRequest with _$LoginRequest {
  factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  factory RegisterRequest({
    required String username,
    required String email,
    required String password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
abstract class CreateProjectRequest with _$CreateProjectRequest {
  factory CreateProjectRequest({
    int? managerId,
    int? clientId,
    String? projectCode,
    String? projectName,
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
    bool? isClosed,
    String? closureMessage,
  }) = _UpdateProjectRequest;

  factory UpdateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectRequestFromJson(json);
}

@freezed
abstract class CreateIssueRequest with _$CreateIssueRequest {
  factory CreateIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    CreateContractDetailsRequest? contract,
    CreateKickoffDetailsRequest? kickoff,
    CreateProcurementDetailsRequest? procurement,
    CreateTransactionDetailsRequest? transaction,
  }) = _CreateIssueRequest;

  factory CreateIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateIssueRequestFromJson(json);
}

@freezed
abstract class CreateContractDetailsRequest
    with _$CreateContractDetailsRequest {
  factory CreateContractDetailsRequest({
    required List<CreateContractItemRequest> items,
  }) = _CreateContractDetailsRequest;

  factory CreateContractDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateContractDetailsRequestFromJson(json);
}

@freezed
abstract class CreateKickoffDetailsRequest with _$CreateKickoffDetailsRequest {
  factory CreateKickoffDetailsRequest({
    required DateTime kickoffDate,
  }) = _CreateKickoffDetailsRequest;

  factory CreateKickoffDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateKickoffDetailsRequestFromJson(json);
}

@freezed
abstract class CreateProcurementDetailsRequest
    with _$CreateProcurementDetailsRequest {
  factory CreateProcurementDetailsRequest({
    required List<CreateProcurementItemRequest> items,
  }) = _CreateProcurementDetailsRequest;

  factory CreateProcurementDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProcurementDetailsRequestFromJson(json);
}

@freezed
abstract class CreateTransactionDetailsRequest
    with _$CreateTransactionDetailsRequest {
  factory CreateTransactionDetailsRequest({
    required List<CreateTransactionItemRequest> items,
  }) = _CreateTransactionDetailsRequest;

  factory CreateTransactionDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionDetailsRequestFromJson(json);
}

@freezed
abstract class CreateContractItemRequest with _$CreateContractItemRequest {
  factory CreateContractItemRequest({
    required String item,
    required int currencyId,
    required String price,
  }) = _CreateContractItemRequest;

  factory CreateContractItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateContractItemRequestFromJson(json);
}

@freezed
abstract class CreateProcurementItemRequest
    with _$CreateProcurementItemRequest {
  factory CreateProcurementItemRequest({
    required String item,
    required String spec,
    required String quantity,
    required String unitPrice,
    required String totalAmount,
    @Default(false) bool isOnlinePurchase,
    String? purchaseUrl,
    int? supplierId,
  }) = _CreateProcurementItemRequest;

  factory CreateProcurementItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProcurementItemRequestFromJson(json);
}

@freezed
abstract class CreateTransactionItemRequest
    with _$CreateTransactionItemRequest {
  factory CreateTransactionItemRequest({
    required int categoryId,
    required int currencyId,
    required String price,
    required String note,
  }) = _CreateTransactionItemRequest;

  factory CreateTransactionItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionItemRequestFromJson(json);
}

@freezed
abstract class UpdateIssueRequest with _$UpdateIssueRequest {
  factory UpdateIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required List<UpdateIssueAttachmentRequest> attachments,
    UpdateContractDetailsRequest? contract,
    UpdateKickoffDetailsRequest? kickoff,
    UpdateProcurementDetailsRequest? procurement,
    UpdateTransactionDetailsRequest? transaction,
  }) = _UpdateIssueRequest;

  factory UpdateIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateIssueRequestFromJson(json);
}

@freezed
abstract class UpdateContractDetailsRequest
    with _$UpdateContractDetailsRequest {
  factory UpdateContractDetailsRequest({
    required List<UpdateContractItemRequest> items,
  }) = _UpdateContractDetailsRequest;

  factory UpdateContractDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateContractDetailsRequestFromJson(json);
}

@freezed
abstract class UpdateKickoffDetailsRequest with _$UpdateKickoffDetailsRequest {
  factory UpdateKickoffDetailsRequest({
    required int id,
    required DateTime kickoffDate,
  }) = _UpdateKickoffDetailsRequest;

  factory UpdateKickoffDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateKickoffDetailsRequestFromJson(json);
}

@freezed
abstract class UpdateProcurementDetailsRequest
    with _$UpdateProcurementDetailsRequest {
  factory UpdateProcurementDetailsRequest({
    required List<UpdateProcurementItemRequest> items,
  }) = _UpdateProcurementDetailsRequest;

  factory UpdateProcurementDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProcurementDetailsRequestFromJson(json);
}

@freezed
abstract class UpdateTransactionDetailsRequest
    with _$UpdateTransactionDetailsRequest {
  factory UpdateTransactionDetailsRequest({
    required List<UpdateTransactionItemRequest> items,
  }) = _UpdateTransactionDetailsRequest;

  factory UpdateTransactionDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionDetailsRequestFromJson(json);
}

@freezed
abstract class UpdateContractItemRequest with _$UpdateContractItemRequest {
  factory UpdateContractItemRequest({
    int? id,
    required String item,
    required int currencyId,
    required String price,
  }) = _UpdateContractItemRequest;

  factory UpdateContractItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateContractItemRequestFromJson(json);
}

@freezed
abstract class UpdateProcurementItemRequest
    with _$UpdateProcurementItemRequest {
  factory UpdateProcurementItemRequest({
    int? id,
    required String item,
    required String spec,
    required String quantity,
    required String unitPrice,
    required String totalAmount,
    @Default(false) bool isOnlinePurchase,
    String? purchaseUrl,
    int? supplierId,
  }) = _UpdateProcurementItemRequest;

  factory UpdateProcurementItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProcurementItemRequestFromJson(json);
}

@freezed
abstract class UpdateTransactionItemRequest
    with _$UpdateTransactionItemRequest {
  factory UpdateTransactionItemRequest({
    int? id,
    required int categoryId,
    required int currencyId,
    required String price,
    required String note,
  }) = _UpdateTransactionItemRequest;

  factory UpdateTransactionItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionItemRequestFromJson(json);
}

@freezed
abstract class UpdateIssueAttachmentRequest
    with _$UpdateIssueAttachmentRequest {
  factory UpdateIssueAttachmentRequest({
    required int id,
    required String name,
    required int size,
    required String url,
  }) = _UpdateIssueAttachmentRequest;

  factory UpdateIssueAttachmentRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateIssueAttachmentRequestFromJson(json);
}

@freezed
abstract class SupplierRequest with _$SupplierRequest {
  factory SupplierRequest({
    required String businessNumber,
    required String name,
    String? phone,
    String? address,
    String? favicon,
  }) = _SupplierRequest;

  factory SupplierRequest.fromJson(Map<String, dynamic> json) =>
      _$SupplierRequestFromJson(json);
}

@freezed
abstract class ScheduleRequest with _$ScheduleRequest {
  factory ScheduleRequest({
    required String summary,
    String? description,
    required int projectId,
    required int categoryId,
    required DateTime start,
    required DateTime end,
  }) = _CreateScheduleRequest;

  factory ScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateScheduleRequestFromJson(json);
}

@freezed
abstract class CreateTripRequest with _$CreateTripRequest {
  factory CreateTripRequest({
    required int scheduleId,
    required List<CreateActualExpenseRequest> expenses,
    required List<CreateRegulationRateRequest> rates,
    TripFuelExpense? fuel,
    @Default(false) bool isDeducted,
  }) = _CreateTripRequest;

  factory CreateTripRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTripRequestFromJson(json);
}

@freezed
abstract class CreateActualExpenseRequest with _$CreateActualExpenseRequest {
  factory CreateActualExpenseRequest({
    required int stepId,
    required String price,
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

@freezed
abstract class UpdateTripRequest with _$UpdateTripRequest {
  factory UpdateTripRequest({
    required int scheduleId,
    required List<UpdateActualExpenseRequest> expenses,
    required List<UpdateRegulationRateRequest> rates,
    TripFuelExpense? fuel,
    @Default(false) bool isDeducted,
  }) = _UpdateTripRequest;

  factory UpdateTripRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTripRequestFromJson(json);
}

@freezed
abstract class UpdateActualExpenseRequest with _$UpdateActualExpenseRequest {
  factory UpdateActualExpenseRequest({
    int? id,
    required int stepId,
    required String price,
    String? details,
  }) = _UpdateActualExpenseRequest;

  factory UpdateActualExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateActualExpenseRequestFromJson(json);
}

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
