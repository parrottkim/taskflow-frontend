part of '../../data.dart';

@RestApi()
abstract class ApprovalIssueService {
  factory ApprovalIssueService(Dio dio, {String baseUrl}) =
      _ApprovalIssueService;

  @GET('issue/approval')
  Future<Result<ApprovalIssue>> getApprovalIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('project_id') required int projectId,
  });

  @POST('issue/approval')
  Future<Issue> createApprovalIssue({
    @Body() required CreateApprovalIssueRequest request,
  });

  @PATCH('issue/approval/{id}')
  Future<Issue> updateApprovalIssue({
    @Path('id') required int id,
    @Body() required UpdateApprovalIssueRequest request,
  });
}
