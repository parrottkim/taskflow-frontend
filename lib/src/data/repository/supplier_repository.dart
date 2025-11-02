part of '../data.dart';

abstract class SupplierRepository {
  Future<Result<Supplier>> getSuppliers({
    int page = 1,
    int limit = 100,
    required String search,
  });

  Future<Supplier> createSupplier({required Supplier supplier});
}
