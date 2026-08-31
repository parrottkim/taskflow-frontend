part of '../widget.dart';

enum ToastType { standard, alert, error, verified, saving }

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
    const verifiedColor = Color(0xFF388E3C);
    const borderRadius = BorderRadius.all(Radius.circular(8.0));
    final (
      backgroundColor,
      foregroundColor,
      borderColor,
      icon,
    ) = switch (type) {
      ToastType.standard => (
        colorScheme.surfaceContainer,
        colorScheme.onSurface,
        colorScheme.onSurface.muted,
        Symbols.info_rounded,
      ),
      ToastType.alert => (
        colorScheme.primary,
        colorScheme.onPrimary,
        colorScheme.outline.subtle,
        Symbols.report_rounded,
      ),
      ToastType.error => (
        colorScheme.errorContainer,
        colorScheme.error,
        colorScheme.error.muted,
        Symbols.cancel_rounded,
      ),
      ToastType.verified => (
        verifiedColor.faint,
        verifiedColor,
        verifiedColor.muted,
        Symbols.check_circle_rounded,
      ),
      ToastType.saving => (
        colorScheme.surfaceContainer,
        colorScheme.onSurface,
        colorScheme.onSurface.muted,
        null,
      ),
    };

    return ContentContainer(
      padding: EdgeInsets.zero,
      color: colorScheme.surface,
      borderColor: borderColor,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        constraints: const BoxConstraints(maxWidth: 430.0),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: backgroundColor,
        ),
        child: Row(
          children: [
            if (icon == null)
              SizedBox.square(
                dimension: 16.0,
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                  strokeWidth: 2.0,
                  color: foregroundColor,
                ),
              )
            else
              Icon(icon, fill: 0.0, color: foregroundColor),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: foregroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
