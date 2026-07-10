part of '../data.dart';

@freezed
abstract class LatestIssue with _$LatestIssue {
  factory LatestIssue({
    required int id,
    required int projectId,
    required String projectCode,
    required String projectName,
    required IssueCategory category,
    required List<Client> clients,
    required User createdBy,
    required DateTime createdAt,
  }) = _LatestIssue;

  factory LatestIssue.fromJson(Map<String, dynamic> json) =>
      _$LatestIssueFromJson(json);

  factory LatestIssue.dummy() => LatestIssue(
    id: 0,
    projectId: 0,
    projectCode: 'Dummy Project Code',
    projectName: 'Dummy Project Name',
    category: IssueCategory.dummy(),
    clients: [Client.dummy()],
    createdBy: User.dummy(),
    createdAt: DateTime.now(),
  );
}

@Freezed(unionKey: 'type')
abstract class IssueCategory with _$IssueCategory {
  factory IssueCategory.kickoff({required int id, required String name}) =
      IssueKickoff;
  factory IssueCategory.contract({required int id, required String name}) =
      IssueContract;
  factory IssueCategory.transaction({required int id, required String name}) =
      IssueTransaction;
  factory IssueCategory.payment({required int id, required String name}) =
      IssuePayment;
  factory IssueCategory.approval({required int id, required String name}) =
      IssueApproval;
  factory IssueCategory.procurement({required int id, required String name}) =
      IssueProcurement;

  factory IssueCategory.fromJson(Map<String, dynamic> json) =>
      _$IssueCategoryFromJson(json);

  factory IssueCategory.dummy() => IssueCategory.contract(id: 1, name: '카테고리');
}

abstract class IssueInterface {
  int get id;
  String get content;
  User get user;
  List<IssueAttachment> get attachments;
  DateTime get createdAt;
  DateTime get updatedAt;
}

@freezed
sealed class Issue with _$Issue {
  factory Issue({
    required int id,
    required IssueCategory category,
    required String content,
    @Default([]) List<IssueAttachment> attachments,
    Currency? currency,
    DateTime? kickoffDate,
    @Default([]) List<ContractIssueItem> contractItems,
    @Default([]) List<TransactionIssueItem> transactionItems,
    @Default([]) List<ProcurementIssueItem> procurementItems,
    @Default([]) List<ProcurementIssueRequest> requests,
    required User createdBy,
    User? updatedBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Issue;

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  factory Issue.dummy() => Issue(
    id: 0,
    content: '',
    category: IssueCategory.dummy(),
    createdBy: User.dummy(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

@freezed
abstract class IssueAttachment with _$IssueAttachment {
  factory IssueAttachment({
    required int id,
    required String filename,
    required int size,
    required String path,
    required DateTime createdAt,
  }) = _IssueAttachment;

  factory IssueAttachment.fromJson(Map<String, dynamic> json) =>
      _$IssueAttachmentFromJson(json);
}

@freezed
abstract class ContractIssueItem with _$ContractIssueItem {
  factory ContractIssueItem({
    int? id,
    required String item,
    required String price,
  }) = _ContractIssueItem;

  factory ContractIssueItem.fromJson(Map<String, dynamic> json) =>
      _$ContractIssueItemFromJson(json);

  factory ContractIssueItem.empty() => ContractIssueItem(item: '', price: '');
}

@freezed
abstract class ProcurementIssueItem with _$ProcurementIssueItem {
  factory ProcurementIssueItem({
    int? id,
    required String item,
    required String spec,
    required String quantity,
    required String unitPrice,
    required String totalAmount,
    @Default(false) bool isOnlinePurchase,
    String? purchaseUrl,
    Supplier? supplier,
    String? note,
  }) = _ProcurementIssueItem;

  factory ProcurementIssueItem.fromJson(Map<String, dynamic> json) =>
      _$ProcurementIssueItemFromJson(json);

  factory ProcurementIssueItem.empty() => ProcurementIssueItem(
    item: '',
    spec: '',
    quantity: '',
    unitPrice: '',
    totalAmount: '',
  );
}

@freezed
abstract class ProcurementIssueRequestItem with _$ProcurementIssueRequestItem {
  factory ProcurementIssueRequestItem({
    int? id,
    required String item,
    required String spec,
    required String quantity,
    required String unitPrice,
    required String totalAmount,
    @Default(false) bool isOnlinePurchase,
    String? purchaseUrl,
    String? note,
  }) = _ProcurementIssueRequestItem;

  factory ProcurementIssueRequestItem.fromJson(Map<String, dynamic> json) =>
      _$ProcurementIssueRequestItemFromJson(json);

  factory ProcurementIssueRequestItem.empty() => ProcurementIssueRequestItem(
    item: '',
    spec: '',
    quantity: '',
    unitPrice: '',
    totalAmount: '',
  );
}

@freezed
abstract class TransactionIssueItemCategory
    with _$TransactionIssueItemCategory {
  factory TransactionIssueItemCategory({
    required int id,
    required String name,
  }) = _TransactionIssueItemCategory;

  factory TransactionIssueItemCategory.fromJson(Map<String, dynamic> json) =>
      _$TransactionIssueItemCategoryFromJson(json);

  factory TransactionIssueItemCategory.empty() =>
      TransactionIssueItemCategory(id: 0, name: '');
}

@freezed
abstract class TransactionIssueItem with _$TransactionIssueItem {
  factory TransactionIssueItem({
    int? id,
    TransactionIssueItemCategory? category,
    required String price,
    required String ratio,
    @Default(false) bool isPaid,
    DateTime? paidAt,
    String? note,
  }) = _TransactionIssueItem;

  factory TransactionIssueItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionIssueItemFromJson(json);

  factory TransactionIssueItem.empty() =>
      TransactionIssueItem(category: null, price: '', ratio: '', note: '');

  factory TransactionIssueItem.dummy() => TransactionIssueItem(
    category: TransactionIssueItemCategory.empty(),
    price: '',
    ratio: '',
  );
}

@freezed
abstract class ContractIssue with _$ContractIssue {
  factory ContractIssue({
    required int id,
    required IssueCategory category,
    required User createdBy,
    User? updatedBy,
    required String content,
    required Currency currency,
    @Default([]) List<IssueAttachment> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _ContractIssue;

  factory ContractIssue.fromJson(Map<String, dynamic> json) =>
      _$ContractIssueFromJson(json);
}

@freezed
abstract class KickoffIssue with _$KickoffIssue {
  factory KickoffIssue({
    required int id,
    required IssueCategory category,
    required User createdBy,
    User? updatedBy,
    required String content,
    required DateTime kickoffDate,
    @Default([]) List<IssueAttachment> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _KickoffIssue;

  factory KickoffIssue.fromJson(Map<String, dynamic> json) =>
      _$KickoffIssueFromJson(json);
}

@freezed
abstract class ProcurementIssue with _$ProcurementIssue {
  factory ProcurementIssue({
    required int id,
    required IssueCategory category,
    required User createdBy,
    User? updatedBy,
    required String content,
    @Default([]) List<ProcurementIssueItem> procurementItems,
    @Default([]) List<ProcurementIssueRequest> requests,
    @Default([]) List<IssueAttachment> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _ProcurementIssue;

  factory ProcurementIssue.fromJson(Map<String, dynamic> json) =>
      _$ProcurementIssueFromJson(json);
}

@freezed
abstract class TransactionIssue with _$TransactionIssue {
  factory TransactionIssue({
    required int id,
    required IssueCategory category,
    required User createdBy,
    User? updatedBy,
    required String content,
    Currency? currency,
    @Default([]) List<IssueAttachment> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _TransactionIssue;

  factory TransactionIssue.fromJson(Map<String, dynamic> json) =>
      _$TransactionIssueFromJson(json);
}

@freezed
abstract class PaymentIssue with _$PaymentIssue {
  factory PaymentIssue({
    required int id,
    required IssueCategory category,
    required User createdBy,
    User? updatedBy,
    required String content,
    @Default([]) List<IssueAttachment> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _PaymentIssue;

  factory PaymentIssue.fromJson(Map<String, dynamic> json) =>
      _$PaymentIssueFromJson(json);
}

@freezed
abstract class ApprovalIssue with _$ApprovalIssue {
  factory ApprovalIssue({
    required int id,
    required IssueCategory category,
    required User createdBy,
    User? updatedBy,
    required String content,
    @Default([]) List<IssueAttachment> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _ApprovalIssue;

  factory ApprovalIssue.fromJson(Map<String, dynamic> json) =>
      _$ApprovalIssueFromJson(json);
}

@freezed
abstract class ProcurementIssueRequest with _$ProcurementIssueRequest {
  factory ProcurementIssueRequest({
    required int id,
    required User requestedBy,
    required String title,
    required DateTime orderDate,
    DateTime? deliveryDate,
    String? paymentTerms,
    required String serialNumber,
    required bool hasFee,
    required bool requiresApproval,
    required bool isApproved,
    User? approvedBy,
    DateTime? approvedAt,
    required Supplier supplier,
    String? note,
    required List<ProcurementIssueRequestItem> items,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _ProcurementIssueRequest;

  factory ProcurementIssueRequest.fromJson(Map<String, dynamic> json) =>
      _$ProcurementIssueRequestFromJson(json);

  factory ProcurementIssueRequest.empty() => ProcurementIssueRequest(
    id: 0,
    requestedBy: User.dummy(),
    title: 'title',
    orderDate: DateTime.now(),
    serialNumber: 'serialNumber',
    hasFee: true,
    requiresApproval: true,
    isApproved: true,
    supplier: Supplier.dummy(),
    items: List.filled(3, ProcurementIssueRequestItem.empty()),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}
