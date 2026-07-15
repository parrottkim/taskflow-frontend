part of 'widget.dart';

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

    Color getBackgroundColor() {
      switch (type) {
        case ToastType.standard:
          return colorScheme.surfaceContainer;
        case ToastType.alert:
          return colorScheme.primary;
        case ToastType.error:
          return colorScheme.errorContainer;
        case ToastType.verified:
          return Color(0xFF388E3C).withValues(alpha: 0.1);
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
          return Color(0xFF388E3C);
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
          return Color(0xFF388E3C).withValues(alpha: 0.4);
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
      padding: EdgeInsets.zero,
      color: colorScheme.surface,
      borderColor: getBorderColor(),
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        constraints: const BoxConstraints(maxWidth: 430.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: getBackgroundColor(),
        ),
        child: Row(
          children: [
            Icon(getIcon(), fill: 0.0, color: getForegroundColor()),
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
