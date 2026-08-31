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
    required ClientBrand type,
    required String name,
  }) = _ClientMarkerTooltip;
}
