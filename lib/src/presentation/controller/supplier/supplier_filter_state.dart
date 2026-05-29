part of '../controller.dart';

@freezed
abstract class SupplierFilterState with _$SupplierFilterState {
  factory SupplierFilterState({String? search}) = _SupplierFilterState;
}
