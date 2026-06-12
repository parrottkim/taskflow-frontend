part of '../data.dart';

@freezed
abstract class AddressSearchResult with _$AddressSearchResult {
  factory AddressSearchResult({
    @Default(0) int totalCount,
    @Default(<AddressItem>[]) List<AddressItem> items,
  }) = _AddressSearchResult;

  factory AddressSearchResult.fromJson(Map<String, dynamic> json) =>
      _$AddressSearchResultFromJson(json);
}

@freezed
abstract class AddressItem with _$AddressItem {
  factory AddressItem({
    @Default('') String zipNo,
    @Default('') String roadAddr,
    @Default('') String roadAddrPart1,
    @Default('') String emdNm,
    @Default('') String bdNm,
    @Default('') String jibunAddr,
  }) = _AddressItem;

  factory AddressItem.fromJson(Map<String, dynamic> json) =>
      _$AddressItemFromJson(json);
}
