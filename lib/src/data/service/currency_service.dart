part of '../data.dart';

@RestApi()
abstract class CurrencyService {
  factory CurrencyService(Dio dio, {String baseUrl}) = _CurrencyService;

  @GET('currency')
  Future<List<Currency>> getAllCurrencies();

  @GET('currency/exchange')
  Future<String> getRate({
    @DateTimeConverter(format: 'yyyy-MM-dd') required DateTime date,
  });
}
