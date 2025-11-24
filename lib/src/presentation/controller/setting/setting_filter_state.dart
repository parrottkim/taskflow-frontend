part of '../controller.dart';

@freezed
abstract class SettingFilterState with _$SettingFilterState {
  factory SettingFilterState({
    String? view,
  }) = _SettingFilterState;
}
