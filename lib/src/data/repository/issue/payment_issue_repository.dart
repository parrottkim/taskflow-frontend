part of '../../data.dart';

abstract class PaymentIssueRepository {
  Future<HttpResponse<PaymentIssue?>> getPaymentIssue({required int id});

  Future<Issue> createPaymentIssue({
    required CreatePaymentIssueRequest request,
  });

  Future<Issue> updatePaymentIssue({
    required int id,
    required UpdatePaymentIssueRequest request,
  });
}
