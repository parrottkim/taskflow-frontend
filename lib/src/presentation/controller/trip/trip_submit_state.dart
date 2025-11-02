part of '../controller.dart';

@freezed
sealed class TripSubmitState with _$TripSubmitState {
  const factory TripSubmitState.idle() = TripSubmitIdle;
  const factory TripSubmitState.pending() = TripSubmitPending;
  const factory TripSubmitState.success(Trip trip) = TripSubmitSuccess;
  const factory TripSubmitState.deleted() = TripSubmitDeleted;
  const factory TripSubmitState.failure(String message) = TripSubmitFailure;
}
