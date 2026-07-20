part of '../data.dart';

abstract class ScheduleRepository {
  Future<List<ScheduleCategory>> getAllCategories();

  Future<Schedule> getScheduleForEdit({required int id});

  Future<Schedule> getSchedule({required int id});

  Future<Result<ScheduleGroup>> getSchedules({
    int? projectId,
    int? userId,
    int? departmentId,
    String? search,
    DateTime? start,
    DateTime? end,
  });

  Future<Schedule> createSchedule({required UpsertScheduleRequest request});

  Future<Schedule> updateSchedule({
    required int id,
    required UpsertScheduleRequest request,
  });

  Future<void> deleteSchedule({required int id});
}
