part of '../controller.dart';

@freezed
abstract class WorldMapState with _$WorldMapState {
  factory WorldMapState({required List<ClientCount> items}) = _WorldMapState;
}
