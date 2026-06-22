part of '../controller.dart';

@freezed
abstract class AddressState with _$AddressState {
  factory AddressState({
    @Default('') String search,
    @Default(1) int page,
    @Default(0) int total,
    @Default([]) List<Address> items,
    @Default(false) bool isLoading,
    @Default(false) bool hasReachEnd,
  }) = _AddressState;
}
