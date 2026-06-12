part of '../data.dart';

@freezed
abstract class Supplier with _$Supplier {
  factory Supplier({
    required int id,
    required String name,
    required String number,
    String? zipcode,
    String? address,
    String? roadAddress,
    String? roadAddressReference,
    String? detailAddress,
    String? phone,
    String? email,
    String? logo,
  }) = _Supplier;

  factory Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);

  factory Supplier.dummy() =>
      Supplier(id: 0, name: 'name', number: '000-00-00000');
}

@freezed
abstract class SupplierKeyword with _$SupplierKeyword {
  factory SupplierKeyword({required int id, required String name}) =
      _SupplierKeyword;

  factory SupplierKeyword.fromJson(Map<String, dynamic> json) =>
      _$SupplierKeywordFromJson(json);
}

@freezed
abstract class SupplierAddress with _$SupplierAddress {
  const factory SupplierAddress({
    @Default('') String zipcode,
    @Default('') String roadAddress,
    @Default('') String roadAddressReference,
    String? detailAddress,
  }) = _SupplierAddress;

  factory SupplierAddress.fromJson(Map<String, dynamic> json) =>
      _$SupplierAddressFromJson(json);
}

@freezed
abstract class SupplierLogo with _$SupplierLogo {
  factory SupplierLogo({
    required String filename,
    required int size,
    required String url,
  }) = _SupplierLogo;

  factory SupplierLogo.fromJson(Map<String, dynamic> json) =>
      _$SupplierLogoFromJson(json);
}
