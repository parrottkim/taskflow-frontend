import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';

class ContractFormItem extends ConsumerWidget {
  final Currency? currency;
  final List<ContractIssueItem> contractItems;
  final List<TransactionIssueItem> transactionItems;

  const ContractFormItem({
    super.key,
    this.currency,
    required this.contractItems,
    required this.transactionItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(issueOptionsProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
        currency: currency,
        currencies: value.currencies,
        contractItems: contractItems,
        transactionItems: transactionItems,
        categories: value.transactionCategories,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorStateView(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          currency: Currency.empty(),
          currencies: [],
          contractItems: [],
          transactionItems: [],
          categories: [],
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final Currency? currency;
  final List<Currency> currencies;
  final List<ContractIssueItem> contractItems;
  final List<TransactionIssueItem> transactionItems;
  final List<TransactionIssueItemCategory> categories;

  const _DesktopWidget({
    this.currency,
    required this.currencies,
    required this.contractItems,
    required this.transactionItems,
    required this.categories,
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

    final selectedCurrency = useState(currency ?? currencies.first);

    final contractItemControllers = useMemoized(
      () => contractItems
          .map((element) => TextEditingController(text: element.item))
          .toList(),
      [contractItems.length],
    );
    final contractPriceControllers = useMemoized(
      () => contractItems
          .map((element) => TextEditingController(text: element.price))
          .toList(),
      [contractItems.length],
    );
    final contractItemFocuses = useMemoized(
      () => contractItems.map((_) => FocusNode()).toList(),
      [contractItems.length],
    );
    final contractPriceFocuses = useMemoized(
      () => contractItems.map((_) => FocusNode()).toList(),
      [contractItems.length],
    );

    final total = useMemoized(() {
      return contractItems.fold<double>(0.0, (sum, item) {
        final price = double.tryParse(item.price.replaceAll(',', '')) ?? 0.0;
        return sum + price;
      });
    }, [contractItems]);

    final selectedCategories = useMemoized(
      () => transactionItems
          .map((element) => ValueNotifier(element.category))
          .toList(),
      [transactionItems.length],
    );

    final transactionRatioControllers = useMemoized(
      () => transactionItems
          .map((element) => TextEditingController(text: element.ratio))
          .toList(),
      [transactionItems.length],
    );
    final transactionPriceControllers = useMemoized(
      () => transactionItems
          .map((element) => TextEditingController(text: element.price))
          .toList(),
      [transactionItems.length],
    );
    final transactionRatioFocuses = useMemoized(
      () => transactionItems.map((_) => FocusNode()).toList(),
      [transactionItems.length],
    );

    // total이 변경되면 transaction prices를 재계산
    useEffect(() {
      for (int i = 0; i < transactionItems.length; i++) {
        final ratio =
            double.tryParse(
              transactionRatioControllers[i].text.replaceAll(',', ''),
            ) ??
            0.0;
        final calculatedPrice = (total) * (ratio / 100);
        final formattedPrice = NumberFormat('#,##0.##').format(calculatedPrice);
        transactionPriceControllers[i].text = formattedPrice;
      }
      return null;
    }, [total]);

    // final dragged = useState(false);

    final contractOpacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final contractSizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (contractItems.isNotEmpty) {
        contractSizeController.forward().then((_) {
          contractOpacityController.forward();
        });
      } else {
        contractOpacityController.reverse().then((_) {
          contractSizeController.reverse();
        });
      }
      return null;
    }, [contractItems]);

    final transactionOpacityController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final transactionSizeController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    useEffect(() {
      if (transactionItems.isNotEmpty) {
        transactionSizeController.forward().then((_) {
          transactionOpacityController.forward();
        });
      } else {
        transactionSizeController.reverse().then((_) {
          transactionOpacityController.reverse();
        });
      }
      return null;
    }, [transactionItems]);

    return Container(
      padding: EdgeInsets.only(bottom: 24.0),
      constraints: BoxConstraints(maxWidth: 600.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intl.message('issue_form_contract_1'),
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.0),
          TextButton.icon(
            onPressed: () {
              validationController.clearContract();

              ref
                  .read(
                    issueFormControllerProvider(
                      projectId: projectId,
                      categoryId: categoryId,
                      issueId: issueId,
                    ).notifier,
                  )
                  .setContractCurrency(currency: selectedCurrency.value);

              ref
                  .read(
                    issueFormControllerProvider(
                      projectId: projectId,
                      categoryId: categoryId,
                      issueId: issueId,
                    ).notifier,
                  )
                  .addContractIssueItem();
            },
            icon: Icon(Symbols.add_rounded),
            label: Text(Intl.message('issue_form_contract_5')),
          ),
          if (contractItems.isNotEmpty)
            SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: contractSizeController,
                curve: Curves.easeInQuad,
              ),
              child: FadeTransition(
                opacity: contractOpacityController,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.0),
                      ElevatedDropdownButton<Currency>(
                        showClose: false,
                        items: currencies,
                        value: selectedCurrency.value,
                        icon: SizedBox(
                          width: 16.0,
                          height: 16.0,
                          child: Center(
                            child: Text(
                              selectedCurrency.value.symbol,
                              style: textTheme.labelMedium?.copyWith(
                                textBaseline: TextBaseline.ideographic,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        label: Text(Intl.message('issue_form_contract_6')),
                        itemBuilder: (currency) => Text(currency.code),
                        onChanged: (value) {
                          selectedCurrency.value = value;

                          ref
                              .read(
                                issueFormControllerProvider(
                                  projectId: projectId,
                                  categoryId: categoryId,
                                  issueId: issueId,
                                ).notifier,
                              )
                              .setContractCurrency(currency: value);
                        },
                      ),
                      SizedBox(height: 8.0),
                      DataTable(
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
                            columnWidth: FlexColumnWidth(0.7),
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
                                    Intl.message('issue_form_contract_3'),
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
                            columnWidth: FlexColumnWidth(0.5),
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
                                    Intl.message('issue_form_contract_4'),
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
                        rows: List.generate(contractItems.length, (index) {
                          useListenable(contractItemFocuses[index]);
                          useListenable(contractPriceFocuses[index]);

                          return DataRow(
                            cells: [
                              DataCell(
                                Material(
                                  elevation: contractItemFocuses[index].hasFocus
                                      ? 1.0
                                      : 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: contractItemFocuses[index].hasFocus
                                      ? colorScheme.surfaceBright
                                      : colorScheme.surfaceContainerLow,
                                  child: TextField(
                                    controller: contractItemControllers[index],
                                    focusNode: contractItemFocuses[index],
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
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        borderSide: BorderSide(
                                          width: 2.0,
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      validationController.clearContract();

                                      ref
                                          .read(
                                            issueFormControllerProvider(
                                              projectId: projectId,
                                              categoryId: categoryId,
                                              issueId: issueId,
                                            ).notifier,
                                          )
                                          .updateContractIssueItem(
                                            index: index,
                                            item: value,
                                          );
                                    },
                                    onSubmitted: (_) =>
                                        contractPriceFocuses[index]
                                            .requestFocus(),
                                  ),
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Expanded(
                                      child: Material(
                                        elevation:
                                            contractPriceFocuses[index].hasFocus
                                            ? 1.0
                                            : 0.0,
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        color:
                                            contractPriceFocuses[index].hasFocus
                                            ? colorScheme.surfaceBright
                                            : colorScheme.surfaceContainerLow,
                                        child: TextField(
                                          controller:
                                              contractPriceControllers[index],
                                          focusNode:
                                              contractPriceFocuses[index],
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            DecimalInputFormatter(),
                                          ],
                                          textAlign: TextAlign.end,
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
                                            suffixText:
                                                selectedCurrency.value.symbol,
                                          ),
                                          onChanged: (value) {
                                            validationController
                                                .clearContract();

                                            ref
                                                .read(
                                                  issueFormControllerProvider(
                                                    projectId: projectId,
                                                    categoryId: categoryId,
                                                    issueId: issueId,
                                                  ).notifier,
                                                )
                                                .updateContractIssueItem(
                                                  index: index,
                                                  price: value,
                                                );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ElevatedIconButton(
                                        onTap: () async {
                                          if (contractItems.length == 1) {
                                            validationController
                                                .clearContract();

                                            await contractOpacityController
                                                .reverse();
                                            await contractSizeController
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
                                              .removeContractIssueItem(
                                                index: index,
                                              );
                                        },
                                        padding: EdgeInsets.all(4.0),
                                        borderRadius: BorderRadius.circular(
                                          4.0,
                                        ),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Intl.message('issue_form_contract_8'),
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                              child: Text(
                                '${NumberFormat('#,##0.##').format(total)} ${selectedCurrency.value.code}',
                                textAlign: TextAlign.end,
                                style: TextStyle(fontWeight: FontWeight.w600),
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
          ValidationErrorMessage(
            visible: validation.contractItemsMissing,
            text: Intl.message('issue_form_contract_item_invalid_1'),
          ),
          ValidationErrorMessage(
            visible: validation.contractItemInvalid,
            text: Intl.message('issue_form_contract_item_invalid_2'),
          ),
          SizedBox(height: 24.0),
          Text(
            Intl.message('issue_form_transaction_1'),
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.0),
          TextButton.icon(
            onPressed: () {
              validationController.clearTransaction();

              ref
                  .read(
                    issueFormControllerProvider(
                      projectId: projectId,
                      categoryId: categoryId,
                      issueId: issueId,
                    ).notifier,
                  )
                  .addTransactionIssueItem();
            },
            icon: Icon(Symbols.add_rounded),
            label: Text(Intl.message('issue_form_transaction_2')),
          ),
          if (transactionItems.isNotEmpty)
            SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: transactionSizeController,
                curve: Curves.easeInQuad,
              ),
              child: FadeTransition(
                opacity: transactionOpacityController,
                child: Padding(
                  padding: EdgeInsets.only(top: 4.0),
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
                            columnWidth: FixedColumnWidth(140.0),
                            label: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Symbols.checkbook_rounded,
                                    color: colorScheme.onSurface.strong,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    Intl.message('issue_form_transaction_3'),
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
                            columnWidth: FlexColumnWidth(0.3),
                            label: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Symbols.pie_chart_rounded,
                                    color: colorScheme.onSurface.strong,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    Intl.message('issue_form_transaction_4'),
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
                            columnWidth: FlexColumnWidth(0.6),
                            label: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Symbols.attach_money_rounded,
                                    color: colorScheme.onSurface.strong,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    Intl.message('issue_form_transaction_5'),
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
                        rows: List.generate(transactionItems.length, (index) {
                          useListenable(transactionRatioFocuses[index]);
                          useListenable(transactionPriceControllers[index]);

                          return DataRow(
                            cells: [
                              DataCell(
                                SizedBox(
                                  width: double.infinity,
                                  child:
                                      ElevatedDropdownButton<
                                        TransactionIssueItemCategory
                                      >(
                                        isExpanded: true,
                                        items: categories,
                                        value: selectedCategories[index].value,
                                        icon: Icon(Symbols.checkbook_rounded),
                                        label: Text(
                                          Intl.message(
                                            'issue_form_transaction_6',
                                          ),
                                        ),
                                        itemBuilder: (category) =>
                                            Text(category.name),
                                        onChanged: (value) {
                                          selectedCategories[index].value =
                                              value;
                                          validationController
                                              .clearTransaction();
                                          ref
                                              .read(
                                                issueFormControllerProvider(
                                                  projectId: projectId,
                                                  categoryId: categoryId,
                                                  issueId: issueId,
                                                ).notifier,
                                              )
                                              .updateTransactionIssueItem(
                                                index: index,
                                                category: value,
                                              );
                                        },
                                        onClear: () {
                                          selectedCategories[index].value =
                                              null;
                                          validationController
                                              .clearTransaction();
                                          ref
                                              .read(
                                                issueFormControllerProvider(
                                                  projectId: projectId,
                                                  categoryId: categoryId,
                                                  issueId: issueId,
                                                ).notifier,
                                              )
                                              .updateTransactionIssueItem(
                                                index: index,
                                                category: null,
                                              );
                                        },
                                      ),
                                ),
                              ),
                              DataCell(
                                Material(
                                  elevation:
                                      transactionRatioFocuses[index].hasFocus
                                      ? 1.0
                                      : 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: transactionRatioFocuses[index].hasFocus
                                      ? colorScheme.surfaceBright
                                      : colorScheme.surfaceContainerLow,
                                  child: TextField(
                                    controller:
                                        transactionRatioControllers[index],
                                    focusNode: transactionRatioFocuses[index],
                                    keyboardType:
                                        TextInputType.number, // 숫자 키보드 표시
                                    inputFormatters: [DecimalInputFormatter()],
                                    textAlign: TextAlign.end,
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
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        borderSide: BorderSide(
                                          width: 2.0,
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                      counterText: '',
                                      suffixText: '%',
                                    ),
                                    onChanged: (value) {
                                      validationController.clearTransaction();

                                      try {
                                        final ratio =
                                            double.tryParse(
                                              value.replaceAll(',', ''),
                                            ) ??
                                            0.0;

                                        final calculatedPrice =
                                            (total) * (ratio / 100);

                                        final formattedPrice = NumberFormat(
                                          '#,##0.##',
                                        ).format(calculatedPrice);

                                        transactionPriceControllers[index]
                                                .text =
                                            formattedPrice;

                                        ref
                                            .read(
                                              issueFormControllerProvider(
                                                projectId: projectId,
                                                categoryId: categoryId,
                                                issueId: issueId,
                                              ).notifier,
                                            )
                                            .updateTransactionIssueItem(
                                              index: index,
                                              ratio: value,
                                              price: formattedPrice,
                                            );
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        readOnly: true,
                                        controller:
                                            transactionPriceControllers[index],
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
                                          suffixText:
                                              selectedCurrency.value.symbol,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ElevatedIconButton(
                                        onTap: () async {
                                          if (transactionItems.length == 1) {
                                            validationController
                                                .clearTransaction();

                                            await transactionOpacityController
                                                .reverse();
                                            await transactionSizeController
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
                                              .removeTransactionIssueItem(
                                                index: index,
                                              );
                                        },
                                        padding: EdgeInsets.all(4.0),
                                        borderRadius: BorderRadius.circular(
                                          4.0,
                                        ),
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
                    ],
                  ),
                ),
              ),
            ),
          ValidationErrorMessage(
            visible: validation.transactionItemsMissing,
            text: Intl.message('issue_form_transaction_item_invalid_1'),
          ),
          ValidationErrorMessage(
            visible: validation.transactionItemInvalid,
            text: Intl.message('issue_form_transaction_item_invalid_2'),
          ),
          ValidationErrorMessage(
            visible: validation.ratioInvalid,
            text: Intl.message('issue_form_transaction_item_invalid_3'),
          ),
        ],
      ),
    );
  }
}
