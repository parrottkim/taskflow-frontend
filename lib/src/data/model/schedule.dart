part of '../data.dart';

@Freezed(unionKey: 'type')
sealed class ScheduleCategory with _$ScheduleCategory {
  factory ScheduleCategory.domestic({
    required int id,
    required String name,
    required String color,
  }) = ScheduleDomestic;
  factory ScheduleCategory.overseas({
    required int id,
    required String name,
    required String color,
  }) = ScheduleOverseas;
  factory ScheduleCategory.center({
    required int id,
    required String name,
    required String color,
  }) = ScheduleCenter;
  factory ScheduleCategory.remote({
    required int id,
    required String name,
    required String color,
  }) = ScheduleRemote;

  factory ScheduleCategory.dummy() =>
      ScheduleCategory.domestic(id: 1, name: '임시 이름', color: '0');

  factory ScheduleCategory.fromJson(Map<String, dynamic> json) =>
      _$ScheduleCategoryFromJson(json);
}

@freezed
abstract class ScheduleGroup with _$ScheduleGroup {
  factory ScheduleGroup({
    required DateTime date,
    @Default([]) List<Schedule> items,
  }) = _ScheduleGroup;

  factory ScheduleGroup.dummy() => ScheduleGroup(date: DateTime.now());

  factory ScheduleGroup.fromJson(Map<String, dynamic> json) =>
      _$ScheduleGroupFromJson(json);
}

@freezed
abstract class Schedule with _$Schedule {
  factory Schedule({
    required int id,
    required int projectId,
    required String projectCode,
    required String projectName,
    required int projectClientId,
    required String projectClientName,
    required String eventId,
    required ScheduleCategory category,
    required User user,
    @Default('') String summary,
    String? description,
    @Default('') String url,
    required DateTime start,
    required DateTime end,
  }) = _Schedule;

  factory Schedule.dummy() => Schedule(
        id: 0,
        eventId: '임시 ID',
        projectId: 0,
        projectCode: '프로젝트 코드',
        projectName: '프로젝트 이름',
        projectClientId: 1,
        projectClientName: '공장명',
        category: ScheduleCategory.dummy(),
        user: User.dummy(),
        start: DateTime.now(),
        end: DateTime.now(),
      );

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}
