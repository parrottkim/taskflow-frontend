part of '../data.dart';

class ClientDataSource implements ClientRepository {
  final ClientService _service;

  ClientDataSource({required ClientService service}) : _service = service;

  @override
  Future<List<ClientGroup>> getAllClients() => _service.getAllClients();

  @override
  Future<List<ClientCount>> getAllClientCount() => _service.getAllClientCount();

  @override
  Future<List<Client>> getClientRelations({
    required int id,
    bool isDescendant = true,
  }) => _service.getClientRelations(id: id, isDescendant: isDescendant);
}

@riverpod
ClientRepository projectClientRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return ClientDataSource(service: ClientService(dio));
}
