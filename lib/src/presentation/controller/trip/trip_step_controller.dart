part of '../controller.dart';

@riverpod
class TripStepController extends _$TripStepController {
  @override
  TripStepState build() {
    return TripStepState();
  }

  void setIndex({required int index}) {
    state = state.copyWith(currentIndex: index);
  }
}
