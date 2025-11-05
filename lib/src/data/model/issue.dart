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

@freezed
abstract class Issue with _$Issue {
  factory Issue({
    required int id,
    required String content,
    required IssueCategory category,
    required IssueDetails details,
    required List<IssueAttachment> attachments,
    required User user,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime? deletedAt,
  }) = _Issue;

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  factory Issue.dummy() => Issue(
        id: 0,
        content: List.filled(5000, 'x').join(),
        category: IssueCategory.dummy(),
        details: IssueDetails.empty(),
        attachments: [],
        user: User.dummy(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
      );
}

@freezed
abstract class IssueCategory with _$IssueCategory {
  factory IssueCategory({
    required int id,
    required String name,
    required IssueCategoryCharge charge,
  }) = _IssueCategory;

  factory IssueCategory.fromJson(Map<String, dynamic> json) =>
      _$IssueCategoryFromJson(json);

  factory IssueCategory.dummy() =>
      IssueCategory(id: 0, name: '카테고리', charge: IssueCategoryCharge.dummy());
}

@freezed
abstract class IssueCategoryCharge with _$IssueCategoryCharge {
  factory IssueCategoryCharge({
    required int id,
    required String name,
  }) = _IssueCategoryCharge;

  factory IssueCategoryCharge.fromJson(Map<String, dynamic> json) =>
      _$IssueCategoryChargeFromJson(json);

  factory IssueCategoryCharge.dummy() => IssueCategoryCharge(id: 0, name: '책임');
}

@freezed
abstract class IssueAttachment with _$IssueAttachment {
  factory IssueAttachment({
    required int id,
    required String name,
    required int size,
    required String url,
    required DateTime createdAt,
  }) = _IssueAttachment;

  factory IssueAttachment.fromJson(Map<String, dynamic> json) =>
      _$IssueAttachmentFromJson(json);
}

@Freezed(unionKey: 'type')
sealed class IssueDetails with _$IssueDetails {
  factory IssueDetails.empty() = IssueEmptyDetails;
  factory IssueDetails.contract({
    required int id,
    required List<ContractItem> items,
  }) = IssueContractDetails;
  factory IssueDetails.kickoff({
    required int id,
    required DateTime kickoffDate,
  }) = IssueKickoffDetails;
  factory IssueDetails.approval({required int id}) = ApprovalDetails;
  factory IssueDetails.procurement({
    required int id,
    required List<ProcurementItem> items,
  }) = IssueProcurementDetails;
  factory IssueDetails.transaction({
    required int id,
    required List<TransactionItem> items,
  }) = IssueTransactionDetails;
  factory IssueDetails.declaration({required int id}) = IssueDeclarationDetails;
  factory IssueDetails.payment({required int id}) = IssuePaymentDetails;

  factory IssueDetails.fromJson(Map<String, dynamic> json) =>
      _$IssueDetailsFromJson(json);
}

@freezed
abstract class ContractItem with _$ContractItem {
  factory ContractItem({
    int? id,
    required String item,
    Currency? currency,
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
    Currency? currency,
    required String price,
    required String note,
  }) = _TransactionItem;

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  factory TransactionItem.empty() =>
      TransactionItem(category: null, price: '', note: '');
}
