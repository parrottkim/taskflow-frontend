part of '../controller.dart';

@freezed
abstract class SupplierSubmitState with _$SupplierSubmitState {
  factory SupplierSubmitState.idle() = SupplierSubmitIdle;
  factory SupplierSubmitState.pending() = SupplierSubmitPending;
  factory SupplierSubmitState.created(Supplier supplier) =
      SupplierSubmitCreated;
  factory SupplierSubmitState.updated(Supplier supplier) =
      SupplierSubmitUpdated;
  factory SupplierSubmitState.deleted() = SupplierSubmitDeleted;
  factory SupplierSubmitState.failure(String message) = SupplierSubmitFailure;
}
