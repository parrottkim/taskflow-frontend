part of '../../data.dart';

@RestApi()
abstract class ContractIssueService {
  factory ContractIssueService(Dio dio, {String baseUrl}) =
      _ContractIssueService;

  @GET('issue/contract/{id}/items')
  Future<List<ContractIssueItem>> getContractIssueItems({
    @Path('id') required int id,
  });

  @GET('issue/contract/{id}')
  Future<HttpResponse<ContractIssue?>> getContractIssue({
    @Path('id') required int id,
  });

  @POST('issue/contract')
  Future<Issue> createContractIssue({
    @Body() required CreateContractIssueRequest request,
  });

  @PATCH('issue/contract/{id}')
  Future<Issue> updateContractIssue({
    @Path('id') required int id,
    @Body() required UpdateContractIssueRequest request,
  });
}
