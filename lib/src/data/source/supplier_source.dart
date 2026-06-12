part of '../data.dart';

class SupplierDataSource implements SupplierRepository {
  final SupplierService _service;

  SupplierDataSource({required SupplierService service}) : _service = service;

  @override
  Future<Supplier> getSupplier({required int id}) =>
      _service.getSupplier(id: id);

  @override
  Future<Result<Supplier>> getSuppliers({
    int page = 1,
    int limit = 100,
    String? search,
  }) => _service.getSuppliers(page: page, limit: limit, search: search);

  @override
  Future<Supplier> createSupplier({required CreateSupplierDto request}) =>
      _service.createSupplier(request: request);

  @override
  Future<Supplier> updateSupplier({
    required int id,
    required CreateSupplierDto request,
  }) => _service.updateSupplier(id: id, request: request);
}

@riverpod
SupplierRepository supplierRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return SupplierDataSource(service: SupplierService(dio));
}
