part of '../../data.dart';

@RestApi()
abstract class ProcurementIssueService {
  factory ProcurementIssueService(Dio dio, {String baseUrl}) =
      _ProcurementIssueService;

  @GET('issue/procurement')
  Future<Result<ProcurementIssue>> getProcurementIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('project_id') required int projectId,
  });

  @GET('issue/procurement/{id}/export-request')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> exportPurchaseRequest({
    @Path('id') required int id,
  });

  @GET('issue/procurement/{id}/export-order')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> exportPurchaseOrder({
    @Path('id') required int id,
  });

  @GET('issue/{id}/procurement/request')
  Future<Issue> getIssueForProcurementRequest({@Path('id') required int id});

  @PATCH('issue/procurement/{id}/request')
  Future<Issue> createProcurementIssueRequest({
    @Path('id') required int id,
    @Body() required UpsertProcurementRequest request,
  });

  @PATCH('issue/procurement/request/{id}')
  Future<Issue> updateProcurementIssueRequest({
    @Path('id') required int id,
    @Body() required UpsertProcurementRequest request,
  });

  @PATCH('issue/procurement/{id}/approve')
  Future<void> approveProcurementIssueRequest({@Path('id') required int id});

  @DELETE('issue/procurement/request/{id}')
  Future<void> deleteProcurementIssueRequest({@Path('id') required int id});

  @POST('issue/procurement')
  Future<Issue> createProcurementIssue({
    @Body() required CreateProcurementIssueRequest request,
  });

  @PATCH('issue/procurement/{id}')
  Future<Issue> updateProcurementIssue({
    @Path('id') required int id,
    @Body() required UpdateProcurementIssueRequest request,
  });
}
