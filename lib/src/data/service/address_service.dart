part of '../data.dart';

@RestApi()
abstract class AddressService {
  factory AddressService(Dio dio, {String baseUrl}) = _AddressService;

  @GET('/addrlink/addrLinkApi.do')
  Future<dynamic> searchAddresses({
    @Query('currentPage') required int currentPage,
    @Query('countPerPage') int countPerPage = 10,
    @Query('keyword') required String keyword,
    @Query('resultType') String resultType = 'json',
    @Query('hstryYn') String hstryYn = 'N',
    @Query('firstSort') String firstSort = 'road',
    @Query('addInfoYn') String addInfoYn = 'Y',
  });
}
