import 'package:flutter/material.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/widget/preset.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menu = WidgetPreset(context).workMenu;

    return BranchLayout(child: _DesktopWidget(items: menu));
  }
}

class _DesktopWidget extends StatelessWidget {
  final List<MenuOption> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 430.0),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.all(
          24.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => ElevatedButton(
          onPressed: items[index].onPressed,
          style: elevatedButtonTheme.style?.copyWith(
            padding: WidgetStatePropertyAll(
              EdgeInsets.all(24.0),
            ),
            textStyle: WidgetStatePropertyAll(
              textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(items[index].icon, size: 20.0),
              SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(items[index].label),
                    SizedBox(height: 4.0),
                    Text(
                      items[index].description,
                      style: textTheme.bodySmall?.copyWith(
                        color: items[index].onPressed != null
                            ? colorScheme.onSurface.withValues(alpha: 0.7)
                            : colorScheme.onSurface.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 8.0),
      ),
    );
  }
}
