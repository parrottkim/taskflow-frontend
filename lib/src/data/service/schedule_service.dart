part of '../data.dart';

@RestApi()
abstract class ScheduleService {
  factory ScheduleService(Dio dio, {String baseUrl}) = _ScheduleService;

  @GET('schedule/categories')
  Future<List<ScheduleCategory>> getAllCategories();

  @GET('schedule/{id}')
  Future<Schedule> getSchedule({
    @Path() required int id,
  });

  @GET('schedule')
  Future<Result<Schedule>> getSchedules({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('project_id') required int projectId,
    @Query('search') String? search,
    @Query('start') @DateTimeConverter(format: 'yyyy-MM-dd') DateTime? start,
    @Query('end') @DateTimeConverter(format: 'yyyy-MM-dd') DateTime? end,
  });

  @GET('schedule/today')
  Future<List<Schedule>> getTodaysSchedule();

  @POST('schedule')
  Future<Schedule> createSchedule({
    @Body() required ScheduleRequest request,
  });

  @PATCH('schedule/{id}')
  Future<Schedule> updateSchedule({
    @Path('id') required int id,
    @Body() required ScheduleRequest request,
  });

  @DELETE('schedule/{id}')
  Future<void> deleteSchedule({
    @Path('id') required int id,
  });
}
