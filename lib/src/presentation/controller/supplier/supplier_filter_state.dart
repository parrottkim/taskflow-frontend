part of '../controller.dart';

@freezed
abstract class SupplierFilterState with _$SupplierFilterState {
  factory SupplierFilterState({@Default('') String search}) =
      _SupplierFilterState;
}
