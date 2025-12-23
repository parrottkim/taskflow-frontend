part of '../data.dart';

@RestApi()
abstract class ReportService {
  factory ReportService(Dio dio, {String baseUrl}) = _ReportService;

  @GET('report/trip/categories')
  Future<List<TripCategory>> getAllTripCategories();

  @GET('report/trip/steps/{id}')
  Future<List<TripStep>> getAllTripSteps({
    @Path() required int id,
  });

  @GET('report/trip/regulations/{id}')
  Future<List<TripRegulation>> getAllTripRegulations({
    @Path() required int id,
  });

  @GET('report/trip/export/{id}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> exportTrip({@Path() required int id});

  @GET('report/{id}')
  Future<Report> getReport({@Path() required int id});

  @GET('report')
  Future<Result<Report>> getReports({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('project_id') required int projectId,
  });

  @POST('report/mail/{id}')
  Future<void> sendMail({@Path() required int id});

  @POST('report')
  Future<Report> createReport({
    @Body() required CreateReportRequest request,
  });

  @PATCH('report/{id}')
  Future<Report> updateReport({
    @Path() required int id,
    @Body() required UpdateReportRequest request,
  });

  @DELETE('report/{id}')
  Future<void> deleteReport({
    @Path() required int id,
  });

  @POST('report/{report_id}/attachments')
  @MultiPart()
  Future<List<ReportAttachment>> uploadAttachments({
    @Path('report_id') required int reportId,
    @Part() required List<MultipartFile> files,
  });

  @DELETE('report/{report_id}/attachments/{file_id}')
  Future<void> deleteAttachment({
    @Path('report_id') required int reportId,
    @Path('file_id') required int fileId,
  });
}
