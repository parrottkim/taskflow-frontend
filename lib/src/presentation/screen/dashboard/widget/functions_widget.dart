import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class FunctionsWidget extends StatelessWidget {
  const FunctionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final menu = WidgetPreset(context).quickMenu;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: menu.length,
      itemBuilder: (context, index) => ElevatedButton(
        onPressed: menu[index].onPressed,
        style: elevatedButtonTheme.style?.copyWith(
          padding: WidgetStatePropertyAll(const EdgeInsets.all(0.0)),
          textStyle: WidgetStatePropertyAll(
            textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Symbols.add_rounded,
                size: 16.0,
                color: colorScheme.outline.withValues(alpha: 0.7),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: colorScheme.onSurface,
                    ),
                    child: Icon(menu[index].icon, color: colorScheme.surface),
                  ),
                  SizedBox(width: 12.0),
                  Text(menu[index].label),
                  SizedBox(width: 12.0),
                ],
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (_, __) => SizedBox(height: 8.0),
    );
  }
}
