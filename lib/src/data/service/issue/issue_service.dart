part of '../../data.dart';

@RestApi()
abstract class IssueService {
  factory IssueService(Dio dio, {String baseUrl}) = _IssueService;

  @GET('issue/categories')
  Future<List<IssueCategory>> getAllCategories();

  @GET('issue/latest')
  Future<Result<LatestIssue>> getLatestIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
  });

  @GET('issue/categories/{id}')
  Future<IssueCategory> getCategory({@Path('id') required int id});

  @POST('issue/mail/{id}')
  Future<void> sendMail({
    @Path('id') required int id,
    @Body() required SendMailRequest request,
  });

  @GET('issue/{id}/edit')
  Future<Issue> getIssueForEdit({@Path('id') required int id});

  @GET('issue/{id}')
  Future<Issue> getIssue({@Path('id') required int id});

  @DELETE('issue/{id}')
  Future<Issue> deleteIssue({@Path('id') required int id});

  @PATCH('issue/{id}/restore')
  Future<Issue> restoreIssue({@Path('id') required int id});
}
