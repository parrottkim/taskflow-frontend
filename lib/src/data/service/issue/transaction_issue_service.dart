part of '../../data.dart';

@RestApi()
abstract class TransactionIssueService {
  factory TransactionIssueService(Dio dio, {String baseUrl}) =
      _TransactionIssueService;

  @GET('issue/transaction/categories')
  Future<List<TransactionIssueItemCategory>> getAllTransactionCategories();

  @GET('issue/transaction/{id}')
  Future<HttpResponse<TransactionIssue?>> getTransactionIssue({
    @Path('id') required int id,
  });

  @POST('issue/transaction')
  Future<Issue> createTransactionIssue({
    @Body() required CreateTransactionIssueRequest request,
  });

  @PATCH('issue/transaction/{id}')
  Future<Issue> updateTransactionIssue({
    @Path('id') required int id,
    @Body() required UpdateTransactionIssueRequest request,
  });
}
