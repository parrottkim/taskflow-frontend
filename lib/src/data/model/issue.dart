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
    required User user,
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
        user: User.dummy(),
        createdAt: DateTime.now(),
      );
}

@Freezed(unionKey: 'type')
abstract class IssueCategory with _$IssueCategory {
  factory IssueCategory.kickoff({
    required int id,
    required String name,
  }) = IssueKickoff;
  factory IssueCategory.contract({
    required int id,
    required String name,
  }) = IssueContract;
  factory IssueCategory.transaction({
    required int id,
    required String name,
  }) = IssueTransaction;
  factory IssueCategory.payment({
    required int id,
    required String name,
  }) = IssuePayment;
  factory IssueCategory.declaration({
    required int id,
    required String name,
  }) = IssueDeclaration;
  factory IssueCategory.procurement({
    required int id,
    required String name,
  }) = IssueProcurement;

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
    required User user,
    required String content,
    @Default([]) List<IssueAttachment> attachments,
    @Default([]) List<ContractItem> contractItems,
    @Default([]) List<TransactionItem> transactionItems,
    @Default([]) List<ProcurementItem> procurementItems,
    DateTime? kickoffDate,
    Currency? currency,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Issue;

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  factory Issue.dummy() => Issue(
        id: 0,
        content: '',
        category: IssueCategory.dummy(),
        user: User.dummy(),
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
abstract class ContractItem with _$ContractItem {
  factory ContractItem({
    int? id,
    required String item,
    required String price,
  }) = _ContractItem;

  factory ContractItem.fromJson(Map<String, dynamic> json) =>
      _$ContractItemFromJson(json);

  factory ContractItem.empty() => ContractItem(item: '', price: '');
}

@freezed
abstract class ProcurementItem with _$ProcurementItem {
  factory ProcurementItem({
    int? id,
    required String item,
    required String spec,
    required String quantity,
    required String unitPrice,
    required String totalAmount,
    @Default(false) bool isOnlinePurchase,
    String? purchaseUrl,
    Supplier? supplier,
  }) = _ProcurementItem;

  factory ProcurementItem.fromJson(Map<String, dynamic> json) =>
      _$ProcurementItemFromJson(json);

  factory ProcurementItem.empty() => ProcurementItem(
        item: '',
        spec: '',
        quantity: '',
        unitPrice: '',
        totalAmount: '',
      );
}

@freezed
abstract class TransactionItemCategory with _$TransactionItemCategory {
  factory TransactionItemCategory({
    required int id,
    required String name,
  }) = _TransactionItemCategory;

  factory TransactionItemCategory.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemCategoryFromJson(json);

  factory TransactionItemCategory.empty() =>
      TransactionItemCategory(id: 0, name: '');
}

@freezed
abstract class TransactionItem with _$TransactionItem {
  factory TransactionItem({
    int? id,
    TransactionItemCategory? category,
    required String price,
    required String ratio,
    @Default(false) bool isPaid,
    DateTime? paidAt,
    String? note,
  }) = _TransactionItem;

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  factory TransactionItem.empty() =>
      TransactionItem(category: null, price: '', ratio: '', note: '');
}

@freezed
abstract class ContractIssue with _$ContractIssue {
  factory ContractIssue({
    required int id,
    required IssueCategory category,
    required User user,
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
    required User user,
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
    required User user,
    required String content,
    @Default([]) List<ProcurementItem> procurementItems,
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
    required User user,
    required String content,
    required Currency currency,
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
    required User user,
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
abstract class DeclarationIssue with _$DeclarationIssue {
  factory DeclarationIssue({
    required int id,
    required IssueCategory category,
    required User user,
    required String content,
    @Default([]) List<IssueAttachment> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _DeclarationIssue;

  factory DeclarationIssue.fromJson(Map<String, dynamic> json) =>
      _$DeclarationIssueFromJson(json);
}
