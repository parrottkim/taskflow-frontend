part of '../data.dart';

@freezed
abstract class Supplier with _$Supplier {
  factory Supplier({
    required int id,
    required String name,
    required String number,
    String? address,
    String? phone,
    String? email,
    String? logo,
    // keywords는 create, update 시에만 필요
  }) = _Supplier;

  factory Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);
}

@freezed
abstract class SupplierKeyword with _$SupplierKeyword {
  factory SupplierKeyword({
    required int id,
    required String name,
  }) = _SupplierKeyword;

  factory SupplierKeyword.fromJson(Map<String, dynamic> json) =>
      _$SupplierKeywordFromJson(json);
}
