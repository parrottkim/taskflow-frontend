part of '../data.dart';

abstract class AddressRepository {
  Future<Result<Address>> search({
    required int page,
    int limit = 10,
    required String search,
  });
}
