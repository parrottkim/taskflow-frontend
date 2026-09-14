part of '../../data.dart';

class PaymentIssueDataSource implements PaymentIssueRepository {
  final PaymentIssueService _service;

  PaymentIssueDataSource({required this._service});

  @override
  Future<HttpResponse<PaymentIssue?>> getPaymentIssue({required int id}) =>
      _service.getPaymentIssue(id: id);

  @override
  Future<Issue> createPaymentIssue({
    required CreatePaymentIssueRequest request,
  }) => _service.createPaymentIssue(request: request);

  @override
  Future<Issue> updatePaymentIssue({
    required int id,
    required UpdatePaymentIssueRequest request,
  }) => _service.updatePaymentIssue(id: id, request: request);
}

@riverpod
PaymentIssueRepository paymentIssueRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return PaymentIssueDataSource(service: PaymentIssueService(dio));
}
