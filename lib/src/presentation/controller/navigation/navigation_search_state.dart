part of '../controller.dart';

@freezed
abstract class NavigationSearchState with _$NavigationSearchState {
  const factory NavigationSearchState({@Default([]) List<Project> projects}) =
      _NavigationSearchState;
}
