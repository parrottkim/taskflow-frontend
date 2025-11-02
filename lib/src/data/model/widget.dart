part of '../data.dart';

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
abstract class Keyword with _$Keyword {
  const factory Keyword({
    required String keyword,
    required DateTime date,
  }) = _Keyword;

  factory Keyword.fromJson(Map<String, dynamic> json) =>
      _$KeywordFromJson(json);
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
abstract class ClientCount with _$ClientCount {
  factory ClientCount({
    required int depth,
    required int count,
  }) = _ClientCount;

  factory ClientCount.fromJson(Map<String, dynamic> json) =>
      _$ClientCountFromJson(json);
}

@freezed
abstract class QuickMenu with _$QuickMenu {
  factory QuickMenu({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
  }) = _QuickMenu;
}

@freezed
abstract class BottomSheetItem with _$BottomSheetItem {
  factory BottomSheetItem({
    required Function() onTap,
    required String label,
  }) = _BottomSheetItem;
}
