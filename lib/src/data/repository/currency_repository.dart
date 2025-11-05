part of '../data.dart';

abstract class CurrencyRepository {
  Future<List<Currency>> getAllCurrencies();

  Future<String> getRate({required DateTime date});
}
