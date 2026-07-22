part of '../data.dart';

typedef WorkProjectListItem = ProjectListItem;

@freezed
abstract class WorkIssueListItem with _$WorkIssueListItem {
  factory WorkIssueListItem({
    required int id,
    required int projectId,
    required String projectCode,
    required String projectName,
    required IssueCategory category,
    required List<Client> clients,
    required User createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WorkIssueListItem;

  factory WorkIssueListItem.fromJson(Map<String, dynamic> json) =>
      _$WorkIssueListItemFromJson(json);

  factory WorkIssueListItem.dummy() => WorkIssueListItem(
    id: 0,
    projectId: 0,
    projectCode: 'Dummy Project Code',
    projectName: 'Dummy Project Name',
    category: IssueCategory.dummy(),
    clients: [Client.dummy()],
    createdBy: User.dummy(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

@freezed
abstract class WorkReportListItem with _$WorkReportListItem {
  factory WorkReportListItem({
    required int id,
    required int projectId,
    required String projectCode,
    required String projectName,
    required List<Client> clients,
    Schedule? schedule,
    required User createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WorkReportListItem;

  factory WorkReportListItem.fromJson(Map<String, dynamic> json) =>
      _$WorkReportListItemFromJson(json);

  factory WorkReportListItem.dummy() => WorkReportListItem(
    id: 0,
    projectId: 0,
    projectCode: 'Dummy Project Code',
    projectName: 'Dummy Project Name',
    clients: [Client.dummy()],
    createdBy: User.dummy(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}
