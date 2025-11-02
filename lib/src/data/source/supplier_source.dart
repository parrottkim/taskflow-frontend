part of '../data.dart';

class SupplierDataSource implements SupplierRepository {
  final SupplierService _service;

  SupplierDataSource({required SupplierService service}) : _service = service;

  @override
  Future<Result<Supplier>> getSuppliers(
          {int page = 1, int limit = 100, required String search}) =>
      _service.getSuppliers(page: page, limit: limit, search: search);

  @override
  Future<Supplier> createSupplier({required Supplier supplier}) =>
      _service.createSupplier(supplier: supplier);
}

@riverpod
SupplierRepository supplierRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return SupplierDataSource(service: SupplierService(dio));
}
