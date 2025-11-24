part of '../data.dart';

abstract class ScheduleRepository {
  Future<List<ScheduleCategory>> getAllCategories();

  Future<Schedule> getSchedule({required int id});

  Future<Result<ScheduleGroup>> getSchedules({
    int? projectId,
    String? search,
    DateTime? start,
    DateTime? end,
  });

  Future<List<Schedule>> getTodaysSchedule();

  Future<Schedule> createSchedule({required ScheduleRequest request});

  Future<Schedule> updateSchedule(
      {required int id, required ScheduleRequest request});

  Future<void> deleteSchedule({required int id});
}
