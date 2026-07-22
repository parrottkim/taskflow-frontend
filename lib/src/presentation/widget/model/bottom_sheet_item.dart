part of '../widget.dart';

@freezed
abstract class BottomSheetItem with _$BottomSheetItem {
  factory BottomSheetItem({
    required VoidCallback onTap,
    required String label,
  }) = _BottomSheetItem;
}
