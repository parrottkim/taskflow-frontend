part of '../data.dart';

@RestApi()
abstract class ExchangeService {
  factory ExchangeService(Dio dio, {String baseUrl}) = _ExchangeService;

  @GET('exchange')
  Future<String> getRate({
    @DateTimeConverter(format: 'yyyy-MM-dd') required DateTime date,
  });
}
