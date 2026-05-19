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

  Future<Schedule> createSchedule({required ScheduleDto request});

  Future<Schedule> updateSchedule(
      {required int id, required ScheduleDto request});

  Future<void> deleteSchedule({required int id});
}
