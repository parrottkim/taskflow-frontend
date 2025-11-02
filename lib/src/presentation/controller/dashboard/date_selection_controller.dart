part of '../controller.dart';

@riverpod
class DateSelectionController extends _$DateSelectionController {
  @override
  DateSelectionState build() {
    return DateSelectionState(
      start: DateTime(DateTime.now().year, 1, 1),
      end: DateTime.now(),
    );
  }

  void dataSelectionChange({required DateTime start, required DateTime end}) {
    state = state.copyWith(start: start, end: end);
  }
}
