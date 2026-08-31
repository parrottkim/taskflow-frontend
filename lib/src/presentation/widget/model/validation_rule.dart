part of '../widget.dart';

@freezed
abstract class ValidationRule with _$ValidationRule {
  factory ValidationRule({
    required String label,
    required RegExp regex,
    required bool flag,
  }) = _ValidationRule;
}
