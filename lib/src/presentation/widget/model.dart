part of 'widget.dart';

@freezed
abstract class ValidationItem with _$ValidationItem {
  factory ValidationItem({
    required String label,
    required RegExp regex,
    required bool flag,
  }) = _ValidationItem;
}

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

@freezed
abstract class ClientMarker with _$ClientMarker {
  factory ClientMarker({
    required double latitude,
    required double longitude,
    required List<ClientMarkerTooltip> items,
  }) = _ClientMarker;
}

@freezed
abstract class ClientMarkerTooltip with _$ClientMarkerTooltip {
  factory ClientMarkerTooltip({
    required ClientType type,
    required String name,
  }) = _ClientMarkerTooltip;
}

@freezed
abstract class MenuOption with _$MenuOption {
  factory MenuOption({
    required IconData icon,
    required String label,
    @Default('') String description,
    required VoidCallback? onPressed,
  }) = _MenuOption;
}

@freezed
abstract class BottomSheetItem with _$BottomSheetItem {
  factory BottomSheetItem({
    required VoidCallback onTap,
    required String label,
  }) = _BottomSheetItem;
}
