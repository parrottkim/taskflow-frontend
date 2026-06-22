part of '../data.dart';

@RestApi()
abstract class AddressService {
  factory AddressService(Dio dio, {String baseUrl}) = _AddressService;

  @GET('address/search')
  Future<Result<Address>> search({
    @Query('currentPage') required int page,
    @Query('countPerPage') int limit = 10,
    @Query('keyword') required String search,
    @Query('resultType') String resultType = 'json',
    @Query('hstryYn') String hstryYn = 'N',
    @Query('firstSort') String firstSort = 'road',
    @Query('addInfoYn') String addInfoYn = 'Y',
  });
}
