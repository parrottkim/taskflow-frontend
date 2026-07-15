part of '../controller.dart';

@freezed
abstract class NavigationSearchState with _$NavigationSearchState {
  const factory NavigationSearchState({
    @Default([]) List<ProjectListItem> projects,
  }) = _NavigationSearchState;
}
