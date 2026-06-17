part of '../data.dart';

@RestApi()
abstract class ScheduleService {
  factory ScheduleService(Dio dio, {String baseUrl}) = _ScheduleService;

  @GET('schedule/categories')
  Future<List<ScheduleCategory>> getAllCategories();

  @GET('schedule/{id}/edit')
  Future<Schedule> getScheduleForEdit({@Path() required int id});

  @GET('schedule/{id}')
  Future<Schedule> getSchedule({@Path() required int id});

  @GET('schedule')
  Future<Result<ScheduleGroup>> getSchedules({
    @Query('project_id') int? projectId,
    @Query('search') String? search,
    @Query('start') @DateTimeConverter(format: 'yyyy-MM-dd') DateTime? start,
    @Query('end') @DateTimeConverter(format: 'yyyy-MM-dd') DateTime? end,
  });

  @POST('schedule')
  Future<Schedule> createSchedule({@Body() required ScheduleDto request});

  @PATCH('schedule/{id}')
  Future<Schedule> updateSchedule({
    @Path('id') required int id,
    @Body() required ScheduleDto request,
  });

  @DELETE('schedule/{id}')
  Future<void> deleteSchedule({@Path('id') required int id});
}
