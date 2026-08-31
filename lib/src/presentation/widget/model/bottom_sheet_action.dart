part of '../widget.dart';

@freezed
abstract class BottomSheetAction with _$BottomSheetAction {
  factory BottomSheetAction({
    required VoidCallback onTap,
    required String label,
  }) = _BottomSheetAction;
}
