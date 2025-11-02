part of '../data.dart';

@RestApi()
abstract class ClientService {
  factory ClientService(Dio dio, {String baseUrl}) = _ClientService;

  @GET('project-client')
  Future<List<ClientGroup>> getAllClients();

  @GET('project-client/count')
  Future<List<ClientCount>> getAllClientCount();

  @GET('project-client/{id}/relations')
  Future<List<Client>> getClientRelations(
      {@Path() required int id,
      @Query('is_descendant') bool isDescendant = true});
}
