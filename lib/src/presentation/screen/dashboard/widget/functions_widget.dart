import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/bento_grid.dart';
import 'package:taskflow/src/presentation/widget/preset.dart';

class FunctionsWidget extends StatelessWidget {
  const FunctionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final menu = WidgetPreset(context).quickMenu;

    return _MobileWidget(items: menu);
  }
}

class _DesktopWidget extends StatelessWidget {
  final List<QuickMenu> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BentoGrid(
      rows: 3,
      columns: 1,
      spacing: 8.0,
      tiles: List.generate(
        items.length,
        (index) => BentoTile(
          row: index + 1,
          column: 1,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: Stack(
              alignment: Alignment.centerRight,
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
                  padding: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Icon(
                          items[index].icon,
                          color: colorScheme.surface,
                        ),
                      ),
                      Spacer(),
                      Text(
                        items[index].label,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileWidget extends StatelessWidget {
  final List<QuickMenu> items;

  const _MobileWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => ElevatedButton(
        onPressed: items[index].onPressed,
        style: elevatedButtonTheme.style?.copyWith(
            padding: WidgetStatePropertyAll(
              const EdgeInsets.all(0.0),
            ),
            textStyle: WidgetStatePropertyAll(
              textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            )),
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
                    child: Icon(
                      items[index].icon,
                      color: colorScheme.surface,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Text(items[index].label),
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
