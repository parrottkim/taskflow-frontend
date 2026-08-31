part of '../widget.dart';

@freezed
abstract class ActionMenuItem with _$ActionMenuItem {
  factory ActionMenuItem({
    required IconData icon,
    required String label,
    @Default('') String description,
    required VoidCallback? onPressed,
  }) = _ActionMenuItem;
}
