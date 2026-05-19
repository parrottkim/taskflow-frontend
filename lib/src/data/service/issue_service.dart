part of '../data.dart';

@RestApi()
abstract class IssueService {
  factory IssueService(Dio dio, {String baseUrl}) = _IssueService;

  @GET('issue/categories/{id}')
  Future<IssueCategory> getCategory({@Path() required int id});

  @GET('issue/categories')
  Future<List<IssueCategory>> getAllCategories();

  @GET('issue/transaction/categories')
  Future<List<TransactionIssueItemCategory>> getAllTransactionCategories();

  @GET('issue/latest')
  Future<Result<LatestIssue>> getLatestIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
  });

  @GET('issue/procurement/request/export/{id}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> exportPurchaseRequest({
    @Path() required int id,
  });

  @GET('issue/procurement/order/export/{id}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> exportPurchaseOrder({
    @Path() required int id,
  });

  @GET('issue/contract/item/{id}')
  Future<List<ContractIssueItem>> getContractIssueItems({
    @Path() required int id,
  });

  @GET('issue/transaction/item/{id}')
  Future<List<TransactionIssueItem>> getTransactionIssueItems({
    @Path() required int id,
  });

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
  Future<void> sendMail({
    @Path() required int id,
    @Body() required SendIssueMailDto request,
  });

  @POST('issue/contract')
  Future<Issue> createContractIssue({
    @Body() required CreateContractIssueDto request,
  });

  @POST('issue/kickoff')
  Future<Issue> createKickoffIssue({
    @Body() required CreateKickoffIssueDto request,
  });

  @POST('issue/transaction')
  Future<Issue> createTransactionIssue({
    @Body() required CreateTransactionIssueDto request,
  });

  @POST('issue/approval')
  Future<Issue> createApprovalIssue({
    @Body() required CreateApprovalIssueDto request,
  });

  @PATCH('issue/{id}/procurement/request')
  Future<Issue> createProcurementIssueRequest({
    @Path() required int id,
    @Body() required CreateProcurementIssueRequestDto request,
  });

  @POST('issue/procurement')
  Future<Issue> createProcurementIssue({
    @Body() required CreateProcurementIssueDto request,
  });

  @POST('issue/payment')
  Future<Issue> createPaymentIssue({
    @Body() required CreatePaymentIssueDto request,
  });

  @PATCH('issue/{id}/contract')
  Future<Issue> updateContractIssue({
    @Path() required int id,
    @Body() required UpdateContractIssueDto request,
  });

  @PATCH('issue/{id}/kickoff')
  Future<Issue> updateKickoffIssue({
    @Path() required int id,
    @Body() required UpdateKickoffIssueDto request,
  });

  @PATCH('issue/{id}/transaction')
  Future<Issue> updateTransactionIssue({
    @Path() required int id,
    @Body() required UpdateTransactionIssueDto request,
  });

  @PATCH('issue/{id}/approval')
  Future<Issue> updateApprovalIssue({
    @Path() required int id,
    @Body() required UpdateApprovalIssueDto request,
  });

  @PATCH('issue/{id}/procurement')
  Future<Issue> updateProcurementIssue({
    @Path() required int id,
    @Body() required UpdateProcurementIssueDto request,
  });

  @PATCH('issue/{id}/payment')
  Future<Issue> updatePaymentIssue({
    @Path() required int id,
    @Body() required UpdatePaymentIssueDto request,
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
