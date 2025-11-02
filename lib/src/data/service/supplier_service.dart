part of '../data.dart';

@RestApi()
abstract class SupplierService {
  factory SupplierService(Dio dio, {String baseUrl}) = _SupplierService;

  @GET('supplier')
  Future<Result<Supplier>> getSuppliers({
    @Query('page') int page = 1,
    @Query('limit') int limit = 100,
    @Query('search') required String search,
  });

  @POST('supplier')
  Future<Supplier> createSupplier({@Body() required Supplier supplier});
}
