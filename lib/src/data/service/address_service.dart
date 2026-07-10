part of '../data.dart';

@RestApi()
abstract class AddressService {
  factory AddressService(Dio dio, {String baseUrl}) = _AddressService;

  @GET('address/search')
  Future<Result<Address>> search({
    @Query('page') required int page,
    @Query('limit') int limit = 10,
    @Query('search') required String search,
  });
}
