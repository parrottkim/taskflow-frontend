part of '../data.dart';

class CurrencyDataSource implements CurrencyRepository {
  final CurrencyService _service;

  CurrencyDataSource({required this._service});

  @override
  Future<List<Currency>> getAllCurrencies() => _service.getAllCurrencies();

  @override
  Future<String> getRate({required DateTime date}) =>
      _service.getRate(date: date);
}

@riverpod
CurrencyRepository currencyRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return CurrencyDataSource(service: CurrencyService(dio));
}
