part of '../data.dart';

@RestApi()
abstract class ProjectService {
  factory ProjectService(Dio dio, {String baseUrl}) = _ProjectService;

  @GET('project/stats')
  Future<Result<ProjectStats>> getProjectStats({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('start')
    @DateTimeConverter(format: 'yyyy-MM-dd')
    required DateTime start,
    @Query('end')
    @DateTimeConverter(format: 'yyyy-MM-dd')
    required DateTime end,
  });

  @GET('project/summary')
  Future<ProjectSummary> getProjectSummary({
    @Query('start')
    @DateTimeConverter(format: 'yyyy-MM-dd')
    required DateTime start,
    @Query('end')
    @DateTimeConverter(format: 'yyyy-MM-dd')
    required DateTime end,
  });

  @GET('project/{id}')
  Future<Project> getProject({
    @Path() required int id,
  });

  @GET('project/{id}/edit')
  Future<Project> getProjectForEdit({
    @Path() required int id,
  });

  @GET('project')
  Future<Result<Project>> getProjects({
    @Query('page') int page = 1,
    @Query('limit') int limit = 40,
    @Query('view') String? view,
    @Query('sort') String? sort,
    @Query('order') String? order,
    @Query('search') String? search,
    @Query('bookmark') String? bookmark,
    @Query('clients') String? clients,
    @Query('categories') String? categories,
  });

  @POST('project')
  Future<Project> createProject({
    @Body() required CreateProjectRequest request,
  });

  @PATCH('project/{id}')
  Future<Project> updateProject({
    @Path('id') required int id,
    @Body() required UpdateProjectRequest request,
  });

  @DELETE('project/{id}')
  Future<void> deleteProject({@Path() required int id});

  @PATCH('project/{id}/restore')
  Future<Project> restoreProject({@Path() required int id});
}
