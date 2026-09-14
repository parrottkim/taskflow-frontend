part of '../../data.dart';

@RestApi()
abstract class KickoffIssueService {
  factory KickoffIssueService(Dio dio, {String baseUrl}) = _KickoffIssueService;

  @GET('issue/kickoff/{id}')
  Future<HttpResponse<KickoffIssue?>> getKickoffIssue({
    @Path('id') required int id,
  });

  @POST('issue/kickoff')
  Future<Issue> createKickoffIssue({
    @Body() required CreateKickoffIssueRequest request,
  });

  @PATCH('issue/kickoff/{id}')
  Future<Issue> updateKickoffIssue({
    @Path('id') required int id,
    @Body() required UpdateKickoffIssueRequest request,
  });
}
