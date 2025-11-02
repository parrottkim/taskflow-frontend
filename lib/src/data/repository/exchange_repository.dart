part of '../data.dart';

abstract class ExchangeRepository {
  Future<String> getRate({required DateTime date});
}
