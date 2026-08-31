import 'package:flutter/material.dart';

extension ColorStrengthExtension on Color {
  Color get faint => withValues(alpha: 0.1);

  Color get subtle => withValues(alpha: 0.2);

  Color get muted => withValues(alpha: 0.4);

  Color get strong => withValues(alpha: 0.7);
}
