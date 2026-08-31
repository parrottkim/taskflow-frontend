part of '../data.dart';

class AddressDataSource implements AddressRepository {
  final AddressService _service;

  AddressDataSource({required this._service});

  @override
  Future<Result<Address>> search({
    required int page,
    int limit = 10,
    required String search,
  }) => _service.search(page: page, limit: limit, search: search);
}

@riverpod
AddressRepository addressRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return AddressDataSource(service: AddressService(dio));
}
