part of '../data.dart';

@freezed
abstract class Address with _$Address {
  factory Address({
    @Default('') String zipNo,
    @Default('') String roadAddr,
    @Default('') String roadAddrPart1,
    @Default('') String emdNm,
    @Default('') String bdNm,
    @Default('') String jibunAddr,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
