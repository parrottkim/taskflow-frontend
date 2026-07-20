part of '../data.dart';

abstract class SupplierRepository {
  Future<Supplier> getSupplier({required int id});

  Future<Result<Supplier>> getSuppliers({
    int page = 1,
    int limit = 100,
    String? search,
  });

  Future<Supplier> createSupplier({required CreateSupplierRequest request});

  Future<Supplier> updateSupplier({
    required int id,
    required CreateSupplierRequest request,
  });

  Future<void> deleteSupplier({required int id});
}
