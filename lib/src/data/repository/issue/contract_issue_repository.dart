part of '../../data.dart';

abstract class ContractIssueRepository {
  Future<HttpResponse<ContractIssue?>> getContractIssue({required int id});

  Future<Issue> createContractIssue({
    required CreateContractIssueRequest request,
  });

  Future<Issue> updateContractIssue({
    required int id,
    required UpdateContractIssueRequest request,
  });
}
