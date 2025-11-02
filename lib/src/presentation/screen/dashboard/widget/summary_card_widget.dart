import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

enum SummaryCardType { primary, secondary, surface }

class SummaryCardWidget extends StatelessWidget {
  final SummaryCardType type;
  final IconData icon;
  final String title;
  final int value;

  const SummaryCardWidget({
    super.key,
    this.type = SummaryCardType.surface,
    required this.icon,
    required this.title,
    required this.value,
  });

  Color _buildBackgroundColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case SummaryCardType.primary:
        return colorScheme.primary;
      case SummaryCardType.secondary:
        return colorScheme.secondary;
      case SummaryCardType.surface:
        return colorScheme.surfaceBright;
    }
  }

  Color _buildForegroundColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case SummaryCardType.primary:
        return colorScheme.onPrimary;
      case SummaryCardType.secondary:
        return colorScheme.onSecondary;
      case SummaryCardType.surface:
        return colorScheme.onSurface;
    }
  }

  Color _buildIconColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case SummaryCardType.primary:
        return colorScheme.onPrimary;
      case SummaryCardType.secondary:
        return colorScheme.onSecondary;
      case SummaryCardType.surface:
        return colorScheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ContainerWidget(
      elevation: 0.0,
      width: MediaQuery.of(context).size.width - 120.0,
      color: _buildBackgroundColor(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            Container(
              margin: EdgeInsets.only(bottom: 24.0),
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: _buildIconColor(context).withValues(alpha: 0.3),
              ),
              child: Icon(
                icon,
                fill: 1.0,
                size: 16.0,
                color: _buildIconColor(context),
              ),
            ),
          Text(
            title,
            style: TextStyle(
              color: _buildForegroundColor(context).withValues(alpha: 0.6),
            ),
          ),
          Text(
            NumberFormat('###,###,###,###').format(value),
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: _buildForegroundColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
