import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

enum ToastType { standard, alert, error, verified }

class Toast extends StatelessWidget {
  final ToastType type;
  final String message;

  const Toast({
    super.key,
    this.type = ToastType.standard,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Color getBackgroundColor() {
      switch (type) {
        case ToastType.standard:
          return colorScheme.surfaceContainer;
        case ToastType.alert:
          return colorScheme.primary;
        case ToastType.error:
          return colorScheme.errorContainer;
        case ToastType.verified:
          return Colors.green[50]!;
      }
    }

    Color getForegroundColor() {
      switch (type) {
        case ToastType.standard:
          return colorScheme.onSurface;
        case ToastType.alert:
          return colorScheme.onPrimary;
        case ToastType.error:
          return colorScheme.error;
        case ToastType.verified:
          return Colors.green[900]!;
      }
    }

    Color getBorderColor() {
      switch (type) {
        case ToastType.standard:
          return colorScheme.onSurface.withValues(alpha: 0.4);
        case ToastType.alert:
          return colorScheme.outline.withValues(alpha: 0.2);
        case ToastType.error:
          return colorScheme.error.withValues(alpha: 0.4);
        case ToastType.verified:
          return Colors.green[900]!.withValues(alpha: 0.4);
      }
    }

    IconData getIcon() {
      switch (type) {
        case ToastType.standard:
          return Symbols.info_rounded;
        case ToastType.alert:
          return Symbols.report_rounded;
        case ToastType.error:
          return Symbols.cancel_rounded;
        case ToastType.verified:
          return Symbols.check_circle_rounded;
      }
    }

    return ContainerWidget(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      color: getBackgroundColor(),
      borderColor: getBorderColor(),
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 430.0),
        child: Row(
          children: [
            Icon(
              getIcon(),
              fill: 0.0,
              color: getForegroundColor(),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: getForegroundColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
