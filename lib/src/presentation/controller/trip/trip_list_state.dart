part of '../controller.dart';

@freezed
abstract class TripListState with _$TripListState {
  factory TripListState({
    @Default([]) List<Trip> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = _TripListState;
}
