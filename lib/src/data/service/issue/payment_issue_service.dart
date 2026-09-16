part of '../../data.dart';

@RestApi()
abstract class PaymentIssueService {
  factory PaymentIssueService(Dio dio, {String baseUrl}) = _PaymentIssueService;

  @GET('issue/payment/{id}')
  Future<HttpResponse<PaymentIssue?>> getPaymentIssue({
    @Path('id') required int id,
  });

  @POST('issue/payment')
  Future<Issue> createPaymentIssue({
    @Body() required CreatePaymentIssueRequest request,
  });

  @PATCH('issue/payment/{id}')
  Future<Issue> updatePaymentIssue({
    @Path('id') required int id,
    @Body() required UpdatePaymentIssueRequest request,
  });
}
