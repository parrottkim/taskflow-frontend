part of '../controller.dart';

@freezed
abstract class DateSelectionState with _$DateSelectionState {
  factory DateSelectionState({required DateTime start, required DateTime end}) =
      _DateSelectionState;
}
