part of '../data.dart';

enum DashboardSearchItemType { project, document, schedule, issue, report }

@freezed
abstract class DashboardSearchItem with _$DashboardSearchItem {
  factory DashboardSearchItem({
    required DashboardSearchItemType type,
    required int id,
    required String title,
    String? subtitle,
    int? projectId,
    String? projectCode,
    String? projectName,
    int? folderId,
    String? folderName,
    int? categoryId,
    String? categoryName,
    String? categoryType,
    DateTime? start,
    DateTime? end,
    required DateTime updatedAt,
  }) = _DashboardSearchItem;

  factory DashboardSearchItem.fromJson(Map<String, dynamic> json) =>
      _$DashboardSearchItemFromJson(json);
}

@freezed
abstract class DashboardSearchGroup with _$DashboardSearchGroup {
  factory DashboardSearchGroup({
    @Default([]) List<DashboardSearchItem> items,
    @Default(0) int total,
  }) = _DashboardSearchGroup;

  factory DashboardSearchGroup.fromJson(Map<String, dynamic> json) =>
      _$DashboardSearchGroupFromJson(json);
}

@freezed
abstract class DashboardSearchResult with _$DashboardSearchResult {
  factory DashboardSearchResult({
    required DashboardSearchGroup projects,
    required DashboardSearchGroup documents,
    required DashboardSearchGroup schedules,
    required DashboardSearchGroup issues,
    required DashboardSearchGroup reports,
  }) = _DashboardSearchResult;

  factory DashboardSearchResult.fromJson(Map<String, dynamic> json) =>
      _$DashboardSearchResultFromJson(json);
}
