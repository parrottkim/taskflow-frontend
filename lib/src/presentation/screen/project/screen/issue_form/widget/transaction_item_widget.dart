import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/dropdown.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';

class TransactionItemWidget extends ConsumerWidget {
  final int categoryId;
  final int projectId;
  final int? issueId;
  final List<TransactionItem>? items;
  final ValueNotifier<bool> hasTransactionItems;
  final ValueNotifier<bool> isTransactionItemEmpty;

  const TransactionItemWidget({
    super.key,
    required this.categoryId,
    required this.projectId,
    this.issueId,
    this.items,
    required this.hasTransactionItems,
    required this.isTransactionItemEmpty,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(issueFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
          categoryId: categoryId,
          projectId: projectId,
          issueId: issueId,
          categories: value.transactionCategories,
          currencies: value.currencies,
          items: items,
          hasTransactionItems: hasTransactionItems,
          isTransactionItemEmpty: isTransactionItemEmpty),
      AsyncError(:final error, :final stackTrace) =>
        ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
          child: _DesktopWidget(
            categoryId: categoryId,
            projectId: projectId,
            categories: [],
            currencies: [],
            hasTransactionItems: hasTransactionItems,
            isTransactionItemEmpty: isTransactionItemEmpty,
          ),
        ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int categoryId;
  final int projectId;
  final int? issueId;
  final List<TransactionItemCategory> categories;
  final List<Currency> currencies;
  final List<TransactionItem>? items;
  final ValueNotifier<bool> hasTransactionItems;
  final ValueNotifier<bool> isTransactionItemEmpty;

  const _DesktopWidget({
    required this.categoryId,
    required this.projectId,
    this.issueId,
    required this.categories,
    required this.currencies,
    this.items,
    required this.hasTransactionItems,
    required this.isTransactionItemEmpty,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selectedCategories = useMemoized(
      () =>
          items?.map((element) => ValueNotifier(element.category)).toList() ??
          [],
      [items?.length],
    );

    final selectedCurrencies = useMemoized(
      () =>
          items
              ?.map((element) =>
                  ValueNotifier(element.currency ?? currencies.first))
              .toList() ??
          [],
      [items?.length],
    );

    final priceControllers = useMemoized(
      () =>
          items
              ?.map((element) => TextEditingController(text: element.price))
              .toList() ??
          [],
      [items?.length],
    );
    final noteControllers = useMemoized(
      () =>
          items
              ?.map((element) => TextEditingController(text: element.note))
              .toList() ??
          [],
      [items?.length],
    );

    final priceFocusNodes = useMemoized(
      () => items?.map((_) => FocusNode()).toList() ?? [],
      [items?.length],
    );
    final noteFocusNodes = useMemoized(
      () => items?.map((_) => FocusNode()).toList() ?? [],
      [items?.length],
    );

    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final sizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (items != null && items!.isNotEmpty) {
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

    return Container(
      padding: EdgeInsets.only(bottom: 24.0),
      constraints: BoxConstraints(maxWidth: 600.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intl.message('issue_form_transaction_1'),
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          TextButton.icon(
            onPressed: () {
              hasTransactionItems.value = false;
              isTransactionItemEmpty.value = false;

              ref
                  .read(issueFormControllerProvider(
                          categoryId: categoryId,
                          projectId: projectId,
                          issueId: issueId)
                      .notifier)
                  .addTransactionItem();
            },
            icon: Icon(
              Symbols.add_rounded,
            ),
            label: Text(
              Intl.message('issue_form_transaction_2'),
            ),
          ),
          if (items != null && items!.isNotEmpty)
            SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: sizeController,
                curve: Curves.easeInQuad,
              ),
              child: FadeTransition(
                opacity: opacityController,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            columnWidth: FixedColumnWidth(160.0),
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Symbols.checkbook_rounded,
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.7),
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    Intl.message('issue_form_transaction_3'),
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
                            columnWidth: FixedColumnWidth(120.0),
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Symbols.attach_money_rounded,
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.7),
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    Intl.message('issue_form_transaction_7'),
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
                                    Intl.message('issue_form_transaction_4'),
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
                                    Intl.message('issue_form_transaction_5'),
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
                          items!.length,
                          (index) {
                            useListenable(priceFocusNodes[index]);
                            useListenable(noteFocusNodes[index]);

                            return DataRow(
                              cells: [
                                DataCell(
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedDropdownButton<
                                        TransactionItemCategory>(
                                      isExpanded: true,
                                      items: categories,
                                      selectedItem: selectedCategories[index],
                                      icon: Icon(Symbols.checkbook_rounded),
                                      label: Text(
                                        Intl.message(
                                            'issue_form_transaction_6'),
                                      ),
                                      itemBuilder: (category) =>
                                          Text(category.name),
                                      onChanged: (value) {
                                        isTransactionItemEmpty.value = false;
                                        ref
                                            .read(issueFormControllerProvider(
                                                    categoryId: categoryId,
                                                    projectId: projectId,
                                                    issueId: issueId)
                                                .notifier)
                                            .updateTransactionItem(
                                              index: index,
                                              category: value,
                                              currency: currencies[index],
                                            );
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedDropdownButton<Currency>(
                                      isExpanded: true,
                                      showClose: false,
                                      items: currencies,
                                      selectedItem: selectedCurrencies[index],
                                      icon: SizedBox(
                                        width: 16.0,
                                        height: 16.0,
                                        child: Center(
                                          child: Text(
                                            selectedCurrencies[index]
                                                .value
                                                .symbol,
                                            style:
                                                textTheme.labelMedium?.copyWith(
                                              textBaseline:
                                                  TextBaseline.ideographic,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      label: Text(
                                        Intl.message(
                                            'issue_form_transaction_8'),
                                      ),
                                      itemBuilder: (currency) =>
                                          Text(currency.code),
                                      onChanged: (value) {
                                        isTransactionItemEmpty.value = false;
                                        ref
                                            .read(issueFormControllerProvider(
                                                    categoryId: categoryId,
                                                    projectId: projectId,
                                                    issueId: issueId)
                                                .notifier)
                                            .updateTransactionItem(
                                              index: index,
                                              currency: value,
                                            );
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Material(
                                    elevation: priceFocusNodes[index].hasFocus
                                        ? 1.0
                                        : 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: priceFocusNodes[index].hasFocus
                                        ? colorScheme.surfaceBright
                                        : colorScheme.surfaceContainerLow,
                                    child: TextField(
                                      controller: priceControllers[index],
                                      focusNode: priceFocusNodes[index],
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      inputFormatters: [
                                        DecimalInputFormatter()
                                      ],
                                      textAlign: TextAlign.end,
                                      style: textTheme.bodyMedium,
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
                                        suffixText: selectedCurrencies[index]
                                            .value
                                            .symbol,
                                      ),
                                      onChanged: (value) {
                                        isTransactionItemEmpty.value = false;
                                        ref
                                            .read(issueFormControllerProvider(
                                              categoryId: categoryId,
                                              projectId: projectId,
                                              issueId: issueId,
                                            ).notifier)
                                            .updateTransactionItem(
                                                index: index,
                                                currency: currencies[index],
                                                price: value);
                                      },
                                      onSubmitted: (value) =>
                                          FocusScope.of(context).requestFocus(
                                              noteFocusNodes[index]),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Material(
                                          elevation:
                                              noteFocusNodes[index].hasFocus
                                                  ? 1.0
                                                  : 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: noteFocusNodes[index].hasFocus
                                              ? colorScheme.surfaceBright
                                              : colorScheme.surfaceContainerLow,
                                          child: TextField(
                                            controller: noteControllers[index],
                                            focusNode: noteFocusNodes[index],
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
                                              isTransactionItemEmpty.value =
                                                  false;
                                              ref
                                                  .read(
                                                      issueFormControllerProvider(
                                                    categoryId: categoryId,
                                                    projectId: projectId,
                                                    issueId: issueId,
                                                  ).notifier)
                                                  .updateTransactionItem(
                                                      index: index,
                                                      note: value);
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ElevatedIconButton(
                                          onTap: () async {
                                            if (items!.length == 1) {
                                              hasTransactionItems.value = false;
                                              isTransactionItemEmpty.value =
                                                  false;

                                              await opacityController.reverse();
                                              await sizeController.reverse();
                                            }

                                            ref
                                                .read(
                                                    issueFormControllerProvider(
                                                            categoryId:
                                                                categoryId,
                                                            projectId:
                                                                projectId,
                                                            issueId: issueId)
                                                        .notifier)
                                                .removeTransactionItem(
                                                    index: index);
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
                    ],
                  ),
                ),
              ),
            ),
          InvalidWidget(
            visible: hasTransactionItems.value,
            text: Intl.message('issue_form_transaction_item_invalid_1'),
          ),
          InvalidWidget(
            visible: isTransactionItemEmpty.value,
            text: Intl.message('issue_form_transaction_item_invalid_2'),
          ),
        ],
      ),
    );
  }
}
