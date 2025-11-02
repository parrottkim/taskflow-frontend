part of '../data.dart';

abstract class ClientRepository {
  Future<List<ClientGroup>> getAllClients();

  Future<List<ClientCount>> getAllClientCount();

  Future<List<Client>> getClientRelations(
      {required int id, bool isDescendant = true});
}
