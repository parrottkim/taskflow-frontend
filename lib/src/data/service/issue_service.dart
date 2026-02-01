part of '../data.dart';

@RestApi()
abstract class IssueService {
  factory IssueService(Dio dio, {String baseUrl}) = _IssueService;

  @GET('issue/categories/{id}')
  Future<IssueCategory> getCategory({@Path() required int id});

  @GET('issue/categories')
  Future<List<IssueCategory>> getAllCategories();

  @GET('issue/transaction/categories')
  Future<List<TransactionItemCategory>> getAllTransactionCategories();

  @GET('issue/latest')
  Future<Result<LatestIssue>> getLatestIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
  });

  @GET('issue/contract/item/{id}')
  Future<List<ContractItem>> getContractItems({@Path() required int id});

  @GET('issue/transaction/item/{id}')
  Future<List<TransactionItem>> getTransactionItems({@Path() required int id});

  @GET('issue/contract/{id}')
  Future<HttpResponse<ContractIssue?>> getContractIssue({
    @Path() required int id,
  });

  @GET('issue/kickoff/{id}')
  Future<HttpResponse<KickoffIssue?>> getKickoffIssue({
    @Path() required int id,
  });

  @GET('issue/transaction/{id}')
  Future<HttpResponse<TransactionIssue?>> getTransactionIssue({
    @Path() required int id,
  });

  @GET('issue/payment/{id}')
  Future<HttpResponse<PaymentIssue?>> getPaymentIssue({
    @Path() required int id,
  });

  @GET('issue/approval')
  Future<Result<ApprovalIssue>> getApprovalIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('project_id') required int projectId,
  });

  @GET('issue/procurement')
  Future<Result<ProcurementIssue>> getProcurementIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('project_id') required int projectId,
  });

  @GET('issue/{id}')
  Future<Issue> getIssue({@Path() required int id});

  @POST('issue/mail/{id}')
  Future<void> sendMail({@Path() required int id});

  @POST('issue')
  Future<Issue> createIssue({@Body() required CreateIssueRequest request});

  @PATCH('issue/{id}')
  Future<Issue> updateIssue({
    @Path('id') required int id,
    @Body() required UpdateIssueRequest request,
  });

  @DELETE('issue/{id}')
  Future<Issue> deleteIssue({@Path() required int id});

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
