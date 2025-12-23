part of '../data.dart';

@freezed
abstract class Currency with _$Currency {
  factory Currency({
    required int id,
    required String code,
    required String symbol,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  factory Currency.empty() => Currency(id: 0, code: '', symbol: '');
}
