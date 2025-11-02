part of '../controller.dart';

@freezed
abstract class TripFilterState with _$TripFilterState {
  factory TripFilterState({
    @Default([]) List<TripCategory> categories,
    @Default([]) List<TripStep> steps,
    @Default([]) List<TripRegulation> regulations,
  }) = _TripFilterState;
}
