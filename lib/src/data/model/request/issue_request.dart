part of '../../data.dart';

@freezed
abstract class CreateContractIssueRequest with _$CreateContractIssueRequest {
  factory CreateContractIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required int currencyId,
    required List<CreateContractIssueItemRequest> contractItems,
    required List<CreateTransactionIssueItemRequest> transactionItems,
    required List<IssueAttachment> attachments,
  }) = _CreateContractIssueRequest;

  factory CreateContractIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateContractIssueRequestFromJson(json);
}

@freezed
abstract class CreateKickoffIssueRequest with _$CreateKickoffIssueRequest {
  factory CreateKickoffIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required DateTime kickoffDate,
    required List<IssueAttachment> attachments,
  }) = _CreateKickoffIssueRequest;

  factory CreateKickoffIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateKickoffIssueRequestFromJson(json);
}

@freezed
abstract class CreateApprovalIssueRequest with _$CreateApprovalIssueRequest {
  factory CreateApprovalIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required List<IssueAttachment> attachments,
  }) = _CreateApprovalIssueRequest;

  factory CreateApprovalIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateApprovalIssueRequestFromJson(json);
}

@freezed
abstract class UpsertProcurementRequest with _$UpsertProcurementRequest {
  factory UpsertProcurementRequest({
    required String title,
    DateTime? deliveryDate,
    String? paymentTerms,
    @Default(false) bool hasFee,
    String? note,
    required int supplierId,
    required List<CreateProcurementIssueItemRequest> items,
  }) = _UpsertProcurementRequest;

  factory UpsertProcurementRequest.fromJson(Map<String, dynamic> json) =>
      _$UpsertProcurementRequestFromJson(json);
}

@freezed
abstract class CreateProcurementIssueRequest
    with _$CreateProcurementIssueRequest {
  factory CreateProcurementIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required List<CreateProcurementIssueItemRequest> procurementItems,
    required List<IssueAttachment> attachments,
  }) = _CreateProcurementIssueRequest;

  factory CreateProcurementIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProcurementIssueRequestFromJson(json);
}

@freezed
abstract class CreateTransactionIssueRequest
    with _$CreateTransactionIssueRequest {
  factory CreateTransactionIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required List<UpdateTransactionIssueItemRequest> transactionItems,
    required List<IssueAttachment> attachments,
  }) = _CreateTransactionIssueRequest;

  factory CreateTransactionIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionIssueRequestFromJson(json);
}

@freezed
abstract class CreatePaymentIssueRequest with _$CreatePaymentIssueRequest {
  factory CreatePaymentIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required List<IssueAttachment> attachments,
  }) = _CreatePaymentIssueRequest;

  factory CreatePaymentIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentIssueRequestFromJson(json);
}

@freezed
abstract class UpdateContractIssueRequest with _$UpdateContractIssueRequest {
  factory UpdateContractIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required int currencyId,
    required List<UpdateContractIssueItemRequest> contractItems,
    required List<UpdateTransactionIssueItemRequest> transactionItems,
    required List<IssueAttachment> attachments,
  }) = _UpdateContractIssueRequest;

  factory UpdateContractIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateContractIssueRequestFromJson(json);
}

@freezed
abstract class UpdateKickoffIssueRequest with _$UpdateKickoffIssueRequest {
  factory UpdateKickoffIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required DateTime kickoffDate,
    required List<IssueAttachment> attachments,
  }) = _UpdateKickoffIssueRequest;

  factory UpdateKickoffIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateKickoffIssueRequestFromJson(json);
}

@freezed
abstract class UpdateApprovalIssueRequest with _$UpdateApprovalIssueRequest {
  factory UpdateApprovalIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required List<IssueAttachment> attachments,
  }) = _UpdateApprovalIssueRequest;

  factory UpdateApprovalIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateApprovalIssueRequestFromJson(json);
}

@freezed
abstract class UpdateProcurementIssueRequest
    with _$UpdateProcurementIssueRequest {
  factory UpdateProcurementIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required List<UpdateProcurementIssueItemRequest> procurementItems,
    required List<IssueAttachment> attachments,
  }) = _UpdateProcurementIssueRequest;

  factory UpdateProcurementIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProcurementIssueRequestFromJson(json);
}

@freezed
abstract class UpdateTransactionIssueRequest
    with _$UpdateTransactionIssueRequest {
  factory UpdateTransactionIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required List<UpdateTransactionIssueItemRequest> transactionItems,
    required List<IssueAttachment> attachments,
  }) = _UpdateTransactionIssueRequest;

  factory UpdateTransactionIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionIssueRequestFromJson(json);
}

@freezed
abstract class UpdatePaymentIssueRequest with _$UpdatePaymentIssueRequest {
  factory UpdatePaymentIssueRequest({
    required int projectId,
    required int categoryId,
    required String content,
    required List<IssueAttachment> attachments,
  }) = _UpdatePaymentIssueRequest;

  factory UpdatePaymentIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePaymentIssueRequestFromJson(json);
}

@freezed
abstract class CreateContractIssueItemRequest
    with _$CreateContractIssueItemRequest {
  factory CreateContractIssueItemRequest({
    required String item,
    required String price,
  }) = _CreateContractIssueItemRequest;

  factory CreateContractIssueItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateContractIssueItemRequestFromJson(json);
}

@freezed
abstract class CreateProcurementIssueItemRequest
    with _$CreateProcurementIssueItemRequest {
  factory CreateProcurementIssueItemRequest({
    required String item,
    required String spec,
    required String quantity,
    required String unitPrice,
    required String totalAmount,
    @Default(false) bool isOnlinePurchase,
    String? purchaseUrl,
    int? supplierId,
    String? note,
  }) = _CreateProcurementIssueItemRequest;

  factory CreateProcurementIssueItemRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$CreateProcurementIssueItemRequestFromJson(json);
}

@freezed
abstract class CreateTransactionIssueItemRequest
    with _$CreateTransactionIssueItemRequest {
  factory CreateTransactionIssueItemRequest({
    required int categoryId,
    required String price,
    required String ratio,
    bool? isPaid,
    DateTime? paidAt,
    String? note,
  }) = _CreateTransactionIssueItemRequest;

  factory CreateTransactionIssueItemRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$CreateTransactionIssueItemRequestFromJson(json);
}

@freezed
abstract class UpdateContractIssueItemRequest
    with _$UpdateContractIssueItemRequest {
  factory UpdateContractIssueItemRequest({
    int? id,
    required String item,
    required String price,
  }) = _UpdateContractIssueItemRequest;

  factory UpdateContractIssueItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateContractIssueItemRequestFromJson(json);
}

@freezed
abstract class UpdateProcurementIssueItemRequest
    with _$UpdateProcurementIssueItemRequest {
  factory UpdateProcurementIssueItemRequest({
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
  }) = _UpdateProcurementIssueItemRequest;

  factory UpdateProcurementIssueItemRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$UpdateProcurementIssueItemRequestFromJson(json);
}

@freezed
abstract class UpdateTransactionIssueItemRequest
    with _$UpdateTransactionIssueItemRequest {
  factory UpdateTransactionIssueItemRequest({
    int? id,
    required int categoryId,
    required String price,
    required String ratio,
    bool? isPaid,
    DateTime? paidAt,
    String? note,
  }) = _UpdateTransactionIssueItemRequest;

  factory UpdateTransactionIssueItemRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$UpdateTransactionIssueItemRequestFromJson(json);
}
