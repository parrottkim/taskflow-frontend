part of '../data.dart';

class ScheduleDataSource implements ScheduleRepository {
  final ScheduleService _service;

  ScheduleDataSource({required ScheduleService service}) : _service = service;

  @override
  Future<List<ScheduleCategory>> getAllCategories() =>
      _service.getAllCategories();

  @override
  Future<Schedule> getSchedule({required int id}) =>
      _service.getSchedule(id: id);

  @override
  Future<Result<ScheduleGroup>> getSchedules({
    required int projectId,
    String? search,
    DateTime? start,
    DateTime? end,
  }) =>
      _service.getSchedules(
          projectId: projectId, search: search, start: start, end: end);

  @override
  Future<List<Schedule>> getTodaysSchedule() => _service.getTodaysSchedule();

  @override
  Future<Schedule> createSchedule({required ScheduleRequest request}) =>
      _service.createSchedule(request: request);

  @override
  Future<Schedule> updateSchedule(
          {required int id, required ScheduleRequest request}) =>
      _service.updateSchedule(id: id, request: request);

  @override
  Future<void> deleteSchedule({required int id}) =>
      _service.deleteSchedule(id: id);
}

@riverpod
ScheduleRepository scheduleRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return ScheduleDataSource(service: ScheduleService(dio));
}
