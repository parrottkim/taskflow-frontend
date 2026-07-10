import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';

class FuelExpenseWidget extends HookConsumerWidget {
  final int projectId;
  final int? reportId;
  final int? scheduleId;
  final TripFuelExpense? fuel;

  const FuelExpenseWidget({
    super.key,
    required this.projectId,
    this.reportId,
    this.scheduleId,
    this.fuel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final rateController = useTextEditingController(text: fuel?.rate);
    final mileageController = useTextEditingController(text: fuel?.mileage);
    final distanceController = useTextEditingController(text: fuel?.distance);

    final rateFocus = useFocusNode();
    final mileageFocus = useFocusNode();
    final distanceFocus = useFocusNode();

    useListenable(rateFocus);
    useListenable(mileageFocus);
    useListenable(distanceFocus);

    final rateText = fuel?.rate;
    final mileageText = fuel?.mileage;
    final distanceText = fuel?.distance;

    double parseAmount(String? value) {
      return double.tryParse(value?.replaceAll(',', '').trim() ?? '') ?? 0.0;
    }

    final total = useMemoized(() {
      if (rateText == null ||
          rateText.isEmpty ||
          mileageText == null ||
          mileageText.isEmpty ||
          distanceText == null ||
          distanceText.isEmpty) {
        return 0.0;
      }

      final rate = parseAmount(rateText);
      final mileage = parseAmount(mileageText);
      final distance = parseAmount(distanceText);

      if (mileage == 0) return 0.0;

      return rate * (distance / mileage);
    }, [rateText, mileageText, distanceText]);

    final validation = ref.watch(reportValidationControllerProvider);
    final isFuelInvalid = validation.fuelInvalid;

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intl.message('report_form_column_6'),
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4.0),
          DataTable(
            headingRowHeight: 36.0,
            showCheckboxColumn: false,
            horizontalMargin: 0.0,
            dataRowMinHeight: 34.0,
            dataRowMaxHeight: 34.0,
            showBottomBorder: true,
            border: TableBorder(
              verticalInside: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.2),
                width: 1.0,
              ),
              horizontalInside: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.2),
                width: 1.0,
              ),
              bottom: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.2),
                width: 1.0,
              ),
            ),
            columns: [
              DataColumn(
                columnWidth: FlexColumnWidth(0.3),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.numbers_rounded,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        Intl.message('report_form_column_7'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(0.2),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.numbers_rounded,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        Intl.message('report_form_column_8'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(0.3),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Symbols.numbers_rounded,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        Intl.message('report_form_column_9'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
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
                    Material(
                      elevation: rateFocus.hasFocus ? 1.0 : 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                      color: rateFocus.hasFocus
                          ? colorScheme.surfaceBright
                          : colorScheme.surfaceContainerLow,
                      child: TextField(
                        focusNode: rateFocus,
                        controller: rateController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [DecimalInputFormatter()],
                        textAlign: TextAlign.end,
                        style: textTheme.bodyMedium,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              width: 2.0,
                              color: colorScheme.primary,
                            ),
                          ),
                          suffixText: '₩',
                        ),
                        onChanged: (value) => ref
                            .read(
                              reportFormControllerProvider(
                                projectId: projectId,
                                reportId: reportId,
                                scheduleId: scheduleId,
                              ).notifier,
                            )
                            .setFuelExpense(rate: value),
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(mileageFocus),
                      ),
                    ),
                  ),
                  DataCell(
                    Material(
                      elevation: mileageFocus.hasFocus ? 1.0 : 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                      color: mileageFocus.hasFocus
                          ? colorScheme.surfaceBright
                          : colorScheme.surfaceContainerLow,
                      child: TextField(
                        focusNode: mileageFocus,
                        controller: mileageController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [DecimalInputFormatter()],
                        textAlign: TextAlign.end,
                        style: textTheme.bodyMedium,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              width: 2.0,
                              color: colorScheme.primary,
                            ),
                          ),
                          suffixText: 'km/L',
                        ),
                        onChanged: (value) => ref
                            .read(
                              reportFormControllerProvider(
                                projectId: projectId,
                                reportId: reportId,
                                scheduleId: scheduleId,
                              ).notifier,
                            )
                            .setFuelExpense(mileage: value),
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(distanceFocus),
                      ),
                    ),
                  ),
                  DataCell(
                    Material(
                      elevation: distanceFocus.hasFocus ? 1.0 : 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                      color: distanceFocus.hasFocus
                          ? colorScheme.surfaceBright
                          : colorScheme.surfaceContainerLow,
                      child: TextField(
                        focusNode: distanceFocus,
                        controller: distanceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [DecimalInputFormatter()],
                        textAlign: TextAlign.end,
                        style: textTheme.bodyMedium,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              width: 2.0,
                              color: colorScheme.primary,
                            ),
                          ),
                          suffixText: 'km',
                        ),
                        onChanged: (value) => ref
                            .read(
                              reportFormControllerProvider(
                                projectId: projectId,
                                reportId: reportId,
                                scheduleId: scheduleId,
                              ).notifier,
                            )
                            .setFuelExpense(distance: value),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                  width: 1.0,
                ),
              ),
              color: colorScheme.surfaceContainer,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      Intl.message('report_form_total'),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      '${NumberFormat('#,###').format(total)} ₩',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          InvalidWidget(
            visible: isFuelInvalid,
            text: Intl.message('report_form_invalid_4'),
          ),
        ],
      ),
    );
  }
}
