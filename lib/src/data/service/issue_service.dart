part of '../data.dart';

@RestApi()
abstract class IssueService {
  factory IssueService(Dio dio, {String baseUrl}) = _IssueService;

  @GET('issue/categories')
  Future<List<IssueCategory>> getAllCategories();

  @GET('issue/transaction/categories')
  Future<List<TransactionItemCategory>> getAllTransactionCategories();

  @GET('issue/latest')
  Future<Result<LatestIssue>> getLatestIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
  });

  @GET('issue/{id}')
  Future<Issue> getIssue({@Path() required int id});

  @GET('issue')
  Future<Result<Issue>> getIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('project_id') required int projectId,
  });

  @POST('issue')
  Future<Issue> createIssue({
    @Body() required CreateIssueRequest request,
  });

  @PATCH('issue/{id}')
  Future<Issue> updateIssue({
    @Path('id') required int id,
    @Body() required UpdateIssueRequest request,
  });

  @DELETE('issue/{id}')
  Future<void> deleteIssue({@Path() required int id});

  @PATCH('issue/{id}/restore')
  Future<Issue> restoreIssue({@Path() required int id});

  @POST('issue/{issue_id}/attachments')
  @MultiPart()
  Future<List<IssueAttachment>> uploadAttachments({
    @Path('issue_id') required int issueId,
    @Part() required List<MultipartFile> files,
  });

  @DELETE('issue/{issue_id}/attachments/{file_id}')
  Future<void> deleteAttachment({
    @Path('issue_id') required int issueId,
    @Path('file_id') required int fileId,
  });
}
