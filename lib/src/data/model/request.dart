part of '../data.dart';

@freezed
abstract class LoginDto with _$LoginDto {
  factory LoginDto({required String email, required String password}) =
      _LoginDto;

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
}

@freezed
abstract class RegisterDto with _$RegisterDto {
  factory RegisterDto({
    required String username,
    required String email,
    required String password,
  }) = _RegisterDto;

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);
}

@freezed
abstract class ForgotPasswordDto with _$ForgotPasswordDto {
  factory ForgotPasswordDto({required String email}) = _ForgotPasswordDto;

  factory ForgotPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordDtoFromJson(json);
}

@freezed
abstract class ResetPasswordDto with _$ResetPasswordDto {
  factory ResetPasswordDto({
    required String token,
    required String newPassword,
  }) = _ResetPasswordDto;

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDtoFromJson(json);
}

@freezed
abstract class UpdateUserDto with _$UpdateUserDto {
  factory UpdateUserDto({String? username, String? email, String? password}) =
      _UpdateUserDto;

  factory UpdateUserDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDtoFromJson(json);
}

@freezed
abstract class UpdateUserPermissionDto with _$UpdateUserPermissionDto {
  factory UpdateUserPermissionDto({
    bool? isAdmin,
    bool? isAuthorized,
    int? positionId,
    int? departmentId,
  }) = _UpdateUserPermissionDto;

  factory UpdateUserPermissionDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserPermissionDtoFromJson(json);
}

@freezed
abstract class CreateProjectDto with _$CreateProjectDto {
  factory CreateProjectDto({
    int? managerId,
    int? clientId,
    String? projectCode,
    String? projectName,
    bool? isPreexecuted,
  }) = _CreateProjectDto;

  factory CreateProjectDto.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectDtoFromJson(json);
}

@freezed
abstract class UpdateProjectDto with _$UpdateProjectDto {
  factory UpdateProjectDto({
    int? managerId,
    int? clientId,
    String? projectCode,
    String? projectName,
    bool? isPreexecuted,
    bool? isClosed,
    String? closureMessage,
  }) = _UpdateProjectDto;

  factory UpdateProjectDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectDtoFromJson(json);
}

@freezed
abstract class SendIssueMailDto with _$SendIssueMailDto {
  factory SendIssueMailDto({List<int>? userIds}) = _SendIssueMailDto;

  factory SendIssueMailDto.fromJson(Map<String, dynamic> json) =>
      _$SendIssueMailDtoFromJson(json);
}

@freezed
abstract class CreateContractIssueDto with _$CreateContractIssueDto {
  factory CreateContractIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required int currencyId,
    required List<CreateContractIssueItemDto> contractItems,
    required List<CreateTransactionIssueItemDto> transactionItems,
    required List<IssueAttachment> attachments,
  }) = _CreateContractIssueDto;

  factory CreateContractIssueDto.fromJson(Map<String, dynamic> json) =>
      _$CreateContractIssueDtoFromJson(json);
}

@freezed
abstract class CreateKickoffIssueDto with _$CreateKickoffIssueDto {
  factory CreateKickoffIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required DateTime kickoffDate,
    required List<IssueAttachment> attachments,
  }) = _CreateKickoffIssueDto;

  factory CreateKickoffIssueDto.fromJson(Map<String, dynamic> json) =>
      _$CreateKickoffIssueDtoFromJson(json);
}

@freezed
abstract class CreateApprovalIssueDto with _$CreateApprovalIssueDto {
  factory CreateApprovalIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required List<IssueAttachment> attachments,
  }) = _CreateApprovalIssueDto;

  factory CreateApprovalIssueDto.fromJson(Map<String, dynamic> json) =>
      _$CreateApprovalIssueDtoFromJson(json);
}

@freezed
abstract class CreateProcurementIssueRequestDto
    with _$CreateProcurementIssueRequestDto {
  factory CreateProcurementIssueRequestDto({
    required String title,
    DateTime? deliveryDate,
    String? paymentTerms,
    @Default(false) bool hasFee,
    String? note,
    required int supplierId,
    required List<CreateProcurementIssueItemDto> items,
  }) = _CreateProcurementIssueRequestDto;

  factory CreateProcurementIssueRequestDto.fromJson(
    Map<String, dynamic> json,
  ) => _$CreateProcurementIssueRequestDtoFromJson(json);
}

@freezed
abstract class CreateProcurementIssueDto with _$CreateProcurementIssueDto {
  factory CreateProcurementIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required List<CreateProcurementIssueItemDto> procurementItems,
    required List<IssueAttachment> attachments,
  }) = _CreateProcurementIssueDto;

  factory CreateProcurementIssueDto.fromJson(Map<String, dynamic> json) =>
      _$CreateProcurementIssueDtoFromJson(json);
}

@freezed
abstract class CreateTransactionIssueDto with _$CreateTransactionIssueDto {
  factory CreateTransactionIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required List<UpdateTransactionIssueItemDto> transactionItems,
    required List<IssueAttachment> attachments,
  }) = _CreateTransactionIssueDto;

  factory CreateTransactionIssueDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionIssueDtoFromJson(json);
}

@freezed
abstract class CreatePaymentIssueDto with _$CreatePaymentIssueDto {
  factory CreatePaymentIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required List<IssueAttachment> attachments,
  }) = _CreatePaymentIssueDto;

  factory CreatePaymentIssueDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentIssueDtoFromJson(json);
}

@freezed
abstract class UpdateContractIssueDto with _$UpdateContractIssueDto {
  factory UpdateContractIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required int currencyId,
    required List<UpdateContractIssueItemDto> contractItems,
    required List<UpdateTransactionIssueItemDto> transactionItems,
    required List<IssueAttachment> attachments,
  }) = _UpdateContractIssueDto;

  factory UpdateContractIssueDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateContractIssueDtoFromJson(json);
}

@freezed
abstract class UpdateKickoffIssueDto with _$UpdateKickoffIssueDto {
  factory UpdateKickoffIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required DateTime kickoffDate,
    required List<IssueAttachment> attachments,
  }) = _UpdateKickoffIssueDto;

  factory UpdateKickoffIssueDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateKickoffIssueDtoFromJson(json);
}

@freezed
abstract class UpdateApprovalIssueDto with _$UpdateApprovalIssueDto {
  factory UpdateApprovalIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required List<IssueAttachment> attachments,
  }) = _UpdateApprovalIssueDto;

  factory UpdateApprovalIssueDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateApprovalIssueDtoFromJson(json);
}

@freezed
abstract class UpdateProcurementIssueDto with _$UpdateProcurementIssueDto {
  factory UpdateProcurementIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required List<UpdateProcurementIssueItemDto> procurementItems,
    required List<IssueAttachment> attachments,
  }) = _UpdateProcurementIssueDto;

  factory UpdateProcurementIssueDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProcurementIssueDtoFromJson(json);
}

@freezed
abstract class UpdateTransactionIssueDto with _$UpdateTransactionIssueDto {
  factory UpdateTransactionIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required List<UpdateTransactionIssueItemDto> transactionItems,
    required List<IssueAttachment> attachments,
  }) = _UpdateTransactionIssueDto;

  factory UpdateTransactionIssueDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionIssueDtoFromJson(json);
}

@freezed
abstract class UpdatePaymentIssueDto with _$UpdatePaymentIssueDto {
  factory UpdatePaymentIssueDto({
    required int projectId,
    required int categoryId,
    required String content,
    required List<IssueAttachment> attachments,
  }) = _UpdatePaymentIssueDto;

  factory UpdatePaymentIssueDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePaymentIssueDtoFromJson(json);
}

@freezed
abstract class CreateContractIssueItemDto with _$CreateContractIssueItemDto {
  factory CreateContractIssueItemDto({
    required String item,
    required String price,
  }) = _CreateContractIssueItemDto;

  factory CreateContractIssueItemDto.fromJson(Map<String, dynamic> json) =>
      _$CreateContractIssueItemDtoFromJson(json);
}

@freezed
abstract class CreateProcurementIssueItemDto
    with _$CreateProcurementIssueItemDto {
  factory CreateProcurementIssueItemDto({
    required String item,
    required String spec,
    required String quantity,
    required String unitPrice,
    required String totalAmount,
    @Default(false) bool isOnlinePurchase,
    String? purchaseUrl,
    int? supplierId,
    String? note,
  }) = _CreateProcurementIssueItemDto;

  factory CreateProcurementIssueItemDto.fromJson(Map<String, dynamic> json) =>
      _$CreateProcurementIssueItemDtoFromJson(json);
}

@freezed
abstract class CreateTransactionIssueItemDto
    with _$CreateTransactionIssueItemDto {
  factory CreateTransactionIssueItemDto({
    required int categoryId,
    required String price,
    required String ratio,
    bool? isPaid,
    DateTime? paidAt,
    String? note,
  }) = _CreateTransactionIssueItemDto;

  factory CreateTransactionIssueItemDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionIssueItemDtoFromJson(json);
}

@freezed
abstract class UpdateContractIssueItemDto with _$UpdateContractIssueItemDto {
  factory UpdateContractIssueItemDto({
    int? id,
    required String item,
    required String price,
  }) = _UpdateContractIssueItemDto;

  factory UpdateContractIssueItemDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateContractIssueItemDtoFromJson(json);
}

@freezed
abstract class UpdateProcurementIssueItemDto
    with _$UpdateProcurementIssueItemDto {
  factory UpdateProcurementIssueItemDto({
    int? id,
    required String item,
    required String spec,
    required String quantity,
    required String unitPrice,
    required String totalAmount,
    @Default(false) bool isOnlinePurchase,
    String? purchaseUrl,
    int? supplierId,
    String? note,
  }) = _UpdateProcurementIssueItemDto;

  factory UpdateProcurementIssueItemDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProcurementIssueItemDtoFromJson(json);
}

@freezed
abstract class UpdateTransactionIssueItemDto
    with _$UpdateTransactionIssueItemDto {
  factory UpdateTransactionIssueItemDto({
    int? id,
    required int categoryId,
    required String price,
    required String ratio,
    bool? isPaid,
    DateTime? paidAt,
    String? note,
  }) = _UpdateTransactionIssueItemDto;

  factory UpdateTransactionIssueItemDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionIssueItemDtoFromJson(json);
}

@freezed
abstract class SupplierDto with _$SupplierDto {
  factory SupplierDto({
    required String businessNumber,
    required String name,
    String? phone,
    String? address,
    String? favicon,
  }) = _SupplierDto;

  factory SupplierDto.fromJson(Map<String, dynamic> json) =>
      _$SupplierDtoFromJson(json);
}

@freezed
abstract class ScheduleDto with _$ScheduleDto {
  factory ScheduleDto({
    required String summary,
    String? description,
    required String url,
    required int projectId,
    required int categoryId,
    required DateTime start,
    required DateTime end,
  }) = _CreateScheduleDto;

  factory ScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$CreateScheduleDtoFromJson(json);
}

@freezed
abstract class SendReportMailDto with _$SendReportMailDto {
  factory SendReportMailDto({List<int>? userIds}) = _SendReportMailDto;

  factory SendReportMailDto.fromJson(Map<String, dynamic> json) =>
      _$SendReportMailDtoFromJson(json);
}

// ⭐️ [신규] 보고서 생성 전체 요청 모델 (CreateReportDto 대응)
@freezed
abstract class CreateReportDto with _$CreateReportDto {
  factory CreateReportDto({
    int? scheduleId,
    required int projectId,
    required String content,
    required List<ReportAttachment> attachments,
    CreateTripReportDto? trip, // ⭐️ 선택적 Trip 상세 정보
  }) = _CreateReportDto;

  factory CreateReportDto.fromJson(Map<String, dynamic> json) =>
      _$CreateReportDtoFromJson(json);
}

@freezed
abstract class CreateTripReportDto with _$CreateTripReportDto {
  factory CreateTripReportDto({
    // scheduleId 제거
    required List<CreateActualExpenseDto> expenses,
    required List<CreateRegulationRateDto> rates,
    CreateFuelExpenseDto? fuel, // ⭐️ 타입 변경
    bool? isDeducted, // DTO에 맞게 required로 변경
  }) = _CreateTripReportDto;

  factory CreateTripReportDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTripReportDtoFromJson(json);
}

@freezed
abstract class CreateFuelExpenseDto with _$CreateFuelExpenseDto {
  factory CreateFuelExpenseDto({
    required String rate,
    required String mileage,
    required String distance,
  }) = _CreateFuelExpenseDto;

  factory CreateFuelExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$CreateFuelExpenseDtoFromJson(json);
}

@freezed
abstract class CreateActualExpenseDto with _$CreateActualExpenseDto {
  factory CreateActualExpenseDto({
    required int stepId,
    required String price,
    String? details,
  }) = _CreateActualExpenseDto;
  factory CreateActualExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$CreateActualExpenseDtoFromJson(json);
}

@freezed
abstract class CreateRegulationRateDto with _$CreateRegulationRateDto {
  factory CreateRegulationRateDto({
    required int stepId,
    required String days,
    required String rate,
    String? details,
  }) = _CreateRegulationRateDto;
  factory CreateRegulationRateDto.fromJson(Map<String, dynamic> json) =>
      _$CreateRegulationRateDtoFromJson(json);
}

// ⭐️ [신규] 보고서 업데이트 전체 요청 모델 (UpdateReportDto 대응)
@freezed
abstract class UpdateReportDto with _$UpdateReportDto {
  factory UpdateReportDto({
    int? scheduleId,
    required int projectId,
    required String content,
    required List<ReportAttachment> attachments,
    UpdateTripReportDto? trip, // ⭐️ 선택적 Trip 상세 정보
  }) = _UpdateReportDto;

  factory UpdateReportDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateReportDtoFromJson(json);
}

// ⭐️ [수정] Trip 상세 정보 모델 (UpdateTripReportDto 대응)
@freezed
abstract class UpdateTripReportDto with _$UpdateTripReportDto {
  factory UpdateTripReportDto({
    // scheduleId 제거
    List<UpdateActualExpenseDto>? expenses, // ⭐️ Optional
    List<UpdateRegulationRateDto>? rates, // ⭐️ Optional
    UpdateFuelExpenseDto? fuel, // ⭐️ 타입 변경 및 Optional
    bool? isDeducted, // ⭐️ Optional
  }) = _UpdateTripReportDto;

  factory UpdateTripReportDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTripReportDtoFromJson(json);
}

// ⭐️ [신규] 유류비 업데이트 요청 모델 (UpdateFuelExpenseDto 대응)
@freezed
abstract class UpdateFuelExpenseDto with _$UpdateFuelExpenseDto {
  factory UpdateFuelExpenseDto({
    int? id,
    String? rate,
    String? mileage,
    String? distance,
  }) = _UpdateFuelExpenseDto;

  factory UpdateFuelExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateFuelExpenseDtoFromJson(json);
}

// UpdateActualExpenseDto (유지)
@freezed
abstract class UpdateActualExpenseDto with _$UpdateActualExpenseDto {
  factory UpdateActualExpenseDto({
    int? id,
    required int stepId,
    required String price,
    String? details,
  }) = _UpdateActualExpenseDto;
  factory UpdateActualExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateActualExpenseDtoFromJson(json);
}

// UpdateRegulationRateDto (유지)
@freezed
abstract class UpdateRegulationRateDto with _$UpdateRegulationRateDto {
  factory UpdateRegulationRateDto({
    int? id,
    required int stepId,
    required String days,
    required String rate,
    String? details,
  }) = _UpdateRegulationRateDto;
  factory UpdateRegulationRateDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateRegulationRateDtoFromJson(json);
}
