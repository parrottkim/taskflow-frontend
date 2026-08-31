part of '../data.dart';

enum DraftFormType { report, issue, procurementIssue, document }

enum DraftMode { create, edit }

enum DraftSyncStatus { pending, syncing, synced, failed }

enum DraftAssetType { inlineImage, attachment }

enum DraftAssetUploadStatus { pending, uploading, uploaded, failed }

abstract final class DraftPayloadVersion {
  static const document = 1;
  static const issue = 1;
  static const report = 1;
}

final class DraftRestore<T> {
  final T payload;
  final List<XFile> files;

  const DraftRestore({required this.payload, required this.files});
}

@freezed
abstract class Draft with _$Draft {
  const factory Draft({
    required String id,
    required int userId,
    required DraftFormType type,
    required DraftMode mode,
    required int version,
    required Map<String, dynamic> context,
    required Map<String, dynamic> payload,
    @Default(DraftSyncStatus.pending) DraftSyncStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? entityId,
    int? revision,
  }) = _Draft;

  factory Draft.fromJson(Map<String, dynamic> json) => _$DraftFromJson(json);
}

@freezed
abstract class DraftAsset with _$DraftAsset {
  const factory DraftAsset({
    required String id,
    required String draftId,
    @BufferConverter() required Uint8List bytes,
    required String mime,
    required DraftAssetType type,
    @Default(DraftAssetUploadStatus.pending) DraftAssetUploadStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? fileName,
    String? remoteUrl,
  }) = _DraftAsset;

  factory DraftAsset.fromJson(Map<String, dynamic> json) =>
      _$DraftAssetFromJson(json);
}

@freezed
abstract class IssueDraftPayload with _$IssueDraftPayload {
  const factory IssueDraftPayload({
    required IssueCategory category,
    String? content,
    Currency? currency,
    DateTime? kickoffDate,
    @Default([]) List<ContractIssueItem> contractItems,
    @Default([]) List<TransactionIssueItem> transactionItems,
    @Default([]) List<ProcurementIssueItem> procurementItems,
  }) = _IssueDraftPayload;

  factory IssueDraftPayload.fromJson(Map<String, dynamic> json) =>
      _$IssueDraftPayloadFromJson(json);
}

@freezed
abstract class ReportDraftPayload with _$ReportDraftPayload {
  const factory ReportDraftPayload({
    required TripReport trip,
    String? content,
    Schedule? schedule,
  }) = _ReportDraftPayload;

  factory ReportDraftPayload.fromJson(Map<String, dynamic> json) =>
      _$ReportDraftPayloadFromJson(json);
}

@freezed
abstract class DocumentDraftPayload with _$DocumentDraftPayload {
  const factory DocumentDraftPayload({
    int? folderId,
    String? title,
    String? content,
    @Default(false) bool fixed,
  }) = _DocumentDraftPayload;

  factory DocumentDraftPayload.fromJson(Map<String, dynamic> json) =>
      _$DocumentDraftPayloadFromJson(json);
}
