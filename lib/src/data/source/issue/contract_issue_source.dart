part of '../../data.dart';

class ContractIssueDataSource implements ContractIssueRepository {
  final ContractIssueService _service;

  ContractIssueDataSource({required this._service});

  @override
  Future<List<ContractIssueItem>> getContractIssueItems({required int id}) =>
      _service.getContractIssueItems(id: id);

  @override
  Future<HttpResponse<ContractIssue?>> getContractIssue({required int id}) =>
      _service.getContractIssue(id: id);

  @override
  Future<Issue> createContractIssue({
    required CreateContractIssueRequest request,
  }) => _service.createContractIssue(request: request);

  @override
  Future<Issue> updateContractIssue({
    required int id,
    required UpdateContractIssueRequest request,
  }) => _service.updateContractIssue(id: id, request: request);
}

@riverpod
ContractIssueRepository contractIssueRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return ContractIssueDataSource(service: ContractIssueService(dio));
}
