part of '../controller.dart';

@freezed
abstract class NavigationFilterState with _$NavigationFilterState {
  factory NavigationFilterState({@Default('') String search}) =
      _NavigationFilterState;
}
