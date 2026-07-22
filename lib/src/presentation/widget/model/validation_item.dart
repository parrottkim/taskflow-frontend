part of '../widget.dart';

@freezed
abstract class ValidationItem with _$ValidationItem {
  factory ValidationItem({
    required String label,
    required RegExp regex,
    required bool flag,
  }) = _ValidationItem;
}
