import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';

class ExpenseListWidget extends HookConsumerWidget {
  final int projectId;
  final int? tripId;
  final Schedule selectedSchedule;
  final List<TripStep> steps;
  final List<TripRegulation>? regulations;
  final List<TripActualExpense>? expenses;
  final List<TripRegulationRate>? rates;
  final ValueNotifier<Map<int, bool>> stepInvalid;

  const ExpenseListWidget({
    super.key,
    required this.projectId,
    required this.selectedSchedule,
    this.tripId,
    required this.steps,
    this.regulations,
    this.expenses,
    this.rates,
    required this.stepInvalid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: steps.length,
      itemBuilder: (context, index) => _ExpenseItemWidget(
        projectId: projectId,
        tripId: tripId,
        selectedSchedule: selectedSchedule,
        step: steps[index],
        regulations: regulations,
        expenses: expenses,
        rates: rates,
        stepInvalid: stepInvalid,
      ),
      separatorBuilder: (_, __) => SizedBox(height: 16.0),
    );
  }
}

class _ExpenseItemWidget extends HookConsumerWidget {
  final int projectId;
  final int? tripId;
  final Schedule selectedSchedule;
  final TripStep step;
  final List<TripRegulation>? regulations;
  final List<TripActualExpense>? expenses;
  final List<TripRegulationRate>? rates;
  final ValueNotifier<Map<int, bool>> stepInvalid;

  const _ExpenseItemWidget({
    required this.projectId,
    this.tripId,
    required this.selectedSchedule,
    required this.step,
    this.regulations,
    this.expenses,
    this.rates,
    required this.stepInvalid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final filteredItems =
        expenses?.where((element) => element.stepId == step.id).toList();

    final regulation =
        regulations?.firstWhereOrNull((e) => e.stepId == step.id);
    final rate = rates?.firstWhereOrNull((e) => e.stepId == step.id);

    final rateController = useTextEditingController(text: regulation?.rate);
    final daysController = useTextEditingController(text: rate?.days);

    final daysFocusNode = useFocusNode();

    useListenable(daysFocusNode);

    final fareControllers = useMemoized(
        () => filteredItems
            ?.where((element) => element.stepId == step.id)
            .map((element) => TextEditingController(text: element.price))
            .toList(),
        [filteredItems?.length]);
    final detailsControllers = useMemoized(
        () => filteredItems
            ?.where((element) => element.stepId == step.id)
            .map((element) => TextEditingController(text: element.details))
            .toList(),
        [filteredItems?.length]);

    final fareFocusNodes = useMemoized(
        () => filteredItems
            ?.where((element) => element.stepId == step.id)
            .map((element) => FocusNode())
            .toList(),
        [filteredItems?.length]);
    final detailsFocusNodes = useMemoized(
        () => filteredItems
            ?.where((element) => element.stepId == step.id)
            .map((element) => FocusNode())
            .toList(),
        [filteredItems?.length]);

    final total = useMemoized(
      () {
        return filteredItems?.map((e) => e.price).fold(0.0, (sum, priceString) {
              String cleanedPrice = priceString?.replaceAll(',', '') ?? '0';
              double price = double.tryParse(cleanedPrice) ?? 0.0;
              return sum + price;
            }) ??
            0.0;
      },
      [filteredItems],
    );

    final settlement = useMemoized(() {
      String cleanedPrice = regulation?.rate.replaceAll(',', '') ?? '0';
      double price = double.tryParse(cleanedPrice) ?? 0.0;

      String cleanedDays = daysController.text.isNotEmpty
          ? daysController.text.replaceAll(',', '')
          : '0';
      double days = double.tryParse(cleanedDays) ?? 0.0;

      return (price * days) - total;
    }, [filteredItems, rate?.days]);

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (filteredItems != null && filteredItems.isNotEmpty) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [filteredItems?.length]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          step.name,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        if (step.description != null)
          Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Text(
              step.description!,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
        if (filteredItems != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: TextButton.icon(
              onPressed: () {
                stepInvalid.value[step.id] = false;

                ref
                    .read(tripFormControllerProvider(
                            projectId: projectId, tripId: tripId)
                        .notifier)
                    .addActualExpense(
                      item: TripActualExpense(stepId: step.id),
                    );
              },
              icon: Icon(
                Symbols.add_rounded,
              ),
              label: Text(
                Intl.message('issue_form_contract_7'),
              ),
            ),
          ),
        if (filteredItems != null && filteredItems.isNotEmpty)
          SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: sizeController,
              curve: Curves.easeInQuad,
            ),
            child: FadeTransition(
              opacity: opacityController,
              child: Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Column(
                  children: [
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
                          columnWidth: FlexColumnWidth(0.4),
                          label: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Symbols.numbers_rounded,
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.7),
                                  size: 16.0,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  Intl.message('trip_form_column_1'),
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          columnWidth: FlexColumnWidth(0.6),
                          label: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Symbols.text_fields_rounded,
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.7),
                                  size: 16.0,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  Intl.message('trip_form_column_2'),
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      rows: List.generate(
                        filteredItems.length,
                        (index) {
                          useListenable(fareFocusNodes![index]);
                          useListenable(detailsFocusNodes![index]);

                          return DataRow(
                            cells: [
                              DataCell(
                                Material(
                                  elevation: fareFocusNodes[index].hasFocus
                                      ? 1.0
                                      : 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: fareFocusNodes[index].hasFocus
                                      ? colorScheme.surfaceBright
                                      : colorScheme.surfaceContainerLow,
                                  child: TextField(
                                    controller: fareControllers![index],
                                    focusNode: fareFocusNodes[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.end,
                                    inputFormatters: [
                                      ThousandsSeparatorInputFormatter()
                                    ],
                                    style: textTheme.bodyMedium,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: colorScheme.primary),
                                      ),
                                      suffixText: '₩',
                                    ),
                                    onChanged: (value) {
                                      stepInvalid.value[step.id] = false;

                                      final itemIndex = expenses!
                                          .indexOf(filteredItems[index]);
                                      ref
                                          .read(tripFormControllerProvider(
                                                  projectId: projectId,
                                                  tripId: tripId)
                                              .notifier)
                                          .updateActualExpense(
                                              index: itemIndex, price: value);
                                    },
                                    onSubmitted: (value) =>
                                        FocusScope.of(context).requestFocus(
                                            detailsFocusNodes[index]),
                                  ),
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Expanded(
                                      child: Material(
                                        elevation:
                                            detailsFocusNodes[index].hasFocus
                                                ? 1.0
                                                : 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: detailsFocusNodes[index].hasFocus
                                            ? colorScheme.surfaceBright
                                            : colorScheme.surfaceContainerLow,
                                        child: TextField(
                                          controller:
                                              detailsControllers![index],
                                          focusNode: detailsFocusNodes[index],
                                          style: textTheme.bodyMedium,
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                  width: 2.0,
                                                  color: colorScheme.primary),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            stepInvalid.value[step.id] = false;

                                            final itemIndex = expenses!
                                                .indexOf(filteredItems[index]);
                                            ref
                                                .read(
                                                    tripFormControllerProvider(
                                                            projectId:
                                                                projectId,
                                                            tripId: tripId)
                                                        .notifier)
                                                .updateActualExpense(
                                                    index: itemIndex,
                                                    details: value);
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ElevatedIconButton(
                                        onTap: () async {
                                          if (filteredItems.length == 1) {
                                            stepInvalid.value[step.id] = false;

                                            await opacityController.reverse();
                                            await sizeController.reverse();
                                          }

                                          final itemIndex = expenses!
                                              .indexOf(filteredItems[index]);

                                          ref
                                              .read(tripFormControllerProvider(
                                                      projectId: projectId,
                                                      tripId: tripId)
                                                  .notifier)
                                              .removeActualExpense(
                                                  index: itemIndex);
                                        },
                                        padding: EdgeInsets.all(4.0),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        icon: Symbols.delete_rounded,
                                        size: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
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
                                  horizontal: 12.0, vertical: 8.0),
                              child: Text(
                                Intl.message('trip_form_total'),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              child: Text(
                                '${NumberFormat('#,###').format(total)} ₩',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
        if (regulation != null)
          Padding(
            padding: filteredItems != null && filteredItems.isNotEmpty
                ? EdgeInsets.only(top: 8.0)
                : EdgeInsets.zero,
            child: Column(
              children: [
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
                      columnWidth: FlexColumnWidth(0.6),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Symbols.numbers_rounded,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                              size: 16.0,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              Intl.message('trip_form_column_3'),
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      columnWidth: FlexColumnWidth(0.4),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Symbols.numbers_rounded,
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                              size: 16.0,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              Intl.message('trip_form_column_4'),
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.7),
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
                          TextField(
                            readOnly: true,
                            controller: rateController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              ThousandsSeparatorInputFormatter()
                            ],
                            textAlign: TextAlign.end,
                            style: textTheme.bodyMedium,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              suffixText:
                                  selectedSchedule.category is ScheduleDomestic
                                      ? '₩'
                                      : '\$',
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
                              inputFormatters: [
                                ThousandsSeparatorInputFormatter()
                              ],
                              textAlign: TextAlign.end,
                              style: textTheme.bodyMedium,
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      width: 2.0, color: colorScheme.primary),
                                ),
                                suffixText: Intl.message('trip_form_column_4'),
                              ),
                              onChanged: (value) {
                                stepInvalid.value[step.id] = false;

                                if (rate == null) {
                                  ref
                                      .read(tripFormControllerProvider(
                                              projectId: projectId,
                                              tripId: tripId)
                                          .notifier)
                                      .addRegulationRate(
                                          item: TripRegulationRate(
                                        stepId: step.id,
                                        days: value,
                                        rate: regulation.rate,
                                      ));
                                  return;
                                }

                                final itemIndex = rates!.indexOf(rate);

                                if (value.isEmpty) {
                                  ref
                                      .read(tripFormControllerProvider(
                                              projectId: projectId,
                                              tripId: tripId)
                                          .notifier)
                                      .removeRegulationRate(index: itemIndex);
                                }

                                ref
                                    .read(tripFormControllerProvider(
                                            projectId: projectId,
                                            tripId: tripId)
                                        .notifier)
                                    .updateRegulationRate(
                                      index: itemIndex,
                                      days: value,
                                      rate: regulation.rate,
                                    );
                              },
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
                              horizontal: 12.0, vertical: 8.0),
                          child: Text(
                            Intl.message('trip_form_settlement'),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          child: Text(
                            '${NumberFormat('#,###').format(settlement)} ${selectedSchedule.category is ScheduleDomestic ? '₩' : '\$'}',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        InvalidWidget(
          visible: stepInvalid.value[step.id] ?? false,
          text: Intl.message('trip_form_invalid_2', args: [step.name]),
        ),
      ],
    );
  }
}
