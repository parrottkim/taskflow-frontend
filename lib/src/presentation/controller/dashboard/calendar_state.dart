part of '../controller.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  factory CalendarState({required List<TodaySchedule> items}) = _CalendarState;
}
