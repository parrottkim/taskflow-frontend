part of '../widget.dart';

@freezed
sealed class NavigationItem with _$NavigationItem {
  factory NavigationItem.button({
    required String route,
    required IconData icon,
    required String label,
    @Default(false) bool isAdmin,
  }) = NavigationButton;

  factory NavigationItem.title({
    required String label,
    @Default(false) bool isAdmin,
  }) = NavigationTitle;

  factory NavigationItem.space() = NavigationSpace;
}
