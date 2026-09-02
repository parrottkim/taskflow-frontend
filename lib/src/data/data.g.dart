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

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  zipNo: json['zipNo'] as String? ?? '',
  roadAddr: json['roadAddr'] as String? ?? '',
  roadAddrPart1: json['roadAddrPart1'] as String? ?? '',
  emdNm: json['emdNm'] as String? ?? '',
  bdNm: json['bdNm'] as String? ?? '',
  jibunAddr: json['jibunAddr'] as String? ?? '',
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'zipNo': instance.zipNo,
  'roadAddr': instance.roadAddr,
  'roadAddrPart1': instance.roadAddrPart1,
  'emdNm': instance.emdNm,
  'bdNm': instance.bdNm,
  'jibunAddr': instance.jibunAddr,
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

_DashboardSearchItem _$DashboardSearchItemFromJson(Map<String, dynamic> json) =>
    _DashboardSearchItem(
      type: $enumDecode(_$DashboardSearchItemTypeEnumMap, json['type']),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
      projectCode: json['projectCode'] as String?,
      projectName: json['projectName'] as String?,
      folderId: (json['folderId'] as num?)?.toInt(),
      folderName: json['folderName'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      categoryType: json['categoryType'] as String?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DashboardSearchItemToJson(
  _DashboardSearchItem instance,
) => <String, dynamic>{
  'type': _$DashboardSearchItemTypeEnumMap[instance.type]!,
  'id': instance.id,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'projectId': instance.projectId,
  'projectCode': instance.projectCode,
  'projectName': instance.projectName,
  'folderId': instance.folderId,
  'folderName': instance.folderName,
  'categoryId': instance.categoryId,
  'categoryName': instance.categoryName,
  'categoryType': instance.categoryType,
  'start': instance.start?.toIso8601String(),
  'end': instance.end?.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$DashboardSearchItemTypeEnumMap = {
  DashboardSearchItemType.project: 'project',
  DashboardSearchItemType.document: 'document',
  DashboardSearchItemType.schedule: 'schedule',
  DashboardSearchItemType.issue: 'issue',
  DashboardSearchItemType.report: 'report',
};

_DashboardSearchGroup _$DashboardSearchGroupFromJson(
  Map<String, dynamic> json,
) => _DashboardSearchGroup(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => DashboardSearchItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DashboardSearchGroupToJson(
  _DashboardSearchGroup instance,
) => <String, dynamic>{'items': instance.items, 'total': instance.total};

_DashboardSearchResult _$DashboardSearchResultFromJson(
  Map<String, dynamic> json,
) => _DashboardSearchResult(
  projects: DashboardSearchGroup.fromJson(
    json['projects'] as Map<String, dynamic>,
  ),
  documents: DashboardSearchGroup.fromJson(
    json['documents'] as Map<String, dynamic>,
  ),
  schedules: DashboardSearchGroup.fromJson(
    json['schedules'] as Map<String, dynamic>,
  ),
  issues: DashboardSearchGroup.fromJson(json['issues'] as Map<String, dynamic>),
  reports: DashboardSearchGroup.fromJson(
    json['reports'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DashboardSearchResultToJson(
  _DashboardSearchResult instance,
) => <String, dynamic>{
  'projects': instance.projects,
  'documents': instance.documents,
  'schedules': instance.schedules,
  'issues': instance.issues,
  'reports': instance.reports,
};

_DocumentListItem _$DocumentListItemFromJson(Map<String, dynamic> json) =>
    _DocumentListItem(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      folderId: (json['folderId'] as num).toInt(),
      fixed: json['fixed'] as bool,
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      attachmentCount: (json['attachmentCount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$DocumentListItemToJson(_DocumentListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'folderId': instance.folderId,
      'fixed': instance.fixed,
      'createdBy': instance.createdBy,
      'attachmentCount': instance.attachmentCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_Document _$DocumentFromJson(Map<String, dynamic> json) => _Document(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  content: json['content'] as String,
  folderId: (json['folderId'] as num).toInt(),
  fixed: json['fixed'] as bool,
  views: (json['views'] as num).toInt(),
  createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
  updatedBy: json['updatedBy'] == null
      ? null
      : User.fromJson(json['updatedBy'] as Map<String, dynamic>),
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => DocumentAttachment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
);

Map<String, dynamic> _$DocumentToJson(_Document instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'folderId': instance.folderId,
  'fixed': instance.fixed,
  'views': instance.views,
  'createdBy': instance.createdBy,
  'updatedBy': instance.updatedBy,
  'attachments': instance.attachments,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
};

_DocumentFolder _$DocumentFolderFromJson(Map<String, dynamic> json) =>
    _DocumentFolder(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      parentId: (json['parentId'] as num?)?.toInt(),
      sort: (json['sort'] as num?)?.toInt() ?? 0,
      fixed: json['fixed'] as bool? ?? false,
      children:
          (json['children'] as List<dynamic>?)
              ?.map((e) => DocumentFolder.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DocumentFolder>[],
    );

Map<String, dynamic> _$DocumentFolderToJson(_DocumentFolder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'sort': instance.sort,
      'fixed': instance.fixed,
      'children': instance.children,
    };

_DocumentAttachment _$DocumentAttachmentFromJson(Map<String, dynamic> json) =>
    _DocumentAttachment(
      id: (json['id'] as num).toInt(),
      filename: json['filename'] as String,
      size: (json['size'] as num).toInt(),
      path: json['path'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$DocumentAttachmentToJson(_DocumentAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'size': instance.size,
      'path': instance.path,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_Draft _$DraftFromJson(Map<String, dynamic> json) => _Draft(
  id: json['id'] as String,
  userId: (json['userId'] as num).toInt(),
  type: $enumDecode(_$DraftFormTypeEnumMap, json['type']),
  mode: $enumDecode(_$DraftModeEnumMap, json['mode']),
  version: (json['version'] as num).toInt(),
  context: json['context'] as Map<String, dynamic>,
  payload: json['payload'] as Map<String, dynamic>,
  status:
      $enumDecodeNullable(_$DraftSyncStatusEnumMap, json['status']) ??
      DraftSyncStatus.pending,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  entityId: (json['entityId'] as num?)?.toInt(),
  revision: (json['revision'] as num?)?.toInt(),
);

Map<String, dynamic> _$DraftToJson(_Draft instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'type': _$DraftFormTypeEnumMap[instance.type]!,
  'mode': _$DraftModeEnumMap[instance.mode]!,
  'version': instance.version,
  'context': instance.context,
  'payload': instance.payload,
  'status': _$DraftSyncStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'entityId': instance.entityId,
  'revision': instance.revision,
};

const _$DraftFormTypeEnumMap = {
  DraftFormType.report: 'report',
  DraftFormType.issue: 'issue',
  DraftFormType.procurementIssue: 'procurementIssue',
  DraftFormType.document: 'document',
};

const _$DraftModeEnumMap = {DraftMode.create: 'create', DraftMode.edit: 'edit'};

const _$DraftSyncStatusEnumMap = {
  DraftSyncStatus.pending: 'pending',
  DraftSyncStatus.syncing: 'syncing',
  DraftSyncStatus.synced: 'synced',
  DraftSyncStatus.failed: 'failed',
};

_DraftAsset _$DraftAssetFromJson(Map<String, dynamic> json) => _DraftAsset(
  id: json['id'] as String,
  draftId: json['draftId'] as String,
  bytes: const BufferConverter().fromJson(
    json['bytes'] as Map<String, dynamic>,
  ),
  mime: json['mime'] as String,
  type: $enumDecode(_$DraftAssetTypeEnumMap, json['type']),
  status:
      $enumDecodeNullable(_$DraftAssetUploadStatusEnumMap, json['status']) ??
      DraftAssetUploadStatus.pending,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  fileName: json['fileName'] as String?,
  remoteUrl: json['remoteUrl'] as String?,
);

Map<String, dynamic> _$DraftAssetToJson(_DraftAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'draftId': instance.draftId,
      'bytes': const BufferConverter().toJson(instance.bytes),
      'mime': instance.mime,
      'type': _$DraftAssetTypeEnumMap[instance.type]!,
      'status': _$DraftAssetUploadStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'fileName': instance.fileName,
      'remoteUrl': instance.remoteUrl,
    };

const _$DraftAssetTypeEnumMap = {
  DraftAssetType.inlineImage: 'inlineImage',
  DraftAssetType.attachment: 'attachment',
};

const _$DraftAssetUploadStatusEnumMap = {
  DraftAssetUploadStatus.pending: 'pending',
  DraftAssetUploadStatus.uploading: 'uploading',
  DraftAssetUploadStatus.uploaded: 'uploaded',
  DraftAssetUploadStatus.failed: 'failed',
};

_IssueDraftPayload _$IssueDraftPayloadFromJson(
  Map<String, dynamic> json,
) => _IssueDraftPayload(
  category: IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
  content: json['content'] as String?,
  currency: json['currency'] == null
      ? null
      : Currency.fromJson(json['currency'] as Map<String, dynamic>),
  kickoffDate: json['kickoffDate'] == null
      ? null
      : DateTime.parse(json['kickoffDate'] as String),
  contractItems:
      (json['contractItems'] as List<dynamic>?)
          ?.map((e) => ContractIssueItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  transactionItems:
      (json['transactionItems'] as List<dynamic>?)
          ?.map((e) => TransactionIssueItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  procurementItems:
      (json['procurementItems'] as List<dynamic>?)
          ?.map((e) => ProcurementIssueItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$IssueDraftPayloadToJson(_IssueDraftPayload instance) =>
    <String, dynamic>{
      'category': instance.category,
      'content': instance.content,
      'currency': instance.currency,
      'kickoffDate': instance.kickoffDate?.toIso8601String(),
      'contractItems': instance.contractItems,
      'transactionItems': instance.transactionItems,
      'procurementItems': instance.procurementItems,
    };

_ReportDraftPayload _$ReportDraftPayloadFromJson(Map<String, dynamic> json) =>
    _ReportDraftPayload(
      trip: TripReport.fromJson(json['trip'] as Map<String, dynamic>),
      content: json['content'] as String?,
      schedule: json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportDraftPayloadToJson(_ReportDraftPayload instance) =>
    <String, dynamic>{
      'trip': instance.trip,
      'content': instance.content,
      'schedule': instance.schedule,
    };

_DocumentDraftPayload _$DocumentDraftPayloadFromJson(
  Map<String, dynamic> json,
) => _DocumentDraftPayload(
  folderId: (json['folderId'] as num?)?.toInt(),
  title: json['title'] as String?,
  content: json['content'] as String?,
  fixed: json['fixed'] as bool? ?? false,
);

Map<String, dynamic> _$DocumentDraftPayloadToJson(
  _DocumentDraftPayload instance,
) => <String, dynamic>{
  'folderId': instance.folderId,
  'title': instance.title,
  'content': instance.content,
  'fixed': instance.fixed,
};

_KoreanHoliday _$KoreanHolidayFromJson(Map<String, dynamic> json) =>
    _KoreanHoliday(
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
    );

Map<String, dynamic> _$KoreanHolidayToJson(_KoreanHoliday instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'name': instance.name,
    };

_ScheduleHoliday _$ScheduleHolidayFromJson(Map<String, dynamic> json) =>
    _ScheduleHoliday(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String?,
      isTravelOnly: json['isTravelOnly'] as bool,
      compensatoryLeaveDate: json['compensatoryLeaveDate'] == null
          ? null
          : DateTime.parse(json['compensatoryLeaveDate'] as String),
    );

Map<String, dynamic> _$ScheduleHolidayToJson(
  _ScheduleHoliday instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'date': instance.date.toIso8601String(),
  'name': instance.name,
  'isTravelOnly': instance.isTravelOnly,
  'compensatoryLeaveDate': instance.compensatoryLeaveDate?.toIso8601String(),
};

_LatestIssue _$LatestIssueFromJson(Map<String, dynamic> json) => _LatestIssue(
  id: (json['id'] as num).toInt(),
  projectId: (json['projectId'] as num).toInt(),
  projectCode: json['projectCode'] as String,
  projectName: json['projectName'] as String,
  category: IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
  clients: (json['clients'] as List<dynamic>)
      .map((e) => Client.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
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
      'createdBy': instance.createdBy,
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

IssueApproval _$IssueApprovalFromJson(Map<String, dynamic> json) =>
    IssueApproval(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$IssueApprovalToJson(IssueApproval instance) =>
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
  category: IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
  content: json['content'] as String,
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  currency: json['currency'] == null
      ? null
      : Currency.fromJson(json['currency'] as Map<String, dynamic>),
  kickoffDate: json['kickoffDate'] == null
      ? null
      : DateTime.parse(json['kickoffDate'] as String),
  contractItems:
      (json['contractItems'] as List<dynamic>?)
          ?.map((e) => ContractIssueItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  transactionItems:
      (json['transactionItems'] as List<dynamic>?)
          ?.map((e) => TransactionIssueItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  procurementItems:
      (json['procurementItems'] as List<dynamic>?)
          ?.map((e) => ProcurementIssueItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  requests:
      (json['requests'] as List<dynamic>?)
          ?.map(
            (e) => ProcurementIssueRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
  updatedBy: json['updatedBy'] == null
      ? null
      : User.fromJson(json['updatedBy'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
);

Map<String, dynamic> _$IssueToJson(_Issue instance) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'content': instance.content,
  'attachments': instance.attachments,
  'currency': instance.currency,
  'kickoffDate': instance.kickoffDate?.toIso8601String(),
  'contractItems': instance.contractItems,
  'transactionItems': instance.transactionItems,
  'procurementItems': instance.procurementItems,
  'requests': instance.requests,
  'createdBy': instance.createdBy,
  'updatedBy': instance.updatedBy,
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

_ContractIssueItem _$ContractIssueItemFromJson(Map<String, dynamic> json) =>
    _ContractIssueItem(
      id: (json['id'] as num?)?.toInt(),
      item: json['item'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$ContractIssueItemToJson(_ContractIssueItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'price': instance.price,
    };

_ProcurementIssueItem _$ProcurementIssueItemFromJson(
  Map<String, dynamic> json,
) => _ProcurementIssueItem(
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
  note: json['note'] as String?,
);

Map<String, dynamic> _$ProcurementIssueItemToJson(
  _ProcurementIssueItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'item': instance.item,
  'spec': instance.spec,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'totalAmount': instance.totalAmount,
  'isOnlinePurchase': instance.isOnlinePurchase,
  'purchaseUrl': instance.purchaseUrl,
  'supplier': instance.supplier,
  'note': instance.note,
};

_ProcurementIssueRequestItem _$ProcurementIssueRequestItemFromJson(
  Map<String, dynamic> json,
) => _ProcurementIssueRequestItem(
  id: (json['id'] as num?)?.toInt(),
  item: json['item'] as String,
  spec: json['spec'] as String,
  quantity: json['quantity'] as String,
  unitPrice: json['unitPrice'] as String,
  totalAmount: json['totalAmount'] as String,
  isOnlinePurchase: json['isOnlinePurchase'] as bool? ?? false,
  purchaseUrl: json['purchaseUrl'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$ProcurementIssueRequestItemToJson(
  _ProcurementIssueRequestItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'item': instance.item,
  'spec': instance.spec,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'totalAmount': instance.totalAmount,
  'isOnlinePurchase': instance.isOnlinePurchase,
  'purchaseUrl': instance.purchaseUrl,
  'note': instance.note,
};

_TransactionIssueItemCategory _$TransactionIssueItemCategoryFromJson(
  Map<String, dynamic> json,
) => _TransactionIssueItemCategory(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
);

Map<String, dynamic> _$TransactionIssueItemCategoryToJson(
  _TransactionIssueItemCategory instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

_TransactionIssueItem _$TransactionIssueItemFromJson(
  Map<String, dynamic> json,
) => _TransactionIssueItem(
  id: (json['id'] as num?)?.toInt(),
  category: json['category'] == null
      ? null
      : TransactionIssueItemCategory.fromJson(
          json['category'] as Map<String, dynamic>,
        ),
  price: json['price'] as String,
  ratio: json['ratio'] as String,
  isPaid: json['isPaid'] as bool? ?? false,
  paidAt: json['paidAt'] == null
      ? null
      : DateTime.parse(json['paidAt'] as String),
  note: json['note'] as String?,
);

Map<String, dynamic> _$TransactionIssueItemToJson(
  _TransactionIssueItem instance,
) => <String, dynamic>{
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
      category: IssueCategory.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      updatedBy: json['updatedBy'] == null
          ? null
          : User.fromJson(json['updatedBy'] as Map<String, dynamic>),
      content: json['content'] as String,
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      attachments:
          (json['attachments'] as List<dynamic>?)
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
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
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
      category: IssueCategory.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      updatedBy: json['updatedBy'] == null
          ? null
          : User.fromJson(json['updatedBy'] as Map<String, dynamic>),
      content: json['content'] as String,
      kickoffDate: DateTime.parse(json['kickoffDate'] as String),
      attachments:
          (json['attachments'] as List<dynamic>?)
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
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'content': instance.content,
      'kickoffDate': instance.kickoffDate.toIso8601String(),
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_ProcurementIssue _$ProcurementIssueFromJson(
  Map<String, dynamic> json,
) => _ProcurementIssue(
  id: (json['id'] as num).toInt(),
  category: IssueCategory.fromJson(json['category'] as Map<String, dynamic>),
  createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
  updatedBy: json['updatedBy'] == null
      ? null
      : User.fromJson(json['updatedBy'] as Map<String, dynamic>),
  content: json['content'] as String,
  procurementItems:
      (json['procurementItems'] as List<dynamic>?)
          ?.map((e) => ProcurementIssueItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  requests:
      (json['requests'] as List<dynamic>?)
          ?.map(
            (e) => ProcurementIssueRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  attachments:
      (json['attachments'] as List<dynamic>?)
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
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'content': instance.content,
      'procurementItems': instance.procurementItems,
      'requests': instance.requests,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_TransactionIssue _$TransactionIssueFromJson(Map<String, dynamic> json) =>
    _TransactionIssue(
      id: (json['id'] as num).toInt(),
      category: IssueCategory.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      updatedBy: json['updatedBy'] == null
          ? null
          : User.fromJson(json['updatedBy'] as Map<String, dynamic>),
      content: json['content'] as String,
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      attachments:
          (json['attachments'] as List<dynamic>?)
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
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
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
      category: IssueCategory.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      updatedBy: json['updatedBy'] == null
          ? null
          : User.fromJson(json['updatedBy'] as Map<String, dynamic>),
      content: json['content'] as String,
      attachments:
          (json['attachments'] as List<dynamic>?)
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
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'content': instance.content,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_ApprovalIssue _$ApprovalIssueFromJson(Map<String, dynamic> json) =>
    _ApprovalIssue(
      id: (json['id'] as num).toInt(),
      category: IssueCategory.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      updatedBy: json['updatedBy'] == null
          ? null
          : User.fromJson(json['updatedBy'] as Map<String, dynamic>),
      content: json['content'] as String,
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$ApprovalIssueToJson(_ApprovalIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'content': instance.content,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_ProcurementIssueRequest _$ProcurementIssueRequestFromJson(
  Map<String, dynamic> json,
) => _ProcurementIssueRequest(
  id: (json['id'] as num).toInt(),
  requestedBy: User.fromJson(json['requestedBy'] as Map<String, dynamic>),
  title: json['title'] as String,
  orderDate: DateTime.parse(json['orderDate'] as String),
  deliveryDate: json['deliveryDate'] == null
      ? null
      : DateTime.parse(json['deliveryDate'] as String),
  paymentTerms: json['paymentTerms'] as String?,
  serialNumber: json['serialNumber'] as String,
  hasFee: json['hasFee'] as bool,
  requiresApproval: json['requiresApproval'] as bool,
  isApproved: json['isApproved'] as bool,
  approvedBy: json['approvedBy'] == null
      ? null
      : User.fromJson(json['approvedBy'] as Map<String, dynamic>),
  approvedAt: json['approvedAt'] == null
      ? null
      : DateTime.parse(json['approvedAt'] as String),
  supplier: Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
  note: json['note'] as String?,
  items: (json['items'] as List<dynamic>)
      .map(
        (e) => ProcurementIssueRequestItem.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
);

Map<String, dynamic> _$ProcurementIssueRequestToJson(
  _ProcurementIssueRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'requestedBy': instance.requestedBy,
  'title': instance.title,
  'orderDate': instance.orderDate.toIso8601String(),
  'deliveryDate': instance.deliveryDate?.toIso8601String(),
  'paymentTerms': instance.paymentTerms,
  'serialNumber': instance.serialNumber,
  'hasFee': instance.hasFee,
  'requiresApproval': instance.requiresApproval,
  'isApproved': instance.isApproved,
  'approvedBy': instance.approvedBy,
  'approvedAt': instance.approvedAt?.toIso8601String(),
  'supplier': instance.supplier,
  'note': instance.note,
  'items': instance.items,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
};

_ProjectListItem _$ProjectListItemFromJson(Map<String, dynamic> json) =>
    _ProjectListItem(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      manager: json['manager'] == null
          ? null
          : User.fromJson(json['manager'] as Map<String, dynamic>),
      latestCategory: json['latestCategory'] == null
          ? null
          : IssueCategory.fromJson(
              json['latestCategory'] as Map<String, dynamic>,
            ),
      clients: (json['clients'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPreexecuted: json['isPreexecuted'] as bool,
      isContracted: json['isContracted'] as bool,
      isClosed: json['isClosed'] as bool,
      isBookmarked: json['isBookmarked'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$ProjectListItemToJson(_ProjectListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'createdBy': instance.createdBy,
      'manager': instance.manager,
      'latestCategory': instance.latestCategory,
      'clients': instance.clients,
      'isPreexecuted': instance.isPreexecuted,
      'isContracted': instance.isContracted,
      'isClosed': instance.isClosed,
      'isBookmarked': instance.isBookmarked,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  views: (json['views'] as num).toInt(),
  createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
  updatedBy: json['updatedBy'] == null
      ? null
      : User.fromJson(json['updatedBy'] as Map<String, dynamic>),
  manager: json['manager'] == null
      ? null
      : User.fromJson(json['manager'] as Map<String, dynamic>),
  latestCategory: json['latestCategory'] == null
      ? null
      : IssueCategory.fromJson(json['latestCategory'] as Map<String, dynamic>),
  clients: (json['clients'] as List<dynamic>)
      .map((e) => Client.fromJson(e as Map<String, dynamic>))
      .toList(),
  isPreexecuted: json['isPreexecuted'] as bool,
  isContracted: json['isContracted'] as bool,
  isClosed: json['isClosed'] as bool,
  closureMessage: json['closureMessage'] as String?,
  isBookmarked: json['isBookmarked'] as bool,
  isClosable: json['isClosable'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
);

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'views': instance.views,
  'createdBy': instance.createdBy,
  'updatedBy': instance.updatedBy,
  'manager': instance.manager,
  'latestCategory': instance.latestCategory,
  'clients': instance.clients,
  'isPreexecuted': instance.isPreexecuted,
  'isContracted': instance.isContracted,
  'isClosed': instance.isClosed,
  'closureMessage': instance.closureMessage,
  'isBookmarked': instance.isBookmarked,
  'isClosable': instance.isClosable,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
};

_ProjectSummary _$ProjectSummaryFromJson(Map<String, dynamic> json) =>
    _ProjectSummary(
      total: (json['total'] as num).toInt(),
      closed: (json['closed'] as num).toInt(),
      preexecuted: (json['preexecuted'] as num).toInt(),
      active: (json['active'] as num).toInt(),
    );

Map<String, dynamic> _$ProjectSummaryToJson(_ProjectSummary instance) =>
    <String, dynamic>{
      'total': instance.total,
      'closed': instance.closed,
      'preexecuted': instance.preexecuted,
      'active': instance.active,
    };

_Client _$ClientFromJson(Map<String, dynamic> json) =>
    _Client(id: (json['id'] as num).toInt(), name: json['name'] as String);

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
      approvals: (json['approvals'] as num?)?.toInt() ?? 0,
      procurements: (json['procurements'] as num?)?.toInt() ?? 0,
      reports: (json['reports'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProjectItemCountToJson(_ProjectItemCount instance) =>
    <String, dynamic>{
      'contracts': instance.contracts,
      'approvals': instance.approvals,
      'procurements': instance.procurements,
      'reports': instance.reports,
    };

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      persistLogin: json['persistLogin'] as bool?,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'persistLogin': instance.persistLogin,
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
  Map<String, dynamic> json,
) => _ForgotPasswordRequest(email: json['email'] as String);

Map<String, dynamic> _$ForgotPasswordRequestToJson(
  _ForgotPasswordRequest instance,
) => <String, dynamic>{'email': instance.email};

_ResetPasswordRequest _$ResetPasswordRequestFromJson(
  Map<String, dynamic> json,
) => _ResetPasswordRequest(
  token: json['token'] as String,
  newPassword: json['newPassword'] as String,
);

Map<String, dynamic> _$ResetPasswordRequestToJson(
  _ResetPasswordRequest instance,
) => <String, dynamic>{
  'token': instance.token,
  'newPassword': instance.newPassword,
};

_UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) =>
    _UpdateUserRequest(
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UpdateUserRequestToJson(_UpdateUserRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };

_UpdateUserPermissionRequest _$UpdateUserPermissionRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateUserPermissionRequest(
  isAdmin: json['isAdmin'] as bool?,
  isAuthorized: json['isAuthorized'] as bool?,
  isGuest: json['isGuest'] as bool?,
  rankId: (json['rankId'] as num?)?.toInt(),
  positionId: (json['positionId'] as num?)?.toInt(),
  departmentId: (json['departmentId'] as num?)?.toInt(),
);

Map<String, dynamic> _$UpdateUserPermissionRequestToJson(
  _UpdateUserPermissionRequest instance,
) => <String, dynamic>{
  'isAdmin': instance.isAdmin,
  'isAuthorized': instance.isAuthorized,
  'isGuest': instance.isGuest,
  'rankId': instance.rankId,
  'positionId': instance.positionId,
  'departmentId': instance.departmentId,
};

_CreateProjectRequest _$CreateProjectRequestFromJson(
  Map<String, dynamic> json,
) => _CreateProjectRequest(
  managerId: (json['managerId'] as num?)?.toInt(),
  clientId: (json['clientId'] as num).toInt(),
  projectCode: json['projectCode'] as String,
  projectName: json['projectName'] as String,
  isPreexecuted: json['isPreexecuted'] as bool?,
);

Map<String, dynamic> _$CreateProjectRequestToJson(
  _CreateProjectRequest instance,
) => <String, dynamic>{
  'managerId': instance.managerId,
  'clientId': instance.clientId,
  'projectCode': instance.projectCode,
  'projectName': instance.projectName,
  'isPreexecuted': instance.isPreexecuted,
};

_UpdateProjectRequest _$UpdateProjectRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateProjectRequest(
  managerId: (json['managerId'] as num?)?.toInt(),
  clientId: (json['clientId'] as num?)?.toInt(),
  projectCode: json['projectCode'] as String?,
  projectName: json['projectName'] as String?,
  isPreexecuted: json['isPreexecuted'] as bool?,
  categoryId: (json['categoryId'] as num?)?.toInt(),
  isContracted: json['isContracted'] as bool?,
);

Map<String, dynamic> _$UpdateProjectRequestToJson(
  _UpdateProjectRequest instance,
) => <String, dynamic>{
  'managerId': instance.managerId,
  'clientId': instance.clientId,
  'projectCode': instance.projectCode,
  'projectName': instance.projectName,
  'isPreexecuted': instance.isPreexecuted,
  'categoryId': instance.categoryId,
  'isContracted': instance.isContracted,
};

_CloseProjectRequest _$CloseProjectRequestFromJson(Map<String, dynamic> json) =>
    _CloseProjectRequest(closureMessage: json['closureMessage'] as String);

Map<String, dynamic> _$CloseProjectRequestToJson(
  _CloseProjectRequest instance,
) => <String, dynamic>{'closureMessage': instance.closureMessage};

_SendMailRequest _$SendMailRequestFromJson(Map<String, dynamic> json) =>
    _SendMailRequest(
      userIds: (json['userIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$SendMailRequestToJson(_SendMailRequest instance) =>
    <String, dynamic>{'userIds': instance.userIds};

_CreateContractIssueRequest _$CreateContractIssueRequestFromJson(
  Map<String, dynamic> json,
) => _CreateContractIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  currencyId: (json['currencyId'] as num).toInt(),
  contractItems: (json['contractItems'] as List<dynamic>)
      .map(
        (e) =>
            CreateContractIssueItemRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  transactionItems: (json['transactionItems'] as List<dynamic>)
      .map(
        (e) => CreateTransactionIssueItemRequest.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateContractIssueRequestToJson(
  _CreateContractIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'currencyId': instance.currencyId,
  'contractItems': instance.contractItems,
  'transactionItems': instance.transactionItems,
  'attachments': instance.attachments,
};

_CreateKickoffIssueRequest _$CreateKickoffIssueRequestFromJson(
  Map<String, dynamic> json,
) => _CreateKickoffIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  kickoffDate: DateTime.parse(json['kickoffDate'] as String),
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateKickoffIssueRequestToJson(
  _CreateKickoffIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'kickoffDate': instance.kickoffDate.toIso8601String(),
  'attachments': instance.attachments,
};

_CreateApprovalIssueRequest _$CreateApprovalIssueRequestFromJson(
  Map<String, dynamic> json,
) => _CreateApprovalIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateApprovalIssueRequestToJson(
  _CreateApprovalIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'attachments': instance.attachments,
};

_UpsertProcurementRequest _$UpsertProcurementRequestFromJson(
  Map<String, dynamic> json,
) => _UpsertProcurementRequest(
  title: json['title'] as String,
  deliveryDate: json['deliveryDate'] == null
      ? null
      : DateTime.parse(json['deliveryDate'] as String),
  paymentTerms: json['paymentTerms'] as String?,
  hasFee: json['hasFee'] as bool? ?? false,
  note: json['note'] as String?,
  supplierId: (json['supplierId'] as num).toInt(),
  items: (json['items'] as List<dynamic>)
      .map(
        (e) => CreateProcurementIssueItemRequest.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$UpsertProcurementRequestToJson(
  _UpsertProcurementRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'deliveryDate': instance.deliveryDate?.toIso8601String(),
  'paymentTerms': instance.paymentTerms,
  'hasFee': instance.hasFee,
  'note': instance.note,
  'supplierId': instance.supplierId,
  'items': instance.items,
};

_CreateProcurementIssueRequest _$CreateProcurementIssueRequestFromJson(
  Map<String, dynamic> json,
) => _CreateProcurementIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  procurementItems: (json['procurementItems'] as List<dynamic>)
      .map(
        (e) => CreateProcurementIssueItemRequest.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateProcurementIssueRequestToJson(
  _CreateProcurementIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'procurementItems': instance.procurementItems,
  'attachments': instance.attachments,
};

_CreateTransactionIssueRequest _$CreateTransactionIssueRequestFromJson(
  Map<String, dynamic> json,
) => _CreateTransactionIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  transactionItems: (json['transactionItems'] as List<dynamic>)
      .map(
        (e) => UpdateTransactionIssueItemRequest.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateTransactionIssueRequestToJson(
  _CreateTransactionIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'transactionItems': instance.transactionItems,
  'attachments': instance.attachments,
};

_CreatePaymentIssueRequest _$CreatePaymentIssueRequestFromJson(
  Map<String, dynamic> json,
) => _CreatePaymentIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreatePaymentIssueRequestToJson(
  _CreatePaymentIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'attachments': instance.attachments,
};

_UpdateContractIssueRequest _$UpdateContractIssueRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateContractIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  currencyId: (json['currencyId'] as num).toInt(),
  contractItems: (json['contractItems'] as List<dynamic>)
      .map(
        (e) =>
            UpdateContractIssueItemRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  transactionItems: (json['transactionItems'] as List<dynamic>)
      .map(
        (e) => UpdateTransactionIssueItemRequest.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UpdateContractIssueRequestToJson(
  _UpdateContractIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'currencyId': instance.currencyId,
  'contractItems': instance.contractItems,
  'transactionItems': instance.transactionItems,
  'attachments': instance.attachments,
};

_UpdateKickoffIssueRequest _$UpdateKickoffIssueRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateKickoffIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  kickoffDate: DateTime.parse(json['kickoffDate'] as String),
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UpdateKickoffIssueRequestToJson(
  _UpdateKickoffIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'kickoffDate': instance.kickoffDate.toIso8601String(),
  'attachments': instance.attachments,
};

_UpdateApprovalIssueRequest _$UpdateApprovalIssueRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateApprovalIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UpdateApprovalIssueRequestToJson(
  _UpdateApprovalIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'attachments': instance.attachments,
};

_UpdateProcurementIssueRequest _$UpdateProcurementIssueRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateProcurementIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  procurementItems: (json['procurementItems'] as List<dynamic>)
      .map(
        (e) => UpdateProcurementIssueItemRequest.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UpdateProcurementIssueRequestToJson(
  _UpdateProcurementIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'procurementItems': instance.procurementItems,
  'attachments': instance.attachments,
};

_UpdateTransactionIssueRequest _$UpdateTransactionIssueRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateTransactionIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  transactionItems: (json['transactionItems'] as List<dynamic>)
      .map(
        (e) => UpdateTransactionIssueItemRequest.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UpdateTransactionIssueRequestToJson(
  _UpdateTransactionIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'transactionItems': instance.transactionItems,
  'attachments': instance.attachments,
};

_UpdatePaymentIssueRequest _$UpdatePaymentIssueRequestFromJson(
  Map<String, dynamic> json,
) => _UpdatePaymentIssueRequest(
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  content: json['content'] as String,
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => IssueAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UpdatePaymentIssueRequestToJson(
  _UpdatePaymentIssueRequest instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'content': instance.content,
  'attachments': instance.attachments,
};

_CreateContractIssueItemRequest _$CreateContractIssueItemRequestFromJson(
  Map<String, dynamic> json,
) => _CreateContractIssueItemRequest(
  item: json['item'] as String,
  price: json['price'] as String,
);

Map<String, dynamic> _$CreateContractIssueItemRequestToJson(
  _CreateContractIssueItemRequest instance,
) => <String, dynamic>{'item': instance.item, 'price': instance.price};

_CreateProcurementIssueItemRequest _$CreateProcurementIssueItemRequestFromJson(
  Map<String, dynamic> json,
) => _CreateProcurementIssueItemRequest(
  item: json['item'] as String,
  spec: json['spec'] as String,
  quantity: json['quantity'] as String,
  unitPrice: json['unitPrice'] as String,
  totalAmount: json['totalAmount'] as String,
  isOnlinePurchase: json['isOnlinePurchase'] as bool? ?? false,
  purchaseUrl: json['purchaseUrl'] as String?,
  supplierId: (json['supplierId'] as num?)?.toInt(),
  note: json['note'] as String?,
);

Map<String, dynamic> _$CreateProcurementIssueItemRequestToJson(
  _CreateProcurementIssueItemRequest instance,
) => <String, dynamic>{
  'item': instance.item,
  'spec': instance.spec,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'totalAmount': instance.totalAmount,
  'isOnlinePurchase': instance.isOnlinePurchase,
  'purchaseUrl': instance.purchaseUrl,
  'supplierId': instance.supplierId,
  'note': instance.note,
};

_CreateTransactionIssueItemRequest _$CreateTransactionIssueItemRequestFromJson(
  Map<String, dynamic> json,
) => _CreateTransactionIssueItemRequest(
  categoryId: (json['categoryId'] as num).toInt(),
  price: json['price'] as String,
  ratio: json['ratio'] as String,
  isPaid: json['isPaid'] as bool?,
  paidAt: json['paidAt'] == null
      ? null
      : DateTime.parse(json['paidAt'] as String),
  note: json['note'] as String?,
);

Map<String, dynamic> _$CreateTransactionIssueItemRequestToJson(
  _CreateTransactionIssueItemRequest instance,
) => <String, dynamic>{
  'categoryId': instance.categoryId,
  'price': instance.price,
  'ratio': instance.ratio,
  'isPaid': instance.isPaid,
  'paidAt': instance.paidAt?.toIso8601String(),
  'note': instance.note,
};

_UpdateContractIssueItemRequest _$UpdateContractIssueItemRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateContractIssueItemRequest(
  id: (json['id'] as num?)?.toInt(),
  item: json['item'] as String,
  price: json['price'] as String,
);

Map<String, dynamic> _$UpdateContractIssueItemRequestToJson(
  _UpdateContractIssueItemRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'item': instance.item,
  'price': instance.price,
};

_UpdateProcurementIssueItemRequest _$UpdateProcurementIssueItemRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateProcurementIssueItemRequest(
  id: (json['id'] as num?)?.toInt(),
  item: json['item'] as String,
  spec: json['spec'] as String,
  quantity: json['quantity'] as String,
  unitPrice: json['unitPrice'] as String,
  totalAmount: json['totalAmount'] as String,
  isOnlinePurchase: json['isOnlinePurchase'] as bool? ?? false,
  purchaseUrl: json['purchaseUrl'] as String?,
  supplierId: (json['supplierId'] as num?)?.toInt(),
  note: json['note'] as String?,
);

Map<String, dynamic> _$UpdateProcurementIssueItemRequestToJson(
  _UpdateProcurementIssueItemRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'item': instance.item,
  'spec': instance.spec,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'totalAmount': instance.totalAmount,
  'isOnlinePurchase': instance.isOnlinePurchase,
  'purchaseUrl': instance.purchaseUrl,
  'supplierId': instance.supplierId,
  'note': instance.note,
};

_UpdateTransactionIssueItemRequest _$UpdateTransactionIssueItemRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateTransactionIssueItemRequest(
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

Map<String, dynamic> _$UpdateTransactionIssueItemRequestToJson(
  _UpdateTransactionIssueItemRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'price': instance.price,
  'ratio': instance.ratio,
  'isPaid': instance.isPaid,
  'paidAt': instance.paidAt?.toIso8601String(),
  'note': instance.note,
};

_CreateSupplierRequest _$CreateSupplierRequestFromJson(
  Map<String, dynamic> json,
) => _CreateSupplierRequest(
  name: json['name'] as String,
  number: json['number'] as String,
  zipcode: json['zipcode'] as String?,
  roadAddress: json['roadAddress'] as String?,
  roadAddressReference: json['roadAddressReference'] as String?,
  detailAddress: json['detailAddress'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  logo: json['logo'] as String?,
);

Map<String, dynamic> _$CreateSupplierRequestToJson(
  _CreateSupplierRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'number': instance.number,
  'zipcode': instance.zipcode,
  'roadAddress': instance.roadAddress,
  'roadAddressReference': instance.roadAddressReference,
  'detailAddress': instance.detailAddress,
  'phone': instance.phone,
  'email': instance.email,
  'logo': instance.logo,
};

_UpsertScheduleRequest _$UpsertScheduleRequestFromJson(
  Map<String, dynamic> json,
) => _UpsertScheduleRequest(
  summary: json['summary'] as String,
  description: json['description'] as String?,
  url: json['url'] as String,
  projectId: (json['projectId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  start: DateTime.parse(json['start'] as String),
  end: DateTime.parse(json['end'] as String),
  holidays: (json['holidays'] as List<dynamic>?)
      ?.map(
        (e) => UpdateScheduleHolidayRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$UpsertScheduleRequestToJson(
  _UpsertScheduleRequest instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'description': instance.description,
  'url': instance.url,
  'projectId': instance.projectId,
  'categoryId': instance.categoryId,
  'start': instance.start.toIso8601String(),
  'end': instance.end.toIso8601String(),
  'holidays': instance.holidays,
};

_UpdateScheduleHolidayRequest _$UpdateScheduleHolidayRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateScheduleHolidayRequest(
  date: DateTime.parse(json['date'] as String),
  isTravelOnly: json['isTravelOnly'] as bool,
  compensatoryLeaveDate: json['compensatoryLeaveDate'] == null
      ? null
      : DateTime.parse(json['compensatoryLeaveDate'] as String),
);

Map<String, dynamic> _$UpdateScheduleHolidayRequestToJson(
  _UpdateScheduleHolidayRequest instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'isTravelOnly': instance.isTravelOnly,
  'compensatoryLeaveDate': instance.compensatoryLeaveDate?.toIso8601String(),
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
              json['trip'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CreateReportRequestToJson(
  _CreateReportRequest instance,
) => <String, dynamic>{
  'scheduleId': instance.scheduleId,
  'projectId': instance.projectId,
  'content': instance.content,
  'attachments': instance.attachments,
  'trip': instance.trip,
};

_CreateTripReportRequest _$CreateTripReportRequestFromJson(
  Map<String, dynamic> json,
) => _CreateTripReportRequest(
  expenses: (json['expenses'] as List<dynamic>)
      .map(
        (e) => CreateActualExpenseRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  rates: (json['rates'] as List<dynamic>)
      .map(
        (e) => CreateRegulationRateRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  fuel: json['fuel'] == null
      ? null
      : CreateFuelExpenseRequest.fromJson(json['fuel'] as Map<String, dynamic>),
  isDeducted: json['isDeducted'] as bool?,
  holidays: (json['holidays'] as List<dynamic>?)
      ?.map(
        (e) => UpdateScheduleHolidayRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$CreateTripReportRequestToJson(
  _CreateTripReportRequest instance,
) => <String, dynamic>{
  'expenses': instance.expenses,
  'rates': instance.rates,
  'fuel': instance.fuel,
  'isDeducted': instance.isDeducted,
  'holidays': instance.holidays,
};

_CreateFuelExpenseRequest _$CreateFuelExpenseRequestFromJson(
  Map<String, dynamic> json,
) => _CreateFuelExpenseRequest(
  rate: json['rate'] as String,
  mileage: json['mileage'] as String,
  distance: json['distance'] as String,
);

Map<String, dynamic> _$CreateFuelExpenseRequestToJson(
  _CreateFuelExpenseRequest instance,
) => <String, dynamic>{
  'rate': instance.rate,
  'mileage': instance.mileage,
  'distance': instance.distance,
};

_CreateActualExpenseRequest _$CreateActualExpenseRequestFromJson(
  Map<String, dynamic> json,
) => _CreateActualExpenseRequest(
  stepId: (json['stepId'] as num).toInt(),
  currencyId: (json['currencyId'] as num?)?.toInt(),
  price: json['price'] as String,
  paymentDate: json['paymentDate'] == null
      ? null
      : DateTime.parse(json['paymentDate'] as String),
  details: json['details'] as String?,
);

Map<String, dynamic> _$CreateActualExpenseRequestToJson(
  _CreateActualExpenseRequest instance,
) => <String, dynamic>{
  'stepId': instance.stepId,
  'currencyId': instance.currencyId,
  'price': instance.price,
  'paymentDate': instance.paymentDate?.toIso8601String(),
  'details': instance.details,
};

_CreateRegulationRateRequest _$CreateRegulationRateRequestFromJson(
  Map<String, dynamic> json,
) => _CreateRegulationRateRequest(
  stepId: (json['stepId'] as num).toInt(),
  days: json['days'] as String,
  rate: json['rate'] as String,
  details: json['details'] as String?,
);

Map<String, dynamic> _$CreateRegulationRateRequestToJson(
  _CreateRegulationRateRequest instance,
) => <String, dynamic>{
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
              json['trip'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$UpdateReportRequestToJson(
  _UpdateReportRequest instance,
) => <String, dynamic>{
  'scheduleId': instance.scheduleId,
  'projectId': instance.projectId,
  'content': instance.content,
  'attachments': instance.attachments,
  'trip': instance.trip,
};

_UpdateTripReportRequest _$UpdateTripReportRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateTripReportRequest(
  expenses: (json['expenses'] as List<dynamic>?)
      ?.map(
        (e) => UpdateActualExpenseRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  rates: (json['rates'] as List<dynamic>?)
      ?.map(
        (e) => UpdateRegulationRateRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  fuel: json['fuel'] == null
      ? null
      : UpdateFuelExpenseRequest.fromJson(json['fuel'] as Map<String, dynamic>),
  isDeducted: json['isDeducted'] as bool?,
  holidays: (json['holidays'] as List<dynamic>?)
      ?.map(
        (e) => UpdateScheduleHolidayRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$UpdateTripReportRequestToJson(
  _UpdateTripReportRequest instance,
) => <String, dynamic>{
  'expenses': instance.expenses,
  'rates': instance.rates,
  'fuel': instance.fuel,
  'isDeducted': instance.isDeducted,
  'holidays': instance.holidays,
};

_UpdateFuelExpenseRequest _$UpdateFuelExpenseRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateFuelExpenseRequest(
  id: (json['id'] as num?)?.toInt(),
  rate: json['rate'] as String?,
  mileage: json['mileage'] as String?,
  distance: json['distance'] as String?,
);

Map<String, dynamic> _$UpdateFuelExpenseRequestToJson(
  _UpdateFuelExpenseRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'rate': instance.rate,
  'mileage': instance.mileage,
  'distance': instance.distance,
};

_UpdateActualExpenseRequest _$UpdateActualExpenseRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateActualExpenseRequest(
  id: (json['id'] as num?)?.toInt(),
  stepId: (json['stepId'] as num).toInt(),
  currencyId: (json['currencyId'] as num?)?.toInt(),
  price: json['price'] as String,
  paymentDate: json['paymentDate'] == null
      ? null
      : DateTime.parse(json['paymentDate'] as String),
  details: json['details'] as String?,
);

Map<String, dynamic> _$UpdateActualExpenseRequestToJson(
  _UpdateActualExpenseRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'stepId': instance.stepId,
  'currencyId': instance.currencyId,
  'price': instance.price,
  'paymentDate': instance.paymentDate?.toIso8601String(),
  'details': instance.details,
};

_UpdateRegulationRateRequest _$UpdateRegulationRateRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateRegulationRateRequest(
  id: (json['id'] as num?)?.toInt(),
  stepId: (json['stepId'] as num).toInt(),
  days: json['days'] as String,
  rate: json['rate'] as String,
  details: json['details'] as String?,
);

Map<String, dynamic> _$UpdateRegulationRateRequestToJson(
  _UpdateRegulationRateRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'stepId': instance.stepId,
  'days': instance.days,
  'rate': instance.rate,
  'details': instance.details,
};

_SyncDocumentFolderRequest _$SyncDocumentFolderRequestFromJson(
  Map<String, dynamic> json,
) => _SyncDocumentFolderRequest(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  parentId: (json['parentId'] as num?)?.toInt(),
  sort: (json['sort'] as num?)?.toInt() ?? 0,
  fixed: json['fixed'] as bool? ?? false,
  children:
      (json['children'] as List<dynamic>?)
          ?.map(
            (e) =>
                SyncDocumentFolderRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$SyncDocumentFolderRequestToJson(
  _SyncDocumentFolderRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'parentId': instance.parentId,
  'sort': instance.sort,
  'fixed': instance.fixed,
  'children': instance.children,
};

_SyncDocumentFoldersRequest _$SyncDocumentFoldersRequestFromJson(
  Map<String, dynamic> json,
) => _SyncDocumentFoldersRequest(
  items: (json['items'] as List<dynamic>)
      .map((e) => SyncDocumentFolderRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SyncDocumentFoldersRequestToJson(
  _SyncDocumentFoldersRequest instance,
) => <String, dynamic>{'items': instance.items};

_CreateDocumentRequest _$CreateDocumentRequestFromJson(
  Map<String, dynamic> json,
) => _CreateDocumentRequest(
  title: json['title'] as String,
  content: json['content'] as String,
  folderId: (json['folderId'] as num).toInt(),
  fixed: json['fixed'] as bool? ?? false,
  attachments: (json['attachments'] as List<dynamic>)
      .map((e) => DocumentAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateDocumentRequestToJson(
  _CreateDocumentRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'content': instance.content,
  'folderId': instance.folderId,
  'fixed': instance.fixed,
  'attachments': instance.attachments,
};

_UploadedFile _$UploadedFileFromJson(Map<String, dynamic> json) =>
    _UploadedFile(path: json['path'] as String, url: json['url'] as String);

Map<String, dynamic> _$UploadedFileToJson(_UploadedFile instance) =>
    <String, dynamic>{'path': instance.path, 'url': instance.url};

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
      items:
          (json['items'] as List<dynamic>?)
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
  category: ScheduleCategory.fromJson(json['category'] as Map<String, dynamic>),
  reportId: (json['reportId'] as num?)?.toInt(),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  holidays:
      (json['holidays'] as List<dynamic>?)
          ?.map((e) => ScheduleHoliday.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
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
  'reportId': instance.reportId,
  'user': instance.user,
  'holidays': instance.holidays,
  'summary': instance.summary,
  'description': instance.description,
  'url': instance.url,
  'start': instance.start.toIso8601String(),
  'end': instance.end.toIso8601String(),
};

_TodaySchedule _$TodayScheduleFromJson(Map<String, dynamic> json) =>
    _TodaySchedule(
      summary: json['summary'] as String,
      category: ScheduleCategory.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
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
  zipcode: json['zipcode'] as String?,
  address: json['address'] as String?,
  roadAddress: json['roadAddress'] as String?,
  roadAddressReference: json['roadAddressReference'] as String?,
  detailAddress: json['detailAddress'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  logo: json['logo'] as String?,
);

Map<String, dynamic> _$SupplierToJson(_Supplier instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'number': instance.number,
  'zipcode': instance.zipcode,
  'address': instance.address,
  'roadAddress': instance.roadAddress,
  'roadAddressReference': instance.roadAddressReference,
  'detailAddress': instance.detailAddress,
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
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_SupplierAddress _$SupplierAddressFromJson(Map<String, dynamic> json) =>
    _SupplierAddress(
      zipcode: json['zipcode'] as String? ?? '',
      roadAddress: json['roadAddress'] as String? ?? '',
      roadAddressReference: json['roadAddressReference'] as String? ?? '',
      detailAddress: json['detailAddress'] as String?,
    );

Map<String, dynamic> _$SupplierAddressToJson(_SupplierAddress instance) =>
    <String, dynamic>{
      'zipcode': instance.zipcode,
      'roadAddress': instance.roadAddress,
      'roadAddressReference': instance.roadAddressReference,
      'detailAddress': instance.detailAddress,
    };

_SupplierLogo _$SupplierLogoFromJson(Map<String, dynamic> json) =>
    _SupplierLogo(
      filename: json['filename'] as String,
      size: (json['size'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$SupplierLogoToJson(_SupplierLogo instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'size': instance.size,
      'url': instance.url,
    };

_Token _$TokenFromJson(Map<String, dynamic> json) =>
    _Token(accessToken: json['accessToken'] as String);

Map<String, dynamic> _$TokenToJson(_Token instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
};

_Report _$ReportFromJson(Map<String, dynamic> json) => _Report(
  id: (json['id'] as num).toInt(),
  schedule: json['schedule'] == null
      ? null
      : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
  createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
  updatedBy: json['updatedBy'] == null
      ? null
      : User.fromJson(json['updatedBy'] as Map<String, dynamic>),
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
  'createdBy': instance.createdBy,
  'updatedBy': instance.updatedBy,
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
  calculations: json['calculations'] == null
      ? null
      : TripCalculations.fromJson(json['calculations'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TripReportToJson(_TripReport instance) =>
    <String, dynamic>{
      'expenses': instance.expenses,
      'rates': instance.rates,
      'fuel': instance.fuel,
      'isDeducted': instance.isDeducted,
      'calculations': instance.calculations,
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
  requiresExpenseCurrency: json['requiresExpenseCurrency'] as bool? ?? false,
);

Map<String, dynamic> _$TripStepToJson(_TripStep instance) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'name': instance.name,
  'description': instance.description,
  'requiresExpenseCurrency': instance.requiresExpenseCurrency,
};

_TripActualExpense _$TripActualExpenseFromJson(Map<String, dynamic> json) =>
    _TripActualExpense(
      id: (json['id'] as num?)?.toInt(),
      stepId: (json['stepId'] as num).toInt(),
      currencyId: (json['currencyId'] as num?)?.toInt(),
      price: json['price'] as String?,
      paymentDate: json['paymentDate'] == null
          ? null
          : DateTime.parse(json['paymentDate'] as String),
      exchangeRate: (json['exchangeRate'] as num?)?.toDouble(),
      exchangeRateAppliedDate: json['exchangeRateAppliedDate'] == null
          ? null
          : DateTime.parse(json['exchangeRateAppliedDate'] as String),
      convertedPrice: (json['convertedPrice'] as num?)?.toDouble(),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$TripActualExpenseToJson(_TripActualExpense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stepId': instance.stepId,
      'currencyId': instance.currencyId,
      'price': instance.price,
      'paymentDate': instance.paymentDate?.toIso8601String(),
      'exchangeRate': instance.exchangeRate,
      'exchangeRateAppliedDate': instance.exchangeRateAppliedDate
          ?.toIso8601String(),
      'convertedPrice': instance.convertedPrice,
      'details': instance.details,
    };

_DailyAllowancePreview _$DailyAllowancePreviewFromJson(
  Map<String, dynamic> json,
) => _DailyAllowancePreview(
  totalTripDays: (json['totalTripDays'] as num).toInt(),
  domestic: json['domestic'] == null
      ? null
      : DomesticHolidayDays.fromJson(json['domestic'] as Map<String, dynamic>),
  overseas: json['overseas'] == null
      ? null
      : OverseasSpecialAllowance.fromJson(
          json['overseas'] as Map<String, dynamic>,
        ),
  dailyRate: (json['dailyRate'] as num).toDouble(),
  dailyAmount: (json['dailyAmount'] as num).toDouble(),
  deductionRate: (json['deductionRate'] as num).toDouble(),
  exchangeRate: (json['exchangeRate'] as num).toDouble(),
  totalAmount: (json['totalAmount'] as num).toDouble(),
  currencyCode: json['currencyCode'] as String,
);

Map<String, dynamic> _$DailyAllowancePreviewToJson(
  _DailyAllowancePreview instance,
) => <String, dynamic>{
  'totalTripDays': instance.totalTripDays,
  'domestic': instance.domestic,
  'overseas': instance.overseas,
  'dailyRate': instance.dailyRate,
  'dailyAmount': instance.dailyAmount,
  'deductionRate': instance.deductionRate,
  'exchangeRate': instance.exchangeRate,
  'totalAmount': instance.totalAmount,
  'currencyCode': instance.currencyCode,
};

_DomesticHolidayDays _$DomesticHolidayDaysFromJson(Map<String, dynamic> json) =>
    _DomesticHolidayDays(
      workDays: (json['workDays'] as num).toInt(),
      travelDays: (json['travelDays'] as num).toDouble(),
    );

Map<String, dynamic> _$DomesticHolidayDaysToJson(
  _DomesticHolidayDays instance,
) => <String, dynamic>{
  'workDays': instance.workDays,
  'travelDays': instance.travelDays,
};

_OverseasSpecialAllowance _$OverseasSpecialAllowanceFromJson(
  Map<String, dynamic> json,
) => _OverseasSpecialAllowance(
  days: (json['days'] as num).toInt(),
  rate: (json['rate'] as num).toDouble(),
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$OverseasSpecialAllowanceToJson(
  _OverseasSpecialAllowance instance,
) => <String, dynamic>{
  'days': instance.days,
  'rate': instance.rate,
  'amount': instance.amount,
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

_TripCalculations _$TripCalculationsFromJson(Map<String, dynamic> json) =>
    _TripCalculations(
      totalCost: (json['totalCost'] as num).toInt(),
      taxableAmount: (json['taxableAmount'] as num?)?.toInt(),
      nonTaxableAmount: (json['nonTaxableAmount'] as num?)?.toInt(),
      exchangeRate: (json['exchangeRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TripCalculationsToJson(_TripCalculations instance) =>
    <String, dynamic>{
      'totalCost': instance.totalCost,
      'taxableAmount': instance.taxableAmount,
      'nonTaxableAmount': instance.nonTaxableAmount,
      'exchangeRate': instance.exchangeRate,
    };

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  username: json['username'] as String,
  isAdmin: json['isAdmin'] as bool? ?? false,
  isAuthorized: json['isAuthorized'] as bool? ?? false,
  rank: json['rank'] == null
      ? null
      : UserRank.fromJson(json['rank'] as Map<String, dynamic>),
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
  'rank': instance.rank,
  'position': instance.position,
  'department': instance.department,
};

_UserRank _$UserRankFromJson(Map<String, dynamic> json) =>
    _UserRank(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$UserRankToJson(_UserRank instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

_UserPosition _$UserPositionFromJson(Map<String, dynamic> json) =>
    _UserPosition(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserPositionToJson(_UserPosition instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_UserDepartment _$UserDepartmentFromJson(Map<String, dynamic> json) =>
    _UserDepartment(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      root: (json['root'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserDepartmentToJson(_UserDepartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'root': instance.root,
    };

_UserDepartmentGroup _$UserDepartmentGroupFromJson(Map<String, dynamic> json) =>
    _UserDepartmentGroup(
      depth: (json['depth'] as num).toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => UserDepartment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDepartmentGroupToJson(
  _UserDepartmentGroup instance,
) => <String, dynamic>{
  'depth': instance.depth,
  'parentId': instance.parentId,
  'items': instance.items,
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
    <String, dynamic>{'depth': instance.depth, 'count': instance.count};

_WorkIssueListItem _$WorkIssueListItemFromJson(Map<String, dynamic> json) =>
    _WorkIssueListItem(
      id: (json['id'] as num).toInt(),
      projectId: (json['projectId'] as num).toInt(),
      projectCode: json['projectCode'] as String,
      projectName: json['projectName'] as String,
      category: IssueCategory.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      clients: (json['clients'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WorkIssueListItemToJson(_WorkIssueListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'projectCode': instance.projectCode,
      'projectName': instance.projectName,
      'category': instance.category,
      'clients': instance.clients,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_WorkReportListItem _$WorkReportListItemFromJson(Map<String, dynamic> json) =>
    _WorkReportListItem(
      id: (json['id'] as num).toInt(),
      projectId: (json['projectId'] as num).toInt(),
      projectCode: json['projectCode'] as String,
      projectName: json['projectName'] as String,
      clients: (json['clients'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
      schedule: json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WorkReportListItemToJson(_WorkReportListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'projectCode': instance.projectCode,
      'projectName': instance.projectName,
      'clients': instance.clients,
      'schedule': instance.schedule,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> logout() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'auth/logout',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _AddressService implements AddressService {
  _AddressService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Result<Address>> search({
    required int page,
    int limit = 10,
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
    final _options = _setStreamType<Result<Address>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'address/search',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<Address> _value;
    try {
      _value = Result<Address>.fromJson(
        _result.data!,
        (json) => Address.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DashboardSearchResult> search({
    required String search,
    int limit = 5,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': search,
      r'limit': limit,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DashboardSearchResult>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'dashboard/search',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DashboardSearchResult _value;
    try {
      _value = DashboardSearchResult.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _DocumentFolderService implements DocumentFolderService {
  _DocumentFolderService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<DocumentFolder>> getAllFolders() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<DocumentFolder>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'document-folder',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<DocumentFolder> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => DocumentFolder.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<DocumentFolder>> syncFolders({
    required SyncDocumentFoldersRequest body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _options = _setStreamType<List<DocumentFolder>>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'document-folder',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<DocumentFolder> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => DocumentFolder.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _DraftService implements DraftService {
  _DraftService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Draft?> getDraft({required String id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Draft?>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'drafts/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late Draft? _value;
    try {
      _value = _result.data == null ? null : Draft.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Draft> saveDraft({required String id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Draft>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'drafts/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Draft _value;
    try {
      _value = Draft.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteDraft({required String id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'drafts/${id}',
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _DocumentService implements DocumentService {
  _DocumentService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Document> getDocumentForEdit({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Document>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'document/${id}/edit',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Document _value;
    try {
      _value = Document.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DocumentListItem>> getDocuments({
    int page = 1,
    int limit = 20,
    required int folderId,
    String? sort,
    String? order,
    String? search,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'folder_id': folderId,
      r'sort': sort,
      r'order': order,
      r'search': search,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DocumentListItem>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'document',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<DocumentListItem> _value;
    try {
      _value = Result<DocumentListItem>.fromJson(
        _result.data!,
        (json) => DocumentListItem.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Document> getDocumentDetail({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Document>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'document/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Document _value;
    try {
      _value = Document.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> sendMail({
    required int id,
    required SendMailRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'document/mail/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<Document> createDocument({
    required CreateDocumentRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Document>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'document',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Document _value;
    try {
      _value = Document.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Document> updateDocument({
    required int id,
    required CreateDocumentRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Document>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'document/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Document _value;
    try {
      _value = Document.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteDocument({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'document/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<List<DocumentAttachment>> uploadAttachments({
    required int documentId,
    required List<MultipartFile> files,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(files.map((i) => MapEntry('files', i)));
    final _options = _setStreamType<List<DocumentAttachment>>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            'document/${documentId}/attachments',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<DocumentAttachment> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                DocumentAttachment.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteAttachment({
    required int documentId,
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
            'document/${documentId}/attachments/${fileId}',
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _HolidayService implements HolidayService {
  _HolidayService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<KoreanHoliday>> getDaysOffBetween({
    DateTime? start,
    DateTime? end,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'start': start?.toIso8601String(),
      r'end': end?.toIso8601String(),
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<KoreanHoliday>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'holiday/days-off',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<KoreanHoliday> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => KoreanHoliday.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Schedule> getScheduleForEdit({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Schedule>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'schedule/${id}/edit',
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<ScheduleGroup>> getSchedules({
    int? projectId,
    int? userId,
    int? departmentId,
    String? search,
    DateTime? start,
    DateTime? end,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'project_id': projectId,
      r'user_id': userId,
      r'department_id': departmentId,
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Schedule> createSchedule({
    required UpsertScheduleRequest request,
  }) async {
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Schedule> updateSchedule({
    required int id,
    required UpsertScheduleRequest request,
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
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<TransactionIssueItemCategory>>
  getAllTransactionCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<TransactionIssueItemCategory>>(
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
    late List<TransactionIssueItemCategory> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => TransactionIssueItemCategory.fromJson(
              i as Map<String, dynamic>,
            ),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<ApprovalIssue>> getApprovalIssues({
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
    final _options = _setStreamType<Result<ApprovalIssue>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/approval',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<ApprovalIssue> _value;
    try {
      _value = Result<ApprovalIssue>.fromJson(
        _result.data!,
        (json) => ApprovalIssue.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ContractIssueItem>> getContractIssueItems({
    required int id,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ContractIssueItem>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/contract/${id}/items',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ContractIssueItem> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                ContractIssueItem.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<HttpResponse<List<int>>> exportPurchaseRequest({
    required int id,
  }) async {
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
            'issue/procurement/${id}/export-request',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<int>>> exportPurchaseOrder({required int id}) async {
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
            'issue/procurement/${id}/export-order',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Issue> createProcurementIssueRequest({
    required int id,
    required UpsertProcurementRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/procurement/${id}/request',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> updateProcurementIssueRequest({
    required int id,
    required UpsertProcurementRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/procurement/request/${id}',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> approveProcurementIssueRequest({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/procurement/${id}/approve',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> deleteProcurementIssueRequest({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/procurement/request/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<List<TransactionIssueItem>> getTransactionIssueItems({
    required int id,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<TransactionIssueItem>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/transaction/${id}/items',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<TransactionIssueItem> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                TransactionIssueItem.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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
      _value = _result.data == null
          ? null
          : ContractIssue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Issue> createContractIssue({
    required CreateContractIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/contract',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> updateContractIssue({
    required int id,
    required UpdateContractIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/contract/${id}',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
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
      _value = _result.data == null
          ? null
          : KickoffIssue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Issue> createKickoffIssue({
    required CreateKickoffIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/kickoff',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> updateKickoffIssue({
    required int id,
    required UpdateKickoffIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/kickoff/${id}',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> createApprovalIssue({
    required CreateApprovalIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/approval',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> updateApprovalIssue({
    required int id,
    required UpdateApprovalIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/approval/${id}',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> createProcurementIssue({
    required CreateProcurementIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/procurement',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> updateProcurementIssue({
    required int id,
    required UpdateProcurementIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/procurement/${id}',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Issue> createTransactionIssue({
    required CreateTransactionIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/transaction',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> updateTransactionIssue({
    required int id,
    required UpdateTransactionIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/transaction/${id}',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
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
      _value = _result.data == null
          ? null
          : PaymentIssue.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Issue> createPaymentIssue({
    required CreatePaymentIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/payment',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> updatePaymentIssue({
    required int id,
    required UpdatePaymentIssueRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Issue>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/payment/${id}',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<IssueCategory> getCategory({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<IssueCategory>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/categories/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late IssueCategory _value;
    try {
      _value = IssueCategory.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> sendMail({
    required int id,
    required SendMailRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
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
  Future<Issue> getIssueForProcurementRequest({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Issue>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/${id}/procurement/request',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Issue> getIssueForEdit({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Issue>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'issue/${id}/edit',
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<ProjectListItem>> getProjects({
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
    final _options = _setStreamType<Result<ProjectListItem>>(
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
    late Result<ProjectListItem> _value;
    try {
      _value = Result<ProjectListItem>.fromJson(
        _result.data!,
        (json) => ProjectListItem.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Project> closeProject({
    required int id,
    required CloseProjectRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Project>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'project/${id}/close',
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _SftpService implements SftpService {
  _SftpService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<UploadedFile>> uploadInlineImage({
    required String path,
    required int resourceId,
    required List<MultipartFile> files,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'path': path,
      r'resource_id': resourceId,
    };
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(files.map((i) => MapEntry('files', i)));
    final _options = _setStreamType<List<UploadedFile>>(
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
    late List<UploadedFile> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => UploadedFile.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SupplierLogo> uploadSupplierLogo({required MultipartFile file}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry('file', file));
    final _options = _setStreamType<SupplierLogo>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            'files/supplier-logo',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SupplierLogo _value;
    try {
      _value = SupplierLogo.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _SupplierService implements SupplierService {
  _SupplierService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Supplier> getSupplier({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Supplier>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'supplier/${id}',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<Supplier>> getSuppliers({
    int page = 1,
    int limit = 100,
    String? search,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'search': search,
    };
    queryParameters.removeWhere((k, v) => v == null);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Supplier> createSupplier({
    required CreateSupplierRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Supplier> updateSupplier({
    required int id,
    required CreateSupplierRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<Supplier>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'supplier/${id}',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteSupplier({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'supplier/${id}',
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DailyAllowancePreview> previewDailyAllowance({
    required Map<String, dynamic> request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _options = _setStreamType<DailyAllowancePreview>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report/trip/daily-allowance/preview',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DailyAllowancePreview _value;
    try {
      _value = DailyAllowancePreview.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Report> getReportForEdit({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Report>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'report/${id}/edit',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> sendMail({
    required int id,
    required SendMailRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _UserService implements UserService {
  _UserService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<UserDepartmentGroup>> getAllDepartments() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<UserDepartmentGroup>>(
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
    late List<UserDepartmentGroup> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                UserDepartmentGroup.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<UserRank>> getAllRanks() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<UserRank>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/rank',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<UserRank> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => UserRank.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      errorLogger?.logError(e, s, _options, response: _result);
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
      r'department_id': departmentId,
      r'position_id': positionId,
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<User> updateUserPermission({
    required int id,
    required UpdateUserPermissionRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<User>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/${id}/permission',
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<User> updateUser({
    required int id,
    required UpdateUserRequest request,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<User>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
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
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteUser({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/${id}',
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

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _WorkService implements WorkService {
  _WorkService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Result<ProjectListItem>> getProjects({
    int page = 1,
    int limit = 20,
    String? status,
    String? sort,
    String? order,
    String? search,
    String? clients,
    String? categories,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'status': status,
      r'sort': sort,
      r'order': order,
      r'search': search,
      r'clients': clients,
      r'categories': categories,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<ProjectListItem>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'work/projects',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<ProjectListItem> _value;
    try {
      _value = Result<ProjectListItem>.fromJson(
        _result.data!,
        (json) => ProjectListItem.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<WorkIssueListItem>> getIssues({
    int page = 1,
    int limit = 20,
    String? sort,
    String? order,
    String? search,
    String? clients,
    String? categories,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'sort': sort,
      r'order': order,
      r'search': search,
      r'clients': clients,
      r'categories': categories,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<WorkIssueListItem>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'work/issues',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<WorkIssueListItem> _value;
    try {
      _value = Result<WorkIssueListItem>.fromJson(
        _result.data!,
        (json) => WorkIssueListItem.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<WorkReportListItem>> getReports({
    int page = 1,
    int limit = 20,
    String? sort,
    String? order,
    String? search,
    String? clients,
    String? categories,
    DateTime? start,
    DateTime? end,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'sort': sort,
      r'order': order,
      r'search': search,
      r'clients': clients,
      r'categories': categories,
      r'start': start?.toIso8601String(),
      r'end': end?.toIso8601String(),
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<WorkReportListItem>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'work/reports',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result<WorkReportListItem> _value;
    try {
      _value = Result<WorkReportListItem>.fromJson(
        _result.data!,
        (json) => WorkReportListItem.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
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

// dart format on

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'e81ff156707f6071b8b56dc0a5301f19bc455884';

@ProviderFor(addressRepository)
final addressRepositoryProvider = AddressRepositoryProvider._();

final class AddressRepositoryProvider
    extends
        $FunctionalProvider<
          AddressRepository,
          AddressRepository,
          AddressRepository
        >
    with $Provider<AddressRepository> {
  AddressRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addressRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addressRepositoryHash();

  @$internal
  @override
  $ProviderElement<AddressRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddressRepository create(Ref ref) {
    return addressRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddressRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddressRepository>(value),
    );
  }
}

String _$addressRepositoryHash() => r'89f90551e8eae75fee088696ce461990740faf10';

@ProviderFor(bookmarkRepository)
final bookmarkRepositoryProvider = BookmarkRepositoryProvider._();

final class BookmarkRepositoryProvider
    extends
        $FunctionalProvider<
          BookmarkRepository,
          BookmarkRepository,
          BookmarkRepository
        >
    with $Provider<BookmarkRepository> {
  BookmarkRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkRepositoryHash();

  @$internal
  @override
  $ProviderElement<BookmarkRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BookmarkRepository create(Ref ref) {
    return bookmarkRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookmarkRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookmarkRepository>(value),
    );
  }
}

String _$bookmarkRepositoryHash() =>
    r'ea10bc3fb2d72a85acc1828f257ed6082207e20d';

@ProviderFor(currencyRepository)
final currencyRepositoryProvider = CurrencyRepositoryProvider._();

final class CurrencyRepositoryProvider
    extends
        $FunctionalProvider<
          CurrencyRepository,
          CurrencyRepository,
          CurrencyRepository
        >
    with $Provider<CurrencyRepository> {
  CurrencyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currencyRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currencyRepositoryHash();

  @$internal
  @override
  $ProviderElement<CurrencyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CurrencyRepository create(Ref ref) {
    return currencyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CurrencyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CurrencyRepository>(value),
    );
  }
}

String _$currencyRepositoryHash() =>
    r'ca894e9ab203b794585d74f814956dc740cac4cd';

@ProviderFor(dashboardRepository)
final dashboardRepositoryProvider = DashboardRepositoryProvider._();

final class DashboardRepositoryProvider
    extends
        $FunctionalProvider<
          DashboardRepository,
          DashboardRepository,
          DashboardRepository
        >
    with $Provider<DashboardRepository> {
  DashboardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<DashboardRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashboardRepository create(Ref ref) {
    return dashboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardRepository>(value),
    );
  }
}

String _$dashboardRepositoryHash() =>
    r'8e60582c634eb74d3558ae420f53ef657b6fc43a';

@ProviderFor(documentFolderRepository)
final documentFolderRepositoryProvider = DocumentFolderRepositoryProvider._();

final class DocumentFolderRepositoryProvider
    extends
        $FunctionalProvider<
          DocumentFolderRepository,
          DocumentFolderRepository,
          DocumentFolderRepository
        >
    with $Provider<DocumentFolderRepository> {
  DocumentFolderRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentFolderRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentFolderRepositoryHash();

  @$internal
  @override
  $ProviderElement<DocumentFolderRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DocumentFolderRepository create(Ref ref) {
    return documentFolderRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentFolderRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentFolderRepository>(value),
    );
  }
}

String _$documentFolderRepositoryHash() =>
    r'acb0f33ab6acea08b14d2ae16df1e47a2bbe563d';

@ProviderFor(draftRepository)
final draftRepositoryProvider = DraftRepositoryProvider._();

final class DraftRepositoryProvider
    extends
        $FunctionalProvider<DraftRepository, DraftRepository, DraftRepository>
    with $Provider<DraftRepository> {
  DraftRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'draftRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$draftRepositoryHash();

  @$internal
  @override
  $ProviderElement<DraftRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DraftRepository create(Ref ref) {
    return draftRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DraftRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DraftRepository>(value),
    );
  }
}

String _$draftRepositoryHash() => r'1d909e7dfe293a3225761f18ac481850f458dcff';

@ProviderFor(documentRepository)
final documentRepositoryProvider = DocumentRepositoryProvider._();

final class DocumentRepositoryProvider
    extends
        $FunctionalProvider<
          DocumentRepository,
          DocumentRepository,
          DocumentRepository
        >
    with $Provider<DocumentRepository> {
  DocumentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentRepositoryHash();

  @$internal
  @override
  $ProviderElement<DocumentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DocumentRepository create(Ref ref) {
    return documentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentRepository>(value),
    );
  }
}

String _$documentRepositoryHash() =>
    r'df1efbbdba883c322c7fec9c7e3dd296be8fcbb5';

@ProviderFor(holidayRepository)
final holidayRepositoryProvider = HolidayRepositoryProvider._();

final class HolidayRepositoryProvider
    extends
        $FunctionalProvider<
          HolidayRepository,
          HolidayRepository,
          HolidayRepository
        >
    with $Provider<HolidayRepository> {
  HolidayRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'holidayRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$holidayRepositoryHash();

  @$internal
  @override
  $ProviderElement<HolidayRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HolidayRepository create(Ref ref) {
    return holidayRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HolidayRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HolidayRepository>(value),
    );
  }
}

String _$holidayRepositoryHash() => r'17658906c1aaba3a4cc3263bd829aa1c08c3aa93';

@ProviderFor(scheduleRepository)
final scheduleRepositoryProvider = ScheduleRepositoryProvider._();

final class ScheduleRepositoryProvider
    extends
        $FunctionalProvider<
          ScheduleRepository,
          ScheduleRepository,
          ScheduleRepository
        >
    with $Provider<ScheduleRepository> {
  ScheduleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleRepositoryHash();

  @$internal
  @override
  $ProviderElement<ScheduleRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ScheduleRepository create(Ref ref) {
    return scheduleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScheduleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScheduleRepository>(value),
    );
  }
}

String _$scheduleRepositoryHash() =>
    r'cbbd0adadc392e36de981842db8c5b60ed3f977c';

@ProviderFor(issueRepository)
final issueRepositoryProvider = IssueRepositoryProvider._();

final class IssueRepositoryProvider
    extends
        $FunctionalProvider<IssueRepository, IssueRepository, IssueRepository>
    with $Provider<IssueRepository> {
  IssueRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'issueRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$issueRepositoryHash();

  @$internal
  @override
  $ProviderElement<IssueRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IssueRepository create(Ref ref) {
    return issueRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IssueRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IssueRepository>(value),
    );
  }
}

String _$issueRepositoryHash() => r'e88caf1fc894b4676ef6e9458eb71c64632debac';

@ProviderFor(localRepository)
final localRepositoryProvider = LocalRepositoryProvider._();

final class LocalRepositoryProvider
    extends
        $FunctionalProvider<LocalRepository, LocalRepository, LocalRepository>
    with $Provider<LocalRepository> {
  LocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalRepository create(Ref ref) {
    return localRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepository>(value),
    );
  }
}

String _$localRepositoryHash() => r'222ecf20565efb763e24bff15a0cc534157afc67';

@ProviderFor(projectClientRepository)
final projectClientRepositoryProvider = ProjectClientRepositoryProvider._();

final class ProjectClientRepositoryProvider
    extends
        $FunctionalProvider<
          ClientRepository,
          ClientRepository,
          ClientRepository
        >
    with $Provider<ClientRepository> {
  ProjectClientRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectClientRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectClientRepositoryHash();

  @$internal
  @override
  $ProviderElement<ClientRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClientRepository create(Ref ref) {
    return projectClientRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClientRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClientRepository>(value),
    );
  }
}

String _$projectClientRepositoryHash() =>
    r'f7f0d5b7ddbc6d4ee6b9126a8c9cfd4d253ee720';

@ProviderFor(projectRepository)
final projectRepositoryProvider = ProjectRepositoryProvider._();

final class ProjectRepositoryProvider
    extends
        $FunctionalProvider<
          ProjectRepository,
          ProjectRepository,
          ProjectRepository
        >
    with $Provider<ProjectRepository> {
  ProjectRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProjectRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProjectRepository create(Ref ref) {
    return projectRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectRepository>(value),
    );
  }
}

String _$projectRepositoryHash() => r'38c84479cde03ce04d0affc1440c64a10c74f640';

@ProviderFor(sftpRepository)
final sftpRepositoryProvider = SftpRepositoryProvider._();

final class SftpRepositoryProvider
    extends $FunctionalProvider<SftpRepository, SftpRepository, SftpRepository>
    with $Provider<SftpRepository> {
  SftpRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sftpRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sftpRepositoryHash();

  @$internal
  @override
  $ProviderElement<SftpRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SftpRepository create(Ref ref) {
    return sftpRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SftpRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SftpRepository>(value),
    );
  }
}

String _$sftpRepositoryHash() => r'98ad3f21aae2fd7585b3407c4e4a9e702e672b2f';

@ProviderFor(supplierRepository)
final supplierRepositoryProvider = SupplierRepositoryProvider._();

final class SupplierRepositoryProvider
    extends
        $FunctionalProvider<
          SupplierRepository,
          SupplierRepository,
          SupplierRepository
        >
    with $Provider<SupplierRepository> {
  SupplierRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supplierRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supplierRepositoryHash();

  @$internal
  @override
  $ProviderElement<SupplierRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupplierRepository create(Ref ref) {
    return supplierRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupplierRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupplierRepository>(value),
    );
  }
}

String _$supplierRepositoryHash() =>
    r'3430dde8cd9b5d3e53cb6c70ef1edc022e199bc5';

@ProviderFor(reportRepository)
final reportRepositoryProvider = ReportRepositoryProvider._();

final class ReportRepositoryProvider
    extends
        $FunctionalProvider<
          ReportRepository,
          ReportRepository,
          ReportRepository
        >
    with $Provider<ReportRepository> {
  ReportRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReportRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReportRepository create(Ref ref) {
    return reportRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportRepository>(value),
    );
  }
}

String _$reportRepositoryHash() => r'3920fb52839d3449ae8dfaa643b2ba95155ccc52';

@ProviderFor(userRepository)
final userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'76ac51c907be91a7f185aeb1aac239ed05d0f6c1';

@ProviderFor(workRepository)
final workRepositoryProvider = WorkRepositoryProvider._();

final class WorkRepositoryProvider
    extends $FunctionalProvider<WorkRepository, WorkRepository, WorkRepository>
    with $Provider<WorkRepository> {
  WorkRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workRepositoryHash();

  @$internal
  @override
  $ProviderElement<WorkRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WorkRepository create(Ref ref) {
    return workRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkRepository>(value),
    );
  }
}

String _$workRepositoryHash() => r'd82b27c0b56b3da34e02cef65af630771592e10d';
