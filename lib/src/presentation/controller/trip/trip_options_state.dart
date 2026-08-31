part of '../controller.dart';

@freezed
abstract class TripOptionsState with _$TripOptionsState {
  factory TripOptionsState({
    @Default([]) List<TripCategory> categories,
    @Default([]) List<TripStep> steps,
    @Default([]) List<Currency> currencies,
    @Default([]) List<TripRegulation> regulations,
  }) = _TripOptionsState;
}
