part of '../data.dart';

@RestApi()
abstract class SupplierService {
  factory SupplierService(Dio dio, {String baseUrl}) = _SupplierService;

  @GET('supplier/{id}')
  Future<Supplier> getSupplier({@Path() required int id});

  @GET('supplier')
  Future<Result<Supplier>> getSuppliers({
    @Query('page') int page = 1,
    @Query('limit') int limit = 100,
    @Query('search') String? search,
  });

  @POST('supplier')
  Future<Supplier> createSupplier({@Body() required CreateSupplierDto request});

  @PATCH('supplier/{id}')
  Future<Supplier> updateSupplier({
    @Path() required int id,
    @Body() required CreateSupplierDto request,
  });
}
