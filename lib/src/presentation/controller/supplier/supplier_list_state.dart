part of '../controller.dart';

@freezed
abstract class SupplierListState with _$SupplierListState {
  factory SupplierListState({
    @Default([]) List<Supplier> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _SupplierListState;
}
