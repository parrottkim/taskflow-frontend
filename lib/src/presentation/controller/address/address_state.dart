part of '../controller.dart';

@freezed
abstract class AddressState with _$AddressState {
  factory AddressState({
    @Default('') String keyword,
    @Default(1) int page,
    @Default(0) int totalCount,
    @Default(<AddressItem>[]) List<AddressItem> items,
    @Default(false) bool isLoading,
    @Default(false) bool hasReachEnd,
  }) = _AddressState;
}
