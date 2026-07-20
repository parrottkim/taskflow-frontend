part of '../data.dart';

@freezed
abstract class ClientCount with _$ClientCount {
  factory ClientCount({required int depth, required int count}) = _ClientCount;

  factory ClientCount.fromJson(Map<String, dynamic> json) =>
      _$ClientCountFromJson(json);
}
