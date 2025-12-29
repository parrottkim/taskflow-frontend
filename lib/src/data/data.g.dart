// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bookmark _$BookmarkFromJson(Map<String, dynamic> json) => _Bookmark(
      userId: (json['userId'] as num).toInt(),
      projectId: (json['projectId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$BookmarkToJson(_Bookmark instance) => <String, dynamic>{
      'userId': instance.userId,
      'projectId': instance.projectId,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_Currency _$CurrencyFromJson(Map<String, dynamic> json) => _Currency(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      symbol: json['symbol'] as String,
    );

Map<String, dynamic> _$CurrencyToJson(_Currency instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'symbol': instance.symbol,
    };

_LatestIssue _$LatestIssueFromJson(Map<String, dynamic> json) => _LatestIssue(
      id: (json['id'] as num).toInt(),
      projectId: (json['projectId'] as num).toInt(),
      projectCode: json['projectCode'] as String,
      projectName: json['projectName'] as String,
      category:
          IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
      clients: (json['clients'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$LatestIssueToJson(_LatestIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'projectCode': instance.projectCode,
      'projectName': instance.projectName,
      'category': instance.category,
      'clients': instance.clients,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
    };

IssueKickoff _$IssueKickoffFromJson(Map<String, dynamic> json) => IssueKickoff(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$IssueKickoffToJson(IssueKickoff instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.$type,
    };

IssueContract _$IssueContractFromJson(Map<String, dynamic> json) =>
    IssueContract(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$IssueContractToJson(IssueContract instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.$type,
    };

IssueTransaction _$IssueTransactionFromJson(Map<String, dynamic> json) =>
    IssueTransaction(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$IssueTransactionToJson(IssueTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.$type,
    };

IssuePayment _$IssuePaymentFromJson(Map<String, dynamic> json) => IssuePayment(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$IssuePaymentToJson(IssuePayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.$type,
    };

IssueDeclaration _$IssueDeclarationFromJson(Map<String, dynamic> json) =>
    IssueDeclaration(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$IssueDeclarationToJson(IssueDeclaration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.$type,
    };

IssueProcurement _$IssueProcurementFromJson(Map<String, dynamic> json) =>
    IssueProcurement(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$IssueProcurementToJson(IssueProcurement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.$type,
    };

_Issue _$IssueFromJson(Map<String, dynamic> json) => _Issue(
      id: (json['id'] as num).toInt(),
      category:
          IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      contractItems: (json['contractItems'] as List<dynamic>?)
              ?.map((e) => ContractItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      transactionItems: (json['transactionItems'] as List<dynamic>?)
              ?.map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      procurementItems: (json['procurementItems'] as List<dynamic>?)
              ?.map((e) => ProcurementItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      kickoffDate: json['kickoffDate'] == null
          ? null
          : DateTime.parse(json['kickoffDate'] as String),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$IssueToJson(_Issue instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'user': instance.user,
      'content': instance.content,
      'attachments': instance.attachments,
      'contractItems': instance.contractItems,
      'transactionItems': instance.transactionItems,
      'procurementItems': instance.procurementItems,
      'kickoffDate': instance.kickoffDate?.toIso8601String(),
      'currency': instance.currency,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_IssueAttachment _$IssueAttachmentFromJson(Map<String, dynamic> json) =>
    _IssueAttachment(
      id: (json['id'] as num).toInt(),
      filename: json['filename'] as String,
      size: (json['size'] as num).toInt(),
      path: json['path'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$IssueAttachmentToJson(_IssueAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'size': instance.size,
      'path': instance.path,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_ContractItem _$ContractItemFromJson(Map<String, dynamic> json) =>
    _ContractItem(
      id: (json['id'] as num?)?.toInt(),
      item: json['item'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$ContractItemToJson(_ContractItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'price': instance.price,
    };

_ProcurementItem _$ProcurementItemFromJson(Map<String, dynamic> json) =>
    _ProcurementItem(
      id: (json['id'] as num?)?.toInt(),
      item: json['item'] as String,
      spec: json['spec'] as String,
      quantity: json['quantity'] as String,
      unitPrice: json['unitPrice'] as String,
      totalAmount: json['totalAmount'] as String,
      isOnlinePurchase: json['isOnlinePurchase'] as bool? ?? false,
      purchaseUrl: json['purchaseUrl'] as String?,
      supplier: json['supplier'] == null
          ? null
          : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProcurementItemToJson(_ProcurementItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'spec': instance.spec,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalAmount': instance.totalAmount,
      'isOnlinePurchase': instance.isOnlinePurchase,
      'purchaseUrl': instance.purchaseUrl,
      'supplier': instance.supplier,
    };

_TransactionItemCategory _$TransactionItemCategoryFromJson(
        Map<String, dynamic> json) =>
    _TransactionItemCategory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$TransactionItemCategoryToJson(
        _TransactionItemCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) =>
    _TransactionItem(
      id: (json['id'] as num?)?.toInt(),
      category: json['category'] == null
          ? null
          : TransactionItemCategory.fromJson(
              json['category'] as Map<String, dynamic>),
      price: json['price'] as String,
      ratio: json['ratio'] as String,
      isPaid: json['isPaid'] as bool? ?? false,
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$TransactionItemToJson(_TransactionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'price': instance.price,
      'ratio': instance.ratio,
      'isPaid': instance.isPaid,
      'paidAt': instance.paidAt?.toIso8601String(),
      'note': instance.note,
    };

_ContractIssue _$ContractIssueFromJson(Map<String, dynamic> json) =>
    _ContractIssue(
      id: (json['id'] as num).toInt(),
      category:
          IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$ContractIssueToJson(_ContractIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'user': instance.user,
      'content': instance.content,
      'currency': instance.currency,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_KickoffIssue _$KickoffIssueFromJson(Map<String, dynamic> json) =>
    _KickoffIssue(
      id: (json['id'] as num).toInt(),
      category:
          IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      kickoffDate: DateTime.parse(json['kickoffDate'] as String),
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$KickoffIssueToJson(_KickoffIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'user': instance.user,
      'content': instance.content,
      'kickoffDate': instance.kickoffDate.toIso8601String(),
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_ProcurementIssue _$ProcurementIssueFromJson(Map<String, dynamic> json) =>
    _ProcurementIssue(
      id: (json['id'] as num).toInt(),
      category:
          IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      procurementItems: (json['procurementItems'] as List<dynamic>?)
              ?.map((e) => ProcurementItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$ProcurementIssueToJson(_ProcurementIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'user': instance.user,
      'content': instance.content,
      'procurementItems': instance.procurementItems,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_TransactionIssue _$TransactionIssueFromJson(Map<String, dynamic> json) =>
    _TransactionIssue(
      id: (json['id'] as num).toInt(),
      category:
          IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$TransactionIssueToJson(_TransactionIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'user': instance.user,
      'content': instance.content,
      'currency': instance.currency,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_PaymentIssue _$PaymentIssueFromJson(Map<String, dynamic> json) =>
    _PaymentIssue(
      id: (json['id'] as num).toInt(),
      category:
          IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$PaymentIssueToJson(_PaymentIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'user': instance.user,
      'content': instance.content,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_DeclarationIssue _$DeclarationIssueFromJson(Map<String, dynamic> json) =>
    _DeclarationIssue(
      id: (json['id'] as num).toInt(),
      category:
          IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$DeclarationIssueToJson(_DeclarationIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'user': instance.user,
      'content': instance.content,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      views: (json['views'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      manager: json['manager'] == null
          ? null
          : User.fromJson(json['manager'] as Map<String, dynamic>),
      latestCategory: json['latestCategory'] == null
          ? null
          : IssueCategory.fromJson(
              json['latestCategory'] as Map<String, dynamic>),
      isPreexecuted: json['isPreexecuted'] as bool,
      isContracted: json['isContracted'] as bool,
      isClosed: json['isClosed'] as bool,
      closureMessage: json['closureMessage'] as String?,
      isBookmarked: json['isBookmarked'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      clients: (json['clients'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'views': instance.views,
      'user': instance.user,
      'manager': instance.manager,
      'latestCategory': instance.latestCategory,
      'isPreexecuted': instance.isPreexecuted,
      'isContracted': instance.isContracted,
      'isClosed': instance.isClosed,
      'closureMessage': instance.closureMessage,
      'isBookmarked': instance.isBookmarked,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'clients': instance.clients,
    };

_ProjectSummary _$ProjectSummaryFromJson(Map<String, dynamic> json) =>
    _ProjectSummary(
      total: (json['total'] as num).toInt(),
      closed: (json['closed'] as num).toInt(),
      kickedOff: (json['kickedOff'] as num).toInt(),
      active: (json['active'] as num).toInt(),
    );

Map<String, dynamic> _$ProjectSummaryToJson(_ProjectSummary instance) =>
    <String, dynamic>{
      'total': instance.total,
      'closed': instance.closed,
      'kickedOff': instance.kickedOff,
      'active': instance.active,
    };

_Client _$ClientFromJson(Map<String, dynamic> json) => _Client(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ClientToJson(_Client instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_ClientGroup _$ClientGroupFromJson(Map<String, dynamic> json) => _ClientGroup(
      depth: (json['depth'] as num).toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClientGroupToJson(_ClientGroup instance) =>
    <String, dynamic>{
      'depth': instance.depth,
      'parentId': instance.parentId,
      'items': instance.items,
    };

_ProjectStats _$ProjectStatsFromJson(Map<String, dynamic> json) =>
    _ProjectStats(
      valid: (json['valid'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectStatsToJson(_ProjectStats instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'total': instance.total,
      'user': instance.user,
    };

_ProjectItemCount _$ProjectItemCountFromJson(Map<String, dynamic> json) =>
    _ProjectItemCount(
      contracts: (json['contracts'] as num?)?.toInt() ?? 0,
      declarations: (json['declarations'] as num?)?.toInt() ?? 0,
      procurements: (json['procurements'] as num?)?.toInt() ?? 0,
      reports: (json['reports'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProjectItemCountToJson(_ProjectItemCount instance) =>
    <String, dynamic>{
      'contracts': instance.contracts,
      'declarations': instance.declarations,
      'procurements': instance.procurements,
      'reports': instance.reports,
    };

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    _RegisterRequest(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(_RegisterRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };

_ForgotPasswordRequest _$ForgotPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    _ForgotPasswordRequest(
      email: json['email'] as String,
    );

Map<String, dynamic> _$ForgotPasswordRequestToJson(
        _ForgotPasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

_ResetPasswordRequest _$ResetPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    _ResetPasswordRequest(
      token: json['token'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ResetPasswordRequestToJson(
        _ResetPasswordRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'newPassword': instance.newPassword,
    };

_CreateProjectRequest _$CreateProjectRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateProjectRequest(
      managerId: (json['managerId'] as num?)?.toInt(),
      clientId: (json['clientId'] as num?)?.toInt(),
      projectCode: json['projectCode'] as String?,
      projectName: json['projectName'] as String?,
      isPreexecuted: json['isPreexecuted'] as bool?,
    );

Map<String, dynamic> _$CreateProjectRequestToJson(
        _CreateProjectRequest instance) =>
    <String, dynamic>{
      'managerId': instance.managerId,
      'clientId': instance.clientId,
      'projectCode': instance.projectCode,
      'projectName': instance.projectName,
      'isPreexecuted': instance.isPreexecuted,
    };

_UpdateProjectRequest _$UpdateProjectRequestFromJson(
        Map<String, dynamic> json) =>
    _UpdateProjectRequest(
      managerId: (json['managerId'] as num?)?.toInt(),
      clientId: (json['clientId'] as num?)?.toInt(),
      projectCode: json['projectCode'] as String?,
      projectName: json['projectName'] as String?,
      isPreexecuted: json['isPreexecuted'] as bool?,
      isClosed: json['isClosed'] as bool?,
      closureMessage: json['closureMessage'] as String?,
    );

Map<String, dynamic> _$UpdateProjectRequestToJson(
        _UpdateProjectRequest instance) =>
    <String, dynamic>{
      'managerId': instance.managerId,
      'clientId': instance.clientId,
      'projectCode': instance.projectCode,
      'projectName': instance.projectName,
      'isPreexecuted': instance.isPreexecuted,
      'isClosed': instance.isClosed,
      'closureMessage': instance.closureMessage,
    };

_CreateIssueRequest _$CreateIssueRequestFromJson(Map<String, dynamic> json) =>
    _CreateIssueRequest(
      projectId: (json['projectId'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      content: json['content'] as String?,
      currencyId: (json['currencyId'] as num?)?.toInt(),
      kickoffDate: json['kickoffDate'] == null
          ? null
          : DateTime.parse(json['kickoffDate'] as String),
      contractItems: (json['contractItems'] as List<dynamic>?)
          ?.map((e) =>
              CreateContractItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      procurementItems: (json['procurementItems'] as List<dynamic>?)
          ?.map((e) =>
              CreateProcurementItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactionItems: (json['transactionItems'] as List<dynamic>?)
          ?.map((e) =>
              CreateTransactionItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateIssueRequestToJson(_CreateIssueRequest instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'categoryId': instance.categoryId,
      'content': instance.content,
      'currencyId': instance.currencyId,
      'kickoffDate': instance.kickoffDate?.toIso8601String(),
      'contractItems': instance.contractItems,
      'procurementItems': instance.procurementItems,
      'transactionItems': instance.transactionItems,
    };

_UpdateIssueRequest _$UpdateIssueRequestFromJson(Map<String, dynamic> json) =>
    _UpdateIssueRequest(
      projectId: (json['projectId'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      content: json['content'] as String?,
      currencyId: (json['currencyId'] as num?)?.toInt(),
      kickoffDate: json['kickoffDate'] == null
          ? null
          : DateTime.parse(json['kickoffDate'] as String),
      contractItems: (json['contractItems'] as List<dynamic>?)
          ?.map((e) =>
              UpdateContractItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      procurementItems: (json['procurementItems'] as List<dynamic>?)
          ?.map((e) =>
              UpdateProcurementItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactionItems: (json['transactionItems'] as List<dynamic>?)
          ?.map((e) =>
              UpdateTransactionItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateIssueRequestToJson(_UpdateIssueRequest instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'categoryId': instance.categoryId,
      'content': instance.content,
      'currencyId': instance.currencyId,
      'kickoffDate': instance.kickoffDate?.toIso8601String(),
      'contractItems': instance.contractItems,
      'procurementItems': instance.procurementItems,
      'transactionItems': instance.transactionItems,
    };

_CreateContractItemRequest _$CreateContractItemRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateContractItemRequest(
      item: json['item'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$CreateContractItemRequestToJson(
        _CreateContractItemRequest instance) =>
    <String, dynamic>{
      'item': instance.item,
      'price': instance.price,
    };

_CreateProcurementItemRequest _$CreateProcurementItemRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateProcurementItemRequest(
      item: json['item'] as String,
      spec: json['spec'] as String,
      quantity: json['quantity'] as String,
      unitPrice: json['unitPrice'] as String,
      totalAmount: json['totalAmount'] as String,
      isOnlinePurchase: json['isOnlinePurchase'] as bool? ?? false,
      purchaseUrl: json['purchaseUrl'] as String?,
      supplierId: (json['supplierId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateProcurementItemRequestToJson(
        _CreateProcurementItemRequest instance) =>
    <String, dynamic>{
      'item': instance.item,
      'spec': instance.spec,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalAmount': instance.totalAmount,
      'isOnlinePurchase': instance.isOnlinePurchase,
      'purchaseUrl': instance.purchaseUrl,
      'supplierId': instance.supplierId,
    };

_CreateTransactionItemRequest _$CreateTransactionItemRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateTransactionItemRequest(
      categoryId: (json['categoryId'] as num).toInt(),
      price: json['price'] as String,
      ratio: json['ratio'] as String,
      isPaid: json['isPaid'] as bool?,
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$CreateTransactionItemRequestToJson(
        _CreateTransactionItemRequest instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'price': instance.price,
      'ratio': instance.ratio,
      'isPaid': instance.isPaid,
      'paidAt': instance.paidAt?.toIso8601String(),
      'note': instance.note,
    };

_UpdateContractItemRequest _$UpdateContractItemRequestFromJson(
        Map<String, dynamic> json) =>
    _UpdateContractItemRequest(
      id: (json['id'] as num?)?.toInt(),
      item: json['item'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$UpdateContractItemRequestToJson(
        _UpdateContractItemRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'price': instance.price,
    };

_UpdateProcurementItemRequest _$UpdateProcurementItemRequestFromJson(
        Map<String, dynamic> json) =>
    _UpdateProcurementItemRequest(
      id: (json['id'] as num?)?.toInt(),
      item: json['item'] as String,
      spec: json['spec'] as String,
      quantity: json['quantity'] as String,
      unitPrice: json['unitPrice'] as String,
      totalAmount: json['totalAmount'] as String,
      isOnlinePurchase: json['isOnlinePurchase'] as bool? ?? false,
      purchaseUrl: json['purchaseUrl'] as String?,
      supplierId: (json['supplierId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdateProcurementItemRequestToJson(
        _UpdateProcurementItemRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'spec': instance.spec,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalAmount': instance.totalAmount,
      'isOnlinePurchase': instance.isOnlinePurchase,
      'purchaseUrl': instance.purchaseUrl,
      'supplierId': instance.supplierId,
    };

_UpdateTransactionItemRequest _$UpdateTransactionItemRequestFromJson(
        Map<String, dynamic> json) =>
    _UpdateTransactionItemRequest(
      id: (json['id'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      price: json['price'] as String,
      ratio: json['ratio'] as String,
      isPaid: json['isPaid'] as bool?,
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$UpdateTransactionItemRequestToJson(
        _UpdateTransactionItemRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'price': instance.price,
      'ratio': instance.ratio,
      'isPaid': instance.isPaid,
      'paidAt': instance.paidAt?.toIso8601String(),
      'note': instance.note,
    };

_SupplierRequest _$SupplierRequestFromJson(Map<String, dynamic> json) =>
    _SupplierRequest(
      businessNumber: json['businessNumber'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      favicon: json['favicon'] as String?,
    );

Map<String, dynamic> _$SupplierRequestToJson(_SupplierRequest instance) =>
    <String, dynamic>{
      'businessNumber': instance.businessNumber,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'favicon': instance.favicon,
    };

_CreateScheduleRequest _$CreateScheduleRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateScheduleRequest(
      summary: json['summary'] as String,
      description: json['description'] as String?,
      url: json['url'] as String,
      projectId: (json['projectId'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$CreateScheduleRequestToJson(
        _CreateScheduleRequest instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'description': instance.description,
      'url': instance.url,
      'projectId': instance.projectId,
      'categoryId': instance.categoryId,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };

_CreateReportRequest _$CreateReportRequestFromJson(Map<String, dynamic> json) =>
    _CreateReportRequest(
      scheduleId: (json['scheduleId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num).toInt(),
      content: json['content'] as String,
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => ReportAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      trip: json['trip'] == null
          ? null
          : CreateTripReportRequest.fromJson(
              json['trip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateReportRequestToJson(
        _CreateReportRequest instance) =>
    <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'projectId': instance.projectId,
      'content': instance.content,
      'attachments': instance.attachments,
      'trip': instance.trip,
    };

_CreateTripReportRequest _$CreateTripReportRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateTripReportRequest(
      expenses: (json['expenses'] as List<dynamic>)
          .map((e) =>
              CreateActualExpenseRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      rates: (json['rates'] as List<dynamic>)
          .map((e) =>
              CreateRegulationRateRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      fuel: json['fuel'] == null
          ? null
          : CreateFuelExpenseRequest.fromJson(
              json['fuel'] as Map<String, dynamic>),
      isDeducted: json['isDeducted'] as bool?,
    );

Map<String, dynamic> _$CreateTripReportRequestToJson(
        _CreateTripReportRequest instance) =>
    <String, dynamic>{
      'expenses': instance.expenses,
      'rates': instance.rates,
      'fuel': instance.fuel,
      'isDeducted': instance.isDeducted,
    };

_CreateFuelExpenseRequest _$CreateFuelExpenseRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateFuelExpenseRequest(
      rate: json['rate'] as String,
      mileage: json['mileage'] as String,
      distance: json['distance'] as String,
    );

Map<String, dynamic> _$CreateFuelExpenseRequestToJson(
        _CreateFuelExpenseRequest instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'mileage': instance.mileage,
      'distance': instance.distance,
    };

_CreateActualExpenseRequest _$CreateActualExpenseRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateActualExpenseRequest(
      stepId: (json['stepId'] as num).toInt(),
      price: json['price'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$CreateActualExpenseRequestToJson(
        _CreateActualExpenseRequest instance) =>
    <String, dynamic>{
      'stepId': instance.stepId,
      'price': instance.price,
      'details': instance.details,
    };

_CreateRegulationRateRequest _$CreateRegulationRateRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateRegulationRateRequest(
      stepId: (json['stepId'] as num).toInt(),
      days: json['days'] as String,
      rate: json['rate'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$CreateRegulationRateRequestToJson(
        _CreateRegulationRateRequest instance) =>
    <String, dynamic>{
      'stepId': instance.stepId,
      'days': instance.days,
      'rate': instance.rate,
      'details': instance.details,
    };

_UpdateReportRequest _$UpdateReportRequestFromJson(Map<String, dynamic> json) =>
    _UpdateReportRequest(
      scheduleId: (json['scheduleId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num).toInt(),
      content: json['content'] as String,
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => ReportAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      trip: json['trip'] == null
          ? null
          : UpdateTripReportRequest.fromJson(
              json['trip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateReportRequestToJson(
        _UpdateReportRequest instance) =>
    <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'projectId': instance.projectId,
      'content': instance.content,
      'attachments': instance.attachments,
      'trip': instance.trip,
    };

_UpdateTripReportRequest _$UpdateTripReportRequestFromJson(
        Map<String, dynamic> json) =>
    _UpdateTripReportRequest(
      expenses: (json['expenses'] as List<dynamic>?)
          ?.map((e) =>
              UpdateActualExpenseRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      rates: (json['rates'] as List<dynamic>?)
          ?.map((e) =>
              UpdateRegulationRateRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      fuel: json['fuel'] == null
          ? null
          : UpdateFuelExpenseRequest.fromJson(
              json['fuel'] as Map<String, dynamic>),
      isDeducted: json['isDeducted'] as bool?,
    );

Map<String, dynamic> _$UpdateTripReportRequestToJson(
        _UpdateTripReportRequest instance) =>
    <String, dynamic>{
      'expenses': instance.expenses,
      'rates': instance.rates,
      'fuel': instance.fuel,
      'isDeducted': instance.isDeducted,
    };

_UpdateFuelExpenseRequest _$UpdateFuelExpenseRequestFromJson(
        Map<String, dynamic> json) =>
    _UpdateFuelExpenseRequest(
      id: (json['id'] as num?)?.toInt(),
      rate: json['rate'] as String?,
      mileage: json['mileage'] as String?,
      distance: json['distance'] as String?,
    );

Map<String, dynamic> _$UpdateFuelExpenseRequestToJson(
        _UpdateFuelExpenseRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'mileage': instance.mileage,
      'distance': instance.distance,
    };

_UpdateActualExpenseRequest _$UpdateActualExpenseRequestFromJson(
        Map<String, dynamic> json) =>
    _UpdateActualExpenseRequest(
      id: (json['id'] as num?)?.toInt(),
      stepId: (json['stepId'] as num).toInt(),
      price: json['price'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$UpdateActualExpenseRequestToJson(
        _UpdateActualExpenseRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stepId': instance.stepId,
      'price': instance.price,
      'details': instance.details,
    };

_UpdateRegulationRateRequest _$UpdateRegulationRateRequestFromJson(
        Map<String, dynamic> json) =>
    _UpdateRegulationRateRequest(
      id: (json['id'] as num?)?.toInt(),
      stepId: (json['stepId'] as num).toInt(),
      days: json['days'] as String,
      rate: json['rate'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$UpdateRegulationRateRequestToJson(
        _UpdateRegulationRateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stepId': instance.stepId,
      'days': instance.days,
      'rate': instance.rate,
      'details': instance.details,
    };

_Result<T> _$ResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _Result<T>(
      items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList() ??
          const [],
      page: (json['page'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
      hasNext: json['hasNext'] as bool? ?? false,
      hasPrevious: json['hasPrevious'] as bool? ?? false,
    );

Map<String, dynamic> _$ResultToJson<T>(
  _Result<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items.map(toJsonT).toList(),
      'page': instance.page,
      'total': instance.total,
      'hasNext': instance.hasNext,
      'hasPrevious': instance.hasPrevious,
    };

_File _$FileFromJson(Map<String, dynamic> json) => _File(
      path: json['path'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$FileToJson(_File instance) => <String, dynamic>{
      'path': instance.path,
      'url': instance.url,
    };

ScheduleDomestic _$ScheduleDomesticFromJson(Map<String, dynamic> json) =>
    ScheduleDomestic(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      color: json['color'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ScheduleDomesticToJson(ScheduleDomestic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'type': instance.$type,
    };

ScheduleOverseas _$ScheduleOverseasFromJson(Map<String, dynamic> json) =>
    ScheduleOverseas(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      color: json['color'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ScheduleOverseasToJson(ScheduleOverseas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'type': instance.$type,
    };

ScheduleCenter _$ScheduleCenterFromJson(Map<String, dynamic> json) =>
    ScheduleCenter(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      color: json['color'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ScheduleCenterToJson(ScheduleCenter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'type': instance.$type,
    };

ScheduleRemote _$ScheduleRemoteFromJson(Map<String, dynamic> json) =>
    ScheduleRemote(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      color: json['color'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ScheduleRemoteToJson(ScheduleRemote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'type': instance.$type,
    };

ScheduleConference _$ScheduleConferenceFromJson(Map<String, dynamic> json) =>
    ScheduleConference(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      color: json['color'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ScheduleConferenceToJson(ScheduleConference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'type': instance.$type,
    };

_ScheduleGroup _$ScheduleGroupFromJson(Map<String, dynamic> json) =>
    _ScheduleGroup(
      date: DateTime.parse(json['date'] as String),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ScheduleGroupToJson(_ScheduleGroup instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'items': instance.items,
    };

_Schedule _$ScheduleFromJson(Map<String, dynamic> json) => _Schedule(
      id: (json['id'] as num).toInt(),
      projectId: (json['projectId'] as num).toInt(),
      projectCode: json['projectCode'] as String,
      projectName: json['projectName'] as String,
      projectClientId: (json['projectClientId'] as num).toInt(),
      projectClientName: json['projectClientName'] as String,
      eventId: json['eventId'] as String,
      category:
          ScheduleCategory.fromJson(json['category'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      summary: json['summary'] as String? ?? '',
      description: json['description'] as String?,
      url: json['url'] as String? ?? '',
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$ScheduleToJson(_Schedule instance) => <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'projectCode': instance.projectCode,
      'projectName': instance.projectName,
      'projectClientId': instance.projectClientId,
      'projectClientName': instance.projectClientName,
      'eventId': instance.eventId,
      'category': instance.category,
      'user': instance.user,
      'summary': instance.summary,
      'description': instance.description,
      'url': instance.url,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };

_TodaySchedule _$TodayScheduleFromJson(Map<String, dynamic> json) =>
    _TodaySchedule(
      summary: json['summary'] as String,
      category:
          ScheduleCategory.fromJson(json['category'] as Map<String, dynamic>),
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      projectClientName: json['projectClientName'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TodayScheduleToJson(_TodaySchedule instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'category': instance.category,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'projectClientName': instance.projectClientName,
      'user': instance.user,
    };

_Supplier _$SupplierFromJson(Map<String, dynamic> json) => _Supplier(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      number: json['number'] as String,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$SupplierToJson(_Supplier instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'logo': instance.logo,
    };

_SupplierKeyword _$SupplierKeywordFromJson(Map<String, dynamic> json) =>
    _SupplierKeyword(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SupplierKeywordToJson(_SupplierKeyword instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_Token _$TokenFromJson(Map<String, dynamic> json) => _Token(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$TokenToJson(_Token instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_Report _$ReportFromJson(Map<String, dynamic> json) => _Report(
      id: (json['id'] as num).toInt(),
      schedule: json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      trip: json['trip'] == null
          ? null
          : TripReport.fromJson(json['trip'] as Map<String, dynamic>),
      content: json['content'] as String,
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => ReportAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$ReportToJson(_Report instance) => <String, dynamic>{
      'id': instance.id,
      'schedule': instance.schedule,
      'user': instance.user,
      'trip': instance.trip,
      'content': instance.content,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_ReportAttachment _$ReportAttachmentFromJson(Map<String, dynamic> json) =>
    _ReportAttachment(
      id: (json['id'] as num).toInt(),
      filename: json['filename'] as String,
      size: (json['size'] as num).toInt(),
      path: json['path'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ReportAttachmentToJson(_ReportAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'size': instance.size,
      'path': instance.path,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_TripReport _$TripReportFromJson(Map<String, dynamic> json) => _TripReport(
      expenses: (json['expenses'] as List<dynamic>)
          .map((e) => TripActualExpense.fromJson(e as Map<String, dynamic>))
          .toList(),
      rates: (json['rates'] as List<dynamic>)
          .map((e) => TripRegulationRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      fuel: json['fuel'] == null
          ? null
          : TripFuelExpense.fromJson(json['fuel'] as Map<String, dynamic>),
      isDeducted: json['isDeducted'] as bool? ?? false,
    );

Map<String, dynamic> _$TripReportToJson(_TripReport instance) =>
    <String, dynamic>{
      'expenses': instance.expenses,
      'rates': instance.rates,
      'fuel': instance.fuel,
      'isDeducted': instance.isDeducted,
    };

_TripCategory _$TripCategoryFromJson(Map<String, dynamic> json) =>
    _TripCategory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TripCategoryToJson(_TripCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_TripStep _$TripStepFromJson(Map<String, dynamic> json) => _TripStep(
      id: (json['id'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TripStepToJson(_TripStep instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
    };

_TripActualExpense _$TripActualExpenseFromJson(Map<String, dynamic> json) =>
    _TripActualExpense(
      id: (json['id'] as num?)?.toInt(),
      stepId: (json['stepId'] as num).toInt(),
      price: json['price'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$TripActualExpenseToJson(_TripActualExpense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stepId': instance.stepId,
      'price': instance.price,
      'details': instance.details,
    };

_TripRegulationRate _$TripRegulationRateFromJson(Map<String, dynamic> json) =>
    _TripRegulationRate(
      id: (json['id'] as num?)?.toInt(),
      stepId: (json['stepId'] as num).toInt(),
      days: json['days'] as String?,
      rate: json['rate'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$TripRegulationRateToJson(_TripRegulationRate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stepId': instance.stepId,
      'days': instance.days,
      'rate': instance.rate,
      'details': instance.details,
    };

_TripFuelExpense _$TripFuelExpenseFromJson(Map<String, dynamic> json) =>
    _TripFuelExpense(
      id: (json['id'] as num?)?.toInt(),
      rate: json['rate'] as String?,
      mileage: json['mileage'] as String?,
      distance: json['distance'] as String?,
    );

Map<String, dynamic> _$TripFuelExpenseToJson(_TripFuelExpense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'mileage': instance.mileage,
      'distance': instance.distance,
    };

_TripRegulation _$TripRegulationFromJson(Map<String, dynamic> json) =>
    _TripRegulation(
      id: (json['id'] as num).toInt(),
      stepId: (json['stepId'] as num).toInt(),
      rate: json['rate'] as String,
    );

Map<String, dynamic> _$TripRegulationToJson(_TripRegulation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stepId': instance.stepId,
      'rate': instance.rate,
    };

_User _$UserFromJson(Map<String, dynamic> json) => _User(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      username: json['username'] as String,
      isAdmin: json['isAdmin'] as bool? ?? false,
      isAuthorized: json['isAuthorized'] as bool? ?? false,
      position: json['position'] == null
          ? null
          : UserPosition.fromJson(json['position'] as Map<String, dynamic>),
      department: json['department'] == null
          ? null
          : UserDepartment.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'isAdmin': instance.isAdmin,
      'isAuthorized': instance.isAuthorized,
      'position': instance.position,
      'department': instance.department,
    };

_UserPosition _$UserPositionFromJson(Map<String, dynamic> json) =>
    _UserPosition(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserPositionToJson(_UserPosition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_UserDepartment _$UserDepartmentFromJson(Map<String, dynamic> json) =>
    _UserDepartment(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserDepartmentToJson(_UserDepartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_Keyword _$KeywordFromJson(Map<String, dynamic> json) => _Keyword(
      keyword: json['keyword'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$KeywordToJson(_Keyword instance) => <String, dynamic>{
      'keyword': instance.keyword,
      'date': instance.date.toIso8601String(),
    };

_ClientCount _$ClientCountFromJson(Map<String, dynamic> json) => _ClientCount(
      depth: (json['depth'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$ClientCountToJson(_ClientCount instance) =>
    <String, dynamic>{
      'depth': instance.depth,
      'count': instance.count,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _AuthService implements AuthService {
  _AuthService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Token> login({required LoginRequest login}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = login;
    final _options = _setStreamType<Token>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'auth/login',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Token _value;
    try {
      _value = Token.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<User> register({required RegisterRequest request}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<User>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'auth/register',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late User _value;
    try {
      _value = User.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Token> refresh() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Token>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'auth/refresh',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Token _value;
    try {
      _value = Token.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> forgotPassword({required ForgotPasswordRequest request}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'auth/forgot-password',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> resetPassword({required ResetPasswordRequest request}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'auth/reset-password',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _BookmarkService implements BookmarkService {
  _BookmarkService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Bookmark> addBookmark({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Bookmark>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'bookmark/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Bookmark _value;
    try {
      _value = Bookmark.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Bookmark> deleteBookmark({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Bookmark>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'bookmark/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Bookmark _value;
    try {
      _value = Bookmark.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _CurrencyService implements CurrencyService {
  _CurrencyService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<Currency>> getAllCurrencies() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<Currency>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'currency',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<Currency> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => Currency.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<String> getRate({required DateTime date}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<String>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'currency/exchange',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<String>(_options);
    late String _value;
    try {
      _value = _result.data!;
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _DashboardService implements DashboardService {
  _DashboardService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Result<ProjectStats>> getProjectStats({
    int page = 1,
    int limit = 20,
    required DateTime start,
    required DateTime end,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'start': start.toIso8601String(),
      r'end': end.toIso8601String(),
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<ProjectStats>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'dashboard/project/stats',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<ProjectStats> _value;
    try {
      _value = Result<ProjectStats>.fromJson(
        _result.data!,
        (json) => ProjectStats.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ProjectSummary> getProjectSummary({
    required DateTime start,
    required DateTime end,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'start': start.toIso8601String(),
      r'end': end.toIso8601String(),
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ProjectSummary>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'dashboard/project/summary',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ProjectSummary _value;
    try {
      _value = ProjectSummary.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<TodaySchedule>> getTodaysSchedule() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<TodaySchedule>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'dashboard/schedule/today',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<TodaySchedule> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => TodaySchedule.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _ScheduleService implements ScheduleService {
  _ScheduleService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<ScheduleCategory>> getAllCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ScheduleCategory>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'schedule/categories',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ScheduleCategory> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => ScheduleCategory.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Schedule> getSchedule({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Schedule>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'schedule/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Schedule _value;
    try {
      _value = Schedule.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<ScheduleGroup>> getSchedules({
    int? projectId,
    String? search,
    DateTime? start,
    DateTime? end,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'project_id': projectId,
      r'search': search,
      r'start': start?.toIso8601String(),
      r'end': end?.toIso8601String(),
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<ScheduleGroup>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'schedule',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<ScheduleGroup> _value;
    try {
      _value = Result<ScheduleGroup>.fromJson(
        _result.data!,
        (json) => ScheduleGroup.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Schedule> createSchedule({required ScheduleRequest request}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Schedule>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'schedule',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Schedule _value;
    try {
      _value = Schedule.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Schedule> updateSchedule({
    required int id,
    required ScheduleRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Schedule>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'schedule/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Schedule _value;
    try {
      _value = Schedule.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteSchedule({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'schedule/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _IssueService implements IssueService {
  _IssueService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<IssueCategory>> getAllCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<IssueCategory>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/categories',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<IssueCategory> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => IssueCategory.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<TransactionItemCategory>> getAllTransactionCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<TransactionItemCategory>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/transaction/categories',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<TransactionItemCategory> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                TransactionItemCategory.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<LatestIssue>> getLatestIssues({
    int page = 1,
    int limit = 20,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'limit': limit};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<LatestIssue>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/latest',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<LatestIssue> _value;
    try {
      _value = Result<LatestIssue>.fromJson(
        _result.data!,
        (json) => LatestIssue.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ContractItem>> getContractItems({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ContractItem>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/contract/item/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ContractItem> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ContractItem.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<TransactionItem>> getTransactionItems({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<TransactionItem>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/transaction/item/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<TransactionItem> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => TransactionItem.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<HttpResponse<ContractIssue?>> getContractIssue({
    required int id,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<ContractIssue?>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/contract/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late ContractIssue? _value;
    try {
      _value =
          _result.data == null ? null : ContractIssue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<KickoffIssue?>> getKickoffIssue({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<KickoffIssue?>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/kickoff/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late KickoffIssue? _value;
    try {
      _value =
          _result.data == null ? null : KickoffIssue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<TransactionIssue?>> getTransactionIssue({
    required int id,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<TransactionIssue?>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/transaction/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late TransactionIssue? _value;
    try {
      _value = _result.data == null
          ? null
          : TransactionIssue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<PaymentIssue?>> getPaymentIssue({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<PaymentIssue?>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/payment/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late PaymentIssue? _value;
    try {
      _value =
          _result.data == null ? null : PaymentIssue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<DeclarationIssue>> getDeclarationIssues({
    int page = 1,
    int limit = 10,
    required int projectId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'project_id': projectId,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DeclarationIssue>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/declaration',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<DeclarationIssue> _value;
    try {
      _value = Result<DeclarationIssue>.fromJson(
        _result.data!,
        (json) => DeclarationIssue.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<ProcurementIssue>> getProcurementIssues({
    int page = 1,
    int limit = 10,
    required int projectId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'project_id': projectId,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<ProcurementIssue>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/procurement',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<ProcurementIssue> _value;
    try {
      _value = Result<ProcurementIssue>.fromJson(
        _result.data!,
        (json) => ProcurementIssue.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> getIssue({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Issue>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Issue _value;
    try {
      _value = Issue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> sendMail({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/mail/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<Issue> createIssue({required CreateIssueRequest request}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Issue _value;
    try {
      _value = Issue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> updateIssue({
    required int id,
    required UpdateIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Issue _value;
    try {
      _value = Issue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> deleteIssue({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Issue>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Issue _value;
    try {
      _value = Issue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> restoreIssue({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Issue>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/${id}/restore',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Issue _value;
    try {
      _value = Issue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<IssueAttachment>> uploadAttachments({
    required int issueId,
    required List<MultipartFile> files,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(files.map((i) => MapEntry('files', i)));
    final _options = _setStreamType<List<IssueAttachment>>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            'issue/${issueId}/attachments',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<IssueAttachment> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => IssueAttachment.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteAttachment({
    required int issueId,
    required int fileId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/${issueId}/attachments/${fileId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _ClientService implements ClientService {
  _ClientService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<ClientGroup>> getAllClients() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ClientGroup>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project-client',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ClientGroup> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ClientGroup.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ClientCount>> getAllClientCount() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ClientCount>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project-client/count',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ClientCount> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ClientCount.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<Client>> getClientRelations({
    required int id,
    bool isDescendant = true,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'is_descendant': isDescendant};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<Client>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project-client/${id}/relations',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<Client> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => Client.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _ProjectService implements ProjectService {
  _ProjectService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ProjectItemCount> getProjectItemCount({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ProjectItemCount>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project/${id}/count',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ProjectItemCount _value;
    try {
      _value = ProjectItemCount.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Project> getProjectForEdit({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Project>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project/${id}/edit',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Project _value;
    try {
      _value = Project.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Project> getProject({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Project>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Project _value;
    try {
      _value = Project.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<Project>> getProjects({
    int page = 1,
    int limit = 40,
    String? view,
    String? sort,
    String? order,
    String? search,
    String? bookmark,
    String? clients,
    String? categories,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'view': view,
      r'sort': sort,
      r'order': order,
      r'search': search,
      r'bookmark': bookmark,
      r'clients': clients,
      r'categories': categories,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<Project>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<Project> _value;
    try {
      _value = Result<Project>.fromJson(
        _result.data!,
        (json) => Project.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Project> createProject({required CreateProjectRequest request}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Project>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Project _value;
    try {
      _value = Project.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Project> updateProject({
    required int id,
    required UpdateProjectRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Project>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Project _value;
    try {
      _value = Project.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteProject({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<Project> restoreProject({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Project>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project/${id}/restore',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Project _value;
    try {
      _value = Project.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _SftpService implements SftpService {
  _SftpService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<File>> uploadInlineImage({
    required String path,
    required List<MultipartFile> files,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'path': path};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(files.map((i) => MapEntry('files', i)));
    final _options = _setStreamType<List<File>>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            'files/inline-image',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<File> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => File.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<HttpResponse<List<int>>> downloadFile({required String path}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'path': path};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<List<int>>>(
      Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
        responseType: ResponseType.bytes,
      )
          .compose(
            _dio.options,
            'files/download',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<int> _value;
    try {
      _value = _result.data!.cast<int>();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _SupplierService implements SupplierService {
  _SupplierService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Result<Supplier>> getSuppliers({
    int page = 1,
    int limit = 100,
    required String search,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'search': search,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<Supplier>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'supplier',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<Supplier> _value;
    try {
      _value = Result<Supplier>.fromJson(
        _result.data!,
        (json) => Supplier.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Supplier> createSupplier({required Supplier supplier}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = supplier;
    final _options = _setStreamType<Supplier>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'supplier',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Supplier _value;
    try {
      _value = Supplier.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _ReportService implements ReportService {
  _ReportService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<TripCategory>> getAllTripCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<TripCategory>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report/trip/categories',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<TripCategory> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => TripCategory.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<TripStep>> getAllTripSteps({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<TripStep>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report/trip/steps/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<TripStep> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => TripStep.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<TripRegulation>> getAllTripRegulations({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<TripRegulation>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report/trip/regulations/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<TripRegulation> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => TripRegulation.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<HttpResponse<List<int>>> exportTrip({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<List<int>>>(
      Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
        responseType: ResponseType.bytes,
      )
          .compose(
            _dio.options,
            'report/trip/export/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<int> _value;
    try {
      _value = _result.data!.cast<int>();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Report> getReport({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Report>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Report _value;
    try {
      _value = Report.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<Report>> getReports({
    int page = 1,
    int limit = 10,
    required int projectId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'project_id': projectId,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<Report>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<Report> _value;
    try {
      _value = Result<Report>.fromJson(
        _result.data!,
        (json) => Report.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> sendMail({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report/mail/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<Report> createReport({required CreateReportRequest request}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Report>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Report _value;
    try {
      _value = Report.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Report> updateReport({
    required int id,
    required UpdateReportRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Report>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Report _value;
    try {
      _value = Report.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteReport({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<List<ReportAttachment>> uploadAttachments({
    required int reportId,
    required List<MultipartFile> files,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(files.map((i) => MapEntry('files', i)));
    final _options = _setStreamType<List<ReportAttachment>>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            'report/${reportId}/attachments',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ReportAttachment> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => ReportAttachment.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteAttachment({
    required int reportId,
    required int fileId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report/${reportId}/attachments/${fileId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _UserService implements UserService {
  _UserService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<UserDepartment>> getAllDepartments() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<UserDepartment>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/department',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<UserDepartment> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => UserDepartment.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<UserPosition>> getAllPositions() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<UserPosition>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/position',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<UserPosition> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => UserPosition.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<User>> getAllUsers() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<User>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/all',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<User> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => User.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<User> getUser({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<User>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late User _value;
    try {
      _value = User.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<User>> getUsers({
    int page = 1,
    int limit = 20,
    int? departmentId,
    int? positionId,
    String? search,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'departmentId': departmentId,
      r'positionId': positionId,
      r'search': search,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<User>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<User> _value;
    try {
      _value = Result<User>.fromJson(
        _result.data!,
        (json) => User.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'e81ff156707f6071b8b56dc0a5301f19bc455884';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$bookmarkRepositoryHash() =>
    r'ea10bc3fb2d72a85acc1828f257ed6082207e20d';

/// See also [bookmarkRepository].
@ProviderFor(bookmarkRepository)
final bookmarkRepositoryProvider =
    AutoDisposeProvider<BookmarkRepository>.internal(
  bookmarkRepository,
  name: r'bookmarkRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookmarkRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BookmarkRepositoryRef = AutoDisposeProviderRef<BookmarkRepository>;
String _$currencyRepositoryHash() =>
    r'ca894e9ab203b794585d74f814956dc740cac4cd';

/// See also [currencyRepository].
@ProviderFor(currencyRepository)
final currencyRepositoryProvider =
    AutoDisposeProvider<CurrencyRepository>.internal(
  currencyRepository,
  name: r'currencyRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currencyRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrencyRepositoryRef = AutoDisposeProviderRef<CurrencyRepository>;
String _$dashboardRepositoryHash() =>
    r'8e60582c634eb74d3558ae420f53ef657b6fc43a';

/// See also [dashboardRepository].
@ProviderFor(dashboardRepository)
final dashboardRepositoryProvider =
    AutoDisposeProvider<DashboardRepository>.internal(
  dashboardRepository,
  name: r'dashboardRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DashboardRepositoryRef = AutoDisposeProviderRef<DashboardRepository>;
String _$scheduleRepositoryHash() =>
    r'cbbd0adadc392e36de981842db8c5b60ed3f977c';

/// See also [scheduleRepository].
@ProviderFor(scheduleRepository)
final scheduleRepositoryProvider =
    AutoDisposeProvider<ScheduleRepository>.internal(
  scheduleRepository,
  name: r'scheduleRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ScheduleRepositoryRef = AutoDisposeProviderRef<ScheduleRepository>;
String _$issueRepositoryHash() => r'e88caf1fc894b4676ef6e9458eb71c64632debac';

/// See also [issueRepository].
@ProviderFor(issueRepository)
final issueRepositoryProvider = AutoDisposeProvider<IssueRepository>.internal(
  issueRepository,
  name: r'issueRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$issueRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IssueRepositoryRef = AutoDisposeProviderRef<IssueRepository>;
String _$localRepositoryHash() => r'31a4ead89575ae1bd67ce2649f9b20387ae4b304';

/// See also [localRepository].
@ProviderFor(localRepository)
final localRepositoryProvider = AutoDisposeProvider<LocalRepository>.internal(
  localRepository,
  name: r'localRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocalRepositoryRef = AutoDisposeProviderRef<LocalRepository>;
String _$projectClientRepositoryHash() =>
    r'f7f0d5b7ddbc6d4ee6b9126a8c9cfd4d253ee720';

/// See also [projectClientRepository].
@ProviderFor(projectClientRepository)
final projectClientRepositoryProvider =
    AutoDisposeProvider<ClientRepository>.internal(
  projectClientRepository,
  name: r'projectClientRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectClientRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProjectClientRepositoryRef = AutoDisposeProviderRef<ClientRepository>;
String _$projectRepositoryHash() => r'38c84479cde03ce04d0affc1440c64a10c74f640';

/// See also [projectRepository].
@ProviderFor(projectRepository)
final projectRepositoryProvider =
    AutoDisposeProvider<ProjectRepository>.internal(
  projectRepository,
  name: r'projectRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProjectRepositoryRef = AutoDisposeProviderRef<ProjectRepository>;
String _$sftpRepositoryHash() => r'98ad3f21aae2fd7585b3407c4e4a9e702e672b2f';

/// See also [sftpRepository].
@ProviderFor(sftpRepository)
final sftpRepositoryProvider = AutoDisposeProvider<SftpRepository>.internal(
  sftpRepository,
  name: r'sftpRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sftpRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SftpRepositoryRef = AutoDisposeProviderRef<SftpRepository>;
String _$supplierRepositoryHash() =>
    r'3430dde8cd9b5d3e53cb6c70ef1edc022e199bc5';

/// See also [supplierRepository].
@ProviderFor(supplierRepository)
final supplierRepositoryProvider =
    AutoDisposeProvider<SupplierRepository>.internal(
  supplierRepository,
  name: r'supplierRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supplierRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SupplierRepositoryRef = AutoDisposeProviderRef<SupplierRepository>;
String _$reportRepositoryHash() => r'3920fb52839d3449ae8dfaa643b2ba95155ccc52';

/// See also [reportRepository].
@ProviderFor(reportRepository)
final reportRepositoryProvider = AutoDisposeProvider<ReportRepository>.internal(
  reportRepository,
  name: r'reportRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reportRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReportRepositoryRef = AutoDisposeProviderRef<ReportRepository>;
String _$userRepositoryHash() => r'76ac51c907be91a7f185aeb1aac239ed05d0f6c1';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
