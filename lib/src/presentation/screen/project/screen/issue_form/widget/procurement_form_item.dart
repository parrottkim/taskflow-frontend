import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/supplier_search_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';

class ProcurementFormItem extends HookConsumerWidget {
  final List<ProcurementIssueItem> items;
  final List<ProcurementIssueRequest> requests;

  const ProcurementFormItem({
    super.key,
    required this.items,
    required this.requests,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scope = IssueFormScope.of(context);
    final projectId = scope.projectId;
    final categoryId = scope.categoryId;
    final issueId = scope.issueId;
    final validation = ref.watch(issueValidationControllerProvider);
    final validationController = ref.read(
      issueValidationControllerProvider.notifier,
    );
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final itemControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.item))
          .toList(),
      [items.length],
    );

    final specControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.spec))
          .toList(),
      [items.length],
    );

    final quantityControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.quantity))
          .toList(),
      [items.length],
    );

    final unitPriceControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.unitPrice))
          .toList(),
      [items.length],
    );

    final totalAmountControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.totalAmount))
          .toList(),
      [items.length],
    );

    final purchaseUrlControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.purchaseUrl))
          .toList(),
      [items.length],
    );

    final noteControllers = useMemoized(
      () => items
          .map((element) => TextEditingController(text: element.note))
          .toList(),
      [items.length],
    );

    final itemFocuses = useMemoized(
      () => items.map((_) => FocusNode()).toList(),
      [items.length],
    );
    final specFocuses = useMemoized(
      () => items.map((_) => FocusNode()).toList(),
      [items.length],
    );
    final quantityFocuses = useMemoized(
      () => items.map((_) => FocusNode()).toList(),
      [items.length],
    );
    final unitPriceFocuses = useMemoized(
      () => items.map((_) => FocusNode()).toList(),
      [items.length],
    );
    final purchaseUrlFocuses = useMemoized(
      () => items.map((_) => FocusNode()).toList(),
      [items.length],
    );
    final noteFocuses = useMemoized(
      () => items.map((_) => FocusNode()).toList(),
      [items.length],
    );

    final total = useMemoized(() {
      return items.map((e) => e.totalAmount).fold(0.0, (
        sum,
        totalAmountString,
      ) {
        String cleanedPrice = totalAmountString.replaceAll(',', '');
        double price = double.tryParse(cleanedPrice) ?? 0.0;
        return sum + price;
      });
    }, [items]);

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (items.isNotEmpty) {
        sizeController.forward().then((_) {
          opacityController.forward();
        });
      } else {
        opacityController.reverse().then((_) {
          sizeController.reverse();
        });
      }
      return null;
    }, [items]);

    return Padding(
      padding: EdgeInsets.only(bottom: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Intl.message('issue_form_procurement_1'),
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (requests.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          Intl.message('issue_form_procurement_17'),
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.error,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 8.0),
                if (requests.isEmpty)
                  TextButton.icon(
                    onPressed: () {
                      validationController.clearProcurement();

                      ref
                          .read(
                            issueFormControllerProvider(
                              projectId: projectId,
                              categoryId: categoryId,
                              issueId: issueId,
                            ).notifier,
                          )
                          .addProcurementIssueItem();
                    },
                    icon: Icon(Symbols.add_rounded),
                    label: Text(Intl.message('issue_form_procurement_11')),
                  ),
              ],
            ),
          ),
          if (items.isNotEmpty)
            IgnorePointer(
              ignoring: requests.isNotEmpty,
              child: Opacity(
                opacity: requests.isNotEmpty ? 0.4 : 1.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: SizeTransition(
                    sizeFactor: CurvedAnimation(
                      parent: sizeController,
                      curve: Curves.easeInQuad,
                    ),
                    child: FadeTransition(
                      opacity: opacityController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
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
                                bottom: BorderSide(
                                  color: colorScheme.outline.subtle,
                                  width: 1.0,
                                ),
                              ),
                              columns: [
                                DataColumn(
                                  columnWidth: FixedColumnWidth(200.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.text_fields_rounded,
                                          color: colorScheme.onSurface.strong,
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_2',
                                          ),
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
                                  columnWidth: FixedColumnWidth(200.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.text_fields_rounded,
                                          color: colorScheme.onSurface.strong,
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_3',
                                          ),
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
                                  columnWidth: FixedColumnWidth(80.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.numbers_rounded,
                                          color: colorScheme.onSurface.strong,
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_4',
                                          ),
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
                                  columnWidth: FixedColumnWidth(150.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.numbers_rounded,
                                          color: colorScheme.onSurface.strong,
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_5',
                                          ),
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
                                  columnWidth: FixedColumnWidth(180.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.numbers_rounded,
                                          color: colorScheme.onSurface.strong,
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_6',
                                          ),
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
                                  columnWidth: FixedColumnWidth(120.0),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.package_rounded,
                                          color: colorScheme.onSurface.strong,
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_7',
                                          ),
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
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.package_rounded,
                                          color: colorScheme.onSurface.strong,
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message(
                                            'issue_form_procurement_9',
                                          ),
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
                                  columnWidth: FixedColumnWidth(200),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Symbols.text_fields_rounded,
                                          color: colorScheme.onSurface.strong,
                                          size: 16.0,
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          Intl.message('common_note'),
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
                              rows: List.generate(items.length, (index) {
                                useListenable(itemFocuses[index]);
                                useListenable(specFocuses[index]);
                                useListenable(quantityFocuses[index]);
                                useListenable(unitPriceFocuses[index]);
                                useListenable(purchaseUrlFocuses[index]);

                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Material(
                                        elevation: itemFocuses[index].hasFocus
                                            ? 1.0
                                            : 0.0,
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        color: itemFocuses[index].hasFocus
                                            ? colorScheme.surfaceBright
                                            : colorScheme.surfaceContainerLow,
                                        child: TextField(
                                          controller: itemControllers[index],
                                          focusNode: itemFocuses[index],
                                          style: textTheme.bodyMedium,
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                width: 2.0,
                                                color: colorScheme.primary,
                                              ),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            validationController
                                                .clearProcurement();
                                            ref
                                                .read(
                                                  issueFormControllerProvider(
                                                    projectId: projectId,
                                                    categoryId: categoryId,
                                                    issueId: issueId,
                                                  ).notifier,
                                                )
                                                .updateProcurementIssueItem(
                                                  index: index,
                                                  item: value,
                                                );
                                          },
                                          onSubmitted: (_) =>
                                              specFocuses[index].requestFocus(),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Material(
                                        elevation: specFocuses[index].hasFocus
                                            ? 1.0
                                            : 0.0,
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        color: specFocuses[index].hasFocus
                                            ? colorScheme.surfaceBright
                                            : colorScheme.surfaceContainerLow,
                                        child: TextField(
                                          controller: specControllers[index],
                                          focusNode: specFocuses[index],
                                          style: textTheme.bodyMedium,
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                width: 2.0,
                                                color: colorScheme.primary,
                                              ),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            validationController
                                                .clearProcurement();

                                            ref
                                                .read(
                                                  issueFormControllerProvider(
                                                    projectId: projectId,
                                                    categoryId: categoryId,
                                                    issueId: issueId,
                                                  ).notifier,
                                                )
                                                .updateProcurementIssueItem(
                                                  index: index,
                                                  spec: value,
                                                );
                                          },
                                          onSubmitted: (_) =>
                                              quantityFocuses[index]
                                                  .requestFocus(),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Material(
                                        elevation:
                                            quantityFocuses[index].hasFocus
                                            ? 1.0
                                            : 0.0,
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        color: quantityFocuses[index].hasFocus
                                            ? colorScheme.surfaceBright
                                            : colorScheme.surfaceContainerLow,
                                        child: TextField(
                                          controller:
                                              quantityControllers[index],
                                          focusNode: quantityFocuses[index],
                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          textAlign: TextAlign.end,
                                          style: textTheme.bodyMedium,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                width: 2.0,
                                                color: colorScheme.primary,
                                              ),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            validationController
                                                .clearProcurement();

                                            if (value.isNotEmpty &&
                                                unitPriceControllers[index]
                                                    .text
                                                    .isNotEmpty) {
                                              final quantity = value
                                                  .trim()
                                                  .replaceAll(',', '');
                                              final parsedQuantity =
                                                  double.tryParse(quantity);

                                              final unitPrice =
                                                  unitPriceControllers[index]
                                                      .text
                                                      .trim()
                                                      .replaceAll(',', '');
                                              final parsedUnitPrice =
                                                  double.tryParse(unitPrice);

                                              if (parsedQuantity == null ||
                                                  parsedUnitPrice == null)
                                                return;

                                              final totalAmount =
                                                  NumberFormat(
                                                    '#,##0.##',
                                                  ).format(
                                                    parsedQuantity *
                                                        parsedUnitPrice,
                                                  );

                                              totalAmountControllers[index]
                                                      .text =
                                                  totalAmount;

                                              ref
                                                  .read(
                                                    issueFormControllerProvider(
                                                      projectId: projectId,
                                                      categoryId: categoryId,
                                                      issueId: issueId,
                                                    ).notifier,
                                                  )
                                                  .updateProcurementIssueItem(
                                                    index: index,
                                                    totalAmount: totalAmount,
                                                  );
                                            }

                                            ref
                                                .read(
                                                  issueFormControllerProvider(
                                                    projectId: projectId,
                                                    categoryId: categoryId,
                                                    issueId: issueId,
                                                  ).notifier,
                                                )
                                                .updateProcurementIssueItem(
                                                  index: index,
                                                  quantity: value,
                                                );
                                          },
                                          onSubmitted: (_) =>
                                              unitPriceFocuses[index]
                                                  .requestFocus(),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Material(
                                        elevation:
                                            unitPriceFocuses[index].hasFocus
                                            ? 1.0
                                            : 0.0,
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        color: unitPriceFocuses[index].hasFocus
                                            ? colorScheme.surfaceBright
                                            : colorScheme.surfaceContainerLow,
                                        child: TextField(
                                          controller:
                                              unitPriceControllers[index],
                                          focusNode: unitPriceFocuses[index],
                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          inputFormatters: [
                                            DecimalInputFormatter(),
                                          ],
                                          textAlign: TextAlign.end,
                                          style: textTheme.bodyMedium,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                width: 2.0,
                                                color: colorScheme.primary,
                                              ),
                                            ),
                                            suffixText: '₩',
                                          ),
                                          onChanged: (value) {
                                            validationController
                                                .clearProcurement();

                                            if (value.isNotEmpty &&
                                                quantityControllers[index]
                                                    .text
                                                    .isNotEmpty) {
                                              final quantity =
                                                  quantityControllers[index]
                                                      .text
                                                      .trim()
                                                      .replaceAll(',', '');
                                              final parsedQuantity =
                                                  double.tryParse(quantity);

                                              final unitPrice = value
                                                  .trim()
                                                  .replaceAll(',', '');
                                              final parsedUnitPrice =
                                                  double.tryParse(unitPrice);

                                              if (parsedQuantity == null ||
                                                  parsedUnitPrice == null)
                                                return;

                                              final totalAmount =
                                                  NumberFormat(
                                                    '#,##0.##',
                                                  ).format(
                                                    parsedQuantity *
                                                        parsedUnitPrice,
                                                  );

                                              totalAmountControllers[index]
                                                      .text =
                                                  totalAmount;

                                              ref
                                                  .read(
                                                    issueFormControllerProvider(
                                                      projectId: projectId,
                                                      categoryId: categoryId,
                                                      issueId: issueId,
                                                    ).notifier,
                                                  )
                                                  .updateProcurementIssueItem(
                                                    index: index,
                                                    totalAmount: totalAmount,
                                                  );
                                            }

                                            ref
                                                .read(
                                                  issueFormControllerProvider(
                                                    projectId: projectId,
                                                    categoryId: categoryId,
                                                    issueId: issueId,
                                                  ).notifier,
                                                )
                                                .updateProcurementIssueItem(
                                                  index: index,
                                                  unitPrice: value,
                                                );
                                          },
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      TextField(
                                        readOnly: true,
                                        controller:
                                            totalAmountControllers[index],
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          DecimalInputFormatter(),
                                        ],
                                        textAlign: TextAlign.end,
                                        style: textTheme.bodyMedium,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          suffixText: '₩',
                                        ),
                                        onChanged: (value) {
                                          validationController
                                              .clearProcurement();

                                          ref
                                              .read(
                                                issueFormControllerProvider(
                                                  projectId: projectId,
                                                  categoryId: categoryId,
                                                  issueId: issueId,
                                                ).notifier,
                                              )
                                              .updateProcurementIssueItem(
                                                index: index,
                                                totalAmount: value,
                                              );
                                        },
                                      ),
                                    ),
                                    DataCell(
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: AppToggleButton(
                                              onChanged: (value) {
                                                validationController
                                                    .clearProcurement();

                                                ref
                                                    .read(
                                                      issueFormControllerProvider(
                                                        projectId: projectId,
                                                        categoryId: categoryId,
                                                        issueId: issueId,
                                                      ).notifier,
                                                    )
                                                    .updateProcurementIssueItem(
                                                      index: index,
                                                      isOnlinePurchase: value,
                                                    );
                                                if (value == false) {
                                                  purchaseUrlControllers[index]
                                                      .clear();
                                                }
                                                if (value == true) {
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback((
                                                        _,
                                                      ) {
                                                        purchaseUrlFocuses[index]
                                                            .requestFocus();
                                                      });
                                                }
                                              },
                                              value:
                                                  items[index].isOnlinePurchase,
                                            ),
                                          ),
                                          Expanded(
                                            child: Material(
                                              elevation:
                                                  items[index]
                                                          .isOnlinePurchase &&
                                                      purchaseUrlFocuses[index]
                                                          .hasFocus
                                                  ? 1.0
                                                  : 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color:
                                                  items[index]
                                                          .isOnlinePurchase &&
                                                      purchaseUrlFocuses[index]
                                                          .hasFocus
                                                  ? colorScheme.surfaceBright
                                                  : colorScheme
                                                        .surfaceContainerLow,
                                              child: TextField(
                                                readOnly: !items[index]
                                                    .isOnlinePurchase,
                                                controller:
                                                    purchaseUrlControllers[index],
                                                focusNode:
                                                    purchaseUrlFocuses[index],
                                                maxLines: 1,
                                                inputFormatters: [
                                                  UrlPrefixFormatter(),
                                                ],
                                                style: textTheme.bodyMedium,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8.0,
                                                        ),
                                                    borderSide: BorderSide(
                                                      width: 2.0,
                                                      color:
                                                          items[index]
                                                              .isOnlinePurchase
                                                          ? colorScheme.primary
                                                          : Colors.transparent,
                                                    ),
                                                  ),
                                                  hintText:
                                                      items[index]
                                                          .isOnlinePurchase
                                                      ? Intl.message(
                                                          'issue_form_procurement_8',
                                                        )
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  validationController
                                                      .clearProcurement();
                                                  ref
                                                      .read(
                                                        issueFormControllerProvider(
                                                          projectId: projectId,
                                                          categoryId:
                                                              categoryId,
                                                          issueId: issueId,
                                                        ).notifier,
                                                      )
                                                      .updateProcurementIssueItem(
                                                        index: index,
                                                        purchaseUrl: value,
                                                      );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DataCell(
                                      items[index].supplier == null
                                          ? Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(
                                                4.0,
                                              ),
                                              child: ElevatedButton(
                                                onPressed:
                                                    !items[index]
                                                        .isOnlinePurchase
                                                    ? () {
                                                        validationController
                                                            .clearProcurement();

                                                        showDialog(
                                                          context: context,
                                                          builder: (_) =>
                                                              scope.wrap(
                                                                child:
                                                                    SupplierSearchDialog(
                                                                      itemIndex:
                                                                          index,
                                                                    ),
                                                              ),
                                                        );
                                                      }
                                                    : null,
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadiusGeometry.circular(
                                                          4.0,
                                                        ),
                                                    side: BorderSide(
                                                      color: colorScheme
                                                          .outline
                                                          .muted,
                                                    ),
                                                  ),
                                                  minimumSize: Size(80, 36),
                                                  padding: EdgeInsets.zero,
                                                  textStyle:
                                                      textTheme.labelMedium,
                                                ),
                                                child: Text(
                                                  Intl.message(
                                                    'issue_form_procurement_10',
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    clipBehavior: Clip.hardEdge,
                                                    width: 20.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4.0,
                                                          ),
                                                      color:
                                                          items[index]
                                                                  .supplier!
                                                                  .logo !=
                                                              null
                                                          ? Colors.white
                                                          : colorScheme.primary,
                                                    ),
                                                    child:
                                                        items[index]
                                                                .supplier!
                                                                .logo !=
                                                            null
                                                        ? Image.network(
                                                            items[index]
                                                                .supplier!
                                                                .logo!,
                                                            fit: BoxFit
                                                                .contain, // 이미지가 컨테이너를 꽉 채우도록 설정
                                                            errorBuilder:
                                                                (
                                                                  _,
                                                                  _,
                                                                  _,
                                                                ) => Icon(
                                                                  Symbols
                                                                      .public_rounded,
                                                                  size: 20.0,
                                                                  color: colorScheme
                                                                      .onPrimary,
                                                                ),
                                                          )
                                                        : Icon(
                                                            Symbols
                                                                .public_rounded,
                                                            size: 20.0,
                                                            color: colorScheme
                                                                .onPrimary,
                                                          ),
                                                  ),
                                                  SizedBox(width: 4.0),
                                                  Text(
                                                    items[index].supplier!.name,
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          4.0,
                                                        ),
                                                    child: ElevatedIconButton(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (_) =>
                                                              scope.wrap(
                                                                child:
                                                                    SupplierSearchDialog(
                                                                      itemIndex:
                                                                          index,
                                                                    ),
                                                              ),
                                                        );
                                                      },
                                                      padding: EdgeInsets.all(
                                                        4.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4.0,
                                                          ),
                                                      icon: Symbols
                                                          .cached_rounded,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ),
                                    DataCell(
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Material(
                                              elevation:
                                                  noteFocuses[index].hasFocus
                                                  ? 1.0
                                                  : 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color: noteFocuses[index].hasFocus
                                                  ? colorScheme.surfaceBright
                                                  : colorScheme
                                                        .surfaceContainerLow,
                                              child: TextField(
                                                controller:
                                                    noteControllers[index],
                                                focusNode: noteFocuses[index],
                                                style: textTheme.bodyMedium,
                                                maxLines: 1,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8.0,
                                                            ),
                                                        borderSide: BorderSide(
                                                          width: 2.0,
                                                          color: colorScheme
                                                              .primary,
                                                        ),
                                                      ),
                                                ),
                                                onChanged: (value) {
                                                  validationController
                                                      .clearProcurement();

                                                  ref
                                                      .read(
                                                        issueFormControllerProvider(
                                                          projectId: projectId,
                                                          categoryId:
                                                              categoryId,
                                                          issueId: issueId,
                                                        ).notifier,
                                                      )
                                                      .updateProcurementIssueItem(
                                                        index: index,
                                                        note: value,
                                                      );
                                                },
                                                onSubmitted: (_) =>
                                                    quantityFocuses[index]
                                                        .requestFocus(),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: ElevatedIconButton(
                                              onTap: () async {
                                                if (items.length == 1) {
                                                  validationController
                                                      .clearProcurement();

                                                  await opacityController
                                                      .reverse();
                                                  await sizeController
                                                      .reverse();
                                                }

                                                ref
                                                    .read(
                                                      issueFormControllerProvider(
                                                        projectId: projectId,
                                                        categoryId: categoryId,
                                                        issueId: issueId,
                                                      ).notifier,
                                                    )
                                                    .removeProcurementIssueItem(
                                                      index: index,
                                                    );
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
                              }),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 600.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: colorScheme.outline.subtle,
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
                                      Intl.message('issue_form_procurement_15'),
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
                                      horizontal: 12.0,
                                      vertical: 8.0,
                                    ),
                                    child: Text(
                                      '${NumberFormat('#,##0.##').format(total)} ₩',
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
              ),
            ),
          ValidationErrorMessage(
            visible: validation.procurementItemsMissing,
            text: Intl.message('issue_form_procurement_item_invalid_1'),
          ),
          ValidationErrorMessage(
            visible: validation.procurementItemInvalid,
            text: Intl.message('issue_form_procurement_item_invalid_2'),
          ),
        ],
      ),
    );
  }
}
