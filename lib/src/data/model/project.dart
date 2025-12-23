part of '../data.dart';

@freezed
abstract class Project with _$Project {
  factory Project({
    required int id,
    required String code,
    required String name,
    required int views,
    required User user,
    User? manager,
    required IssueCategory? latestCategory,
    required bool isPreexecuted,
    required bool isContracted,
    required bool isClosed,
    String? closureMessage,
    required bool isBookmarked,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime? deletedAt,
    required List<Client> clients,
  }) = _Project;

  factory Project.dummy() => Project(
        id: 0,
        code: 'Dummy Project Code',
        name: 'Dummy Project Name',
        views: 0,
        user: User.dummy(),
        latestCategory: null,
        isPreexecuted: false,
        isContracted: false,
        isClosed: false,
        isBookmarked: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        clients: [Client.dummy()],
      );

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@freezed
abstract class ProjectSummary with _$ProjectSummary {
  factory ProjectSummary({
    required int total,
    required int closed,
    required int kickedOff,
    required int active,
  }) = _ProjectSummary;

  factory ProjectSummary.dummy() =>
      ProjectSummary(total: 100, closed: 50, kickedOff: 20, active: 30);

  factory ProjectSummary.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryFromJson(json);
}

@freezed
abstract class Client with _$Client {
  factory Client({required int id, required String name}) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  factory Client.dummy() => Client(id: 1, name: '');
}

@freezed
abstract class ClientGroup with _$ClientGroup {
  factory ClientGroup({
    required int depth,
    int? parentId,
    required List<Client> items,
  }) = _ClientGroup;

  factory ClientGroup.fromJson(Map<String, dynamic> json) =>
      _$ClientGroupFromJson(json);
}

@freezed
abstract class ProjectStats with _$ProjectStats {
  factory ProjectStats({
    required int valid,
    required int total,
    required User user,
  }) = _ProjectStats;

  factory ProjectStats.dummy() => ProjectStats(
        valid: 0,
        total: 10,
        user: User(id: 0, email: 'test@test.com', username: '홍길동'),
      );

  factory ProjectStats.fromJson(Map<String, dynamic> json) =>
      _$ProjectStatsFromJson(json);
}

@freezed
abstract class ProjectItemCount with _$ProjectItemCount {
  factory ProjectItemCount({
    @Default(0) int contracts,
    @Default(0) int declarations,
    @Default(0) int procurements,
    @Default(0) int reports,
  }) = _ProjectItemCount;

  factory ProjectItemCount.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemCountFromJson(json);
}
