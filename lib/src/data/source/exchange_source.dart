part of '../data.dart';

class ExchangeDataSource implements ExchangeRepository {
  final ExchangeService _service;

  ExchangeDataSource({required ExchangeService service}) : _service = service;

  @override
  Future<String> getRate({
    required DateTime date,
  }) =>
      _service.getRate(date: date);
}

@riverpod
ExchangeRepository exchangeRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return ExchangeDataSource(service: ExchangeService(dio));
}
