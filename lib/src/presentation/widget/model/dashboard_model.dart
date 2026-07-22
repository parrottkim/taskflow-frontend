part of '../widget.dart';

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
