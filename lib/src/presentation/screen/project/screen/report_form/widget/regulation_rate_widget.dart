import 'package:flutter/material.dart';
import 'package:taskflow/src/shared/theme/color_extension.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';

class RegulationRateWidget extends HookWidget {
  final Schedule schedule;
  final TripRegulation regulation;
  final TripRegulationRate? rate;
  final double bottomPadding;
  final ValueChanged<String> onChanged;

  const RegulationRateWidget({
    super.key,
    required this.schedule,
    required this.regulation,
    required this.rate,
    required this.bottomPadding,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final daysController = useTextEditingController(text: rate?.days);
    final daysFocusNode = useFocusNode();

    useListenable(daysFocusNode);
    useEffect(() {
      if (!daysFocusNode.hasFocus &&
          daysController.text != (rate?.days ?? '')) {
        daysController.text = rate?.days ?? '';
      }
      return null;
    }, [rate?.days]);

    return Padding(
      padding: EdgeInsets.only(top: 4.0, bottom: bottomPadding),
      child: DataTable(
        headingRowHeight: 36.0,
        showCheckboxColumn: false,
        horizontalMargin: 0.0,
        dataRowMinHeight: 34.0,
        dataRowMaxHeight: 34.0,
        showBottomBorder: true,
        border: TableBorder(
          verticalInside: BorderSide(
            color: colorScheme.outline.subtle,
            width: 1.0,
          ),
          horizontalInside: BorderSide(
            color: colorScheme.outline.subtle,
            width: 1.0,
          ),
          bottom: BorderSide(color: colorScheme.outline.subtle, width: 1.0),
        ),
        columns: [
          DataColumn(
            columnWidth: const FlexColumnWidth(0.6),
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    Symbols.numbers_rounded,
                    color: colorScheme.onSurface.strong,
                    size: 16.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    Intl.message('report_form_unit_price'),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface.strong,
                    ),
                  ),
                ],
              ),
            ),
          ),
          DataColumn(
            columnWidth: const FlexColumnWidth(0.4),
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    Symbols.numbers_rounded,
                    color: colorScheme.onSurface.strong,
                    size: 16.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    Intl.message('report_form_days'),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface.strong,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      '${regulation.rate} ${schedule.category is ScheduleDomestic ? '₩' : '\$'}',
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              DataCell(
                Material(
                  elevation: daysFocusNode.hasFocus ? 1.0 : 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                  color: daysFocusNode.hasFocus
                      ? colorScheme.surfaceBright
                      : colorScheme.surfaceContainerLow,
                  child: TextField(
                    controller: daysController,
                    focusNode: daysFocusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [DecimalInputFormatter()],
                    textAlign: TextAlign.end,
                    style: textTheme.bodyMedium,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          width: 2.0,
                          color: colorScheme.primary,
                        ),
                      ),
                      suffixText: Intl.message('report_form_days'),
                    ),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
