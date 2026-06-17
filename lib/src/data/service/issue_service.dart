part of '../data.dart';

@RestApi()
abstract class IssueService {
  factory IssueService(Dio dio, {String baseUrl}) = _IssueService;

  // =========================================================================
  // [공통 & 글로벌 마스터 API] - 고정형 주소 (최상단)
  // =========================================================================
  @GET('issue/categories')
  Future<List<IssueCategory>> getAllCategories();

  @GET('issue/latest')
  Future<Result<LatestIssue>> getLatestIssues({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
  });

  @GET('issue/transaction/categories')
  Future<List<TransactionIssueItemCategory>> getAllTransactionCategories();

  // =========================================================================
  // [도메인별 목록 조회 API] - 파라미터가 없는 목록 주소 (차상단)
  // =========================================================================
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

  // =========================================================================
  // [도메인별 세부 액션 및 하위 조회 API] - 꼬리가 붙은 주소들 (`/:id/하위주소`)
  // =========================================================================

  // --- CONTRACT ---
  @GET('issue/contract/{id}/items')
  Future<List<ContractIssueItem>> getContractIssueItems({
    @Path('id') required int id,
  });

  // --- PROCUREMENT ---
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

  @PATCH('issue/procurement/{id}/request')
  Future<Issue> createProcurementIssueRequest({
    @Path('id') required int id,
    @Body() required CreateProcurementIssueRequestDto request,
  });

  @PATCH('issue/procurement/{id}/approve')
  Future<void> approveProcurementIssueRequest({@Path('id') required int id});

  // --- TRANSACTION ---
  @GET('issue/transaction/{id}/items')
  Future<List<TransactionIssueItem>> getTransactionIssueItems({
    @Path('id') required int id,
  });

  // =========================================================================
  // [도메인별 단독 ID 및 CUD API] - 각 카테고리별 기본 `/카테고리/:id` 형태들
  // =========================================================================

  // --- CONTRACT ---
  @GET('issue/contract/{id}')
  Future<HttpResponse<ContractIssue?>> getContractIssue({
    @Path('id') required int id,
  });

  @POST('issue/contract')
  Future<Issue> createContractIssue({
    @Body() required CreateContractIssueDto request,
  });

  @PATCH('issue/contract/{id}')
  Future<Issue> updateContractIssue({
    @Path('id') required int id,
    @Body() required UpdateContractIssueDto request,
  });

  // --- KICKOFF ---
  @GET('issue/kickoff/{id}')
  Future<HttpResponse<KickoffIssue?>> getKickoffIssue({
    @Path('id') required int id,
  });

  @POST('issue/kickoff')
  Future<Issue> createKickoffIssue({
    @Body() required CreateKickoffIssueDto request,
  });

  @PATCH('issue/kickoff/{id}')
  Future<Issue> updateKickoffIssue({
    @Path('id') required int id,
    @Body() required UpdateKickoffIssueDto request,
  });

  // --- APPROVAL ---
  @POST('issue/approval')
  Future<Issue> createApprovalIssue({
    @Body() required CreateApprovalIssueDto request,
  });

  @PATCH('issue/approval/{id}')
  Future<Issue> updateApprovalIssue({
    @Path('id') required int id,
    @Body() required UpdateApprovalIssueDto request,
  });

  // --- PROCUREMENT ---
  @POST('issue/procurement')
  Future<Issue> createProcurementIssue({
    @Body() required CreateProcurementIssueDto request,
  });

  @PATCH('issue/procurement/{id}')
  Future<Issue> updateProcurementIssue({
    @Path('id') required int id,
    @Body() required UpdateProcurementIssueDto request,
  });

  // --- TRANSACTION ---
  @GET('issue/transaction/{id}')
  Future<HttpResponse<TransactionIssue?>> getTransactionIssue({
    @Path('id') required int id,
  });

  @POST('issue/transaction')
  Future<Issue> createTransactionIssue({
    @Body() required CreateTransactionIssueDto request,
  });

  @PATCH('issue/transaction/{id}')
  Future<Issue> updateTransactionIssue({
    @Path('id') required int id,
    @Body() required UpdateTransactionIssueDto request,
  });

  // --- PAYMENT ---
  @GET('issue/payment/{id}')
  Future<HttpResponse<PaymentIssue?>> getPaymentIssue({
    @Path('id') required int id,
  });

  @POST('issue/payment')
  Future<Issue> createPaymentIssue({
    @Body() required CreatePaymentIssueDto request,
  });

  @PATCH('issue/payment/{id}')
  Future<Issue> updatePaymentIssue({
    @Path('id') required int id,
    @Body() required UpdatePaymentIssueDto request,
  });

  // =========================================================================
  // [글로벌 터미널 및 공통 ID 액션] - 포괄적 와일드카드 (최하단 격리)
  // =========================================================================
  @GET('issue/categories/{id}')
  Future<IssueCategory> getCategory({@Path('id') required int id});

  @POST('issue/mail/{id}')
  Future<void> sendMail({
    @Path('id') required int id,
    @Body() required SendIssueMailDto request,
  });

  @GET('issue/{id}/procurement/request')
  Future<Issue> getIssueForProcurementRequest({@Path('id') required int id});

  @GET('issue/{id}/edit')
  Future<Issue> getIssueForEdit({@Path('id') required int id});

  @GET('issue/{id}')
  Future<Issue> getIssue({@Path('id') required int id});

  @DELETE('issue/{id}')
  Future<Issue> deleteIssue({@Path('id') required int id});

  @PATCH('issue/{id}/restore')
  Future<Issue> restoreIssue({@Path('id') required int id});

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
