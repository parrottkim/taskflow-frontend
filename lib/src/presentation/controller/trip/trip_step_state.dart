part of '../controller.dart';

@freezed
abstract class TripStepState with _$TripStepState {
  factory TripStepState({
    @Default(0) int currentIndex,
  }) = _TripStepState;
}
