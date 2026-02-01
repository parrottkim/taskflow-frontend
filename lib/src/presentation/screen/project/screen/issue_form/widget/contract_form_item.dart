import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';

class ContractFormItem extends ConsumerWidget {
  final Currency? currency;
  final List<ContractItem> contractItems;
  final List<TransactionItem> transactionItems;
  final ValueNotifier<bool> hasContractItems;
  final ValueNotifier<bool> isContractItemEmpty;
  final ValueNotifier<bool> hasTransactionItems;
  final ValueNotifier<bool> isTransactionItemEmpty;
  final ValueNotifier<bool> isRatioInvalid;

  const ContractFormItem({
    super.key,
    this.currency,
    required this.contractItems,
    required this.transactionItems,
    required this.hasContractItems,
    required this.isContractItemEmpty,
    required this.hasTransactionItems,
    required this.isTransactionItemEmpty,
    required this.isRatioInvalid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final categoryId = int.parse(state.pathParameters['category_id']!);
    final projectId = int.parse(state.pathParameters['project_id']!);
    final issueId = int.tryParse(state.uri.queryParameters['issue_id'] ?? '');

    final filter = ref.watch(issueFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
        categoryId: categoryId,
        projectId: projectId,
        issueId: issueId,
        currency: currency,
        currencies: value.currencies,
        contractItems: contractItems,
        transactionItems: transactionItems,
        hasContractItems: hasContractItems,
        isContractItemEmpty: isContractItemEmpty,
        hasTransactionItems: hasTransactionItems,
        isTransactionItemEmpty: isTransactionItemEmpty,
        isRatioInvalid: isRatioInvalid,
        categories: value.transactionCategories,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          categoryId: categoryId,
          projectId: projectId,
          currency: Currency.empty(),
          currencies: [],
          contractItems: [],
          transactionItems: [],
          hasContractItems: hasContractItems,
          isContractItemEmpty: isContractItemEmpty,
          hasTransactionItems: hasTransactionItems,
          isTransactionItemEmpty: isTransactionItemEmpty,
          isRatioInvalid: isRatioInvalid,
          categories: [],
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int categoryId;
  final int projectId;
  final int? issueId;
  final Currency? currency;
  final List<Currency> currencies;
  final List<ContractItem> contractItems;
  final List<TransactionItem> transactionItems;
  final ValueNotifier<bool> hasContractItems;
  final ValueNotifier<bool> isContractItemEmpty;
  final ValueNotifier<bool> hasTransactionItems;
  final ValueNotifier<bool> isTransactionItemEmpty;
  final ValueNotifier<bool> isRatioInvalid;
  final List<TransactionItemCategory> categories;

  const _DesktopWidget({
    required this.categoryId,
    required this.projectId,
    this.issueId,
    this.currency,
    required this.currencies,
    required this.contractItems,
    required this.transactionItems,
    required this.hasContractItems,
    required this.isContractItemEmpty,
    required this.hasTransactionItems,
    required this.isTransactionItemEmpty,
    required this.isRatioInvalid,
    required this.categories,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    // Future<void> processFile(XFile file) async {
    //   hasContractItems.value = false;

    //   LoadingOverlay.show(context);

    //   try {
    //     final bytes = await file.readAsBytes();
    //     final blob = Blob([bytes]); // Blob 생성
    //     final jsFile = blob.jsify();

    //     final jsArray = await extractContract(jsFile).toDart;
    //     final rows = jsArray.toDart
    //         .map((element) => element.toDart.map((e) => e.dartify()).toList())
    //         .toList();

    //     ref
    //         .read(issueFormControllerProvider(
    //
    //                 projectId: projectId,
    //                 issueId: issueId)
    //             .notifier)
    //         .removeAllContractItem();

    //     for (final row in rows) {
    //       if (row.isEmpty) return;

    //       final rawPrice = row.last.toString().trim().replaceAll(',', '');
    //       final parsedPrice = int.tryParse(rawPrice);

    //       if (parsedPrice == null) continue;

    //       final item = row.first.toString();
    //       final price = NumberFormat('#,###').format(parsedPrice * 1000);

    //       ref
    //           .read(issueFormControllerProvider(
    //
    //                   projectId: projectId,
    //                   issueId: issueId)
    //               .notifier)
    //           .addContractItem(item: ContractItem(item: item, price: price));
    //     }
    //   } catch (e) {
    //     ref.read(toastProvider).showToast(
    //           child: Toast(
    //             type: ToastType.alert,
    //             message: Intl.message(
    //               'issue_form_contract_format_invalid',
    //               args: [file.name],
    //             ),
    //           ),
    //         );
    //   } finally {
    //     LoadingOverlay.hide();
    //   }
    // }

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
          // TODO: 추후 구현 필요
          // DropTarget(
          //   onDragDone: (details) async {
          //     LoadingOverlay.show(context);

          //     if (details.files.length > 1) {
          //       ref.read(toastProvider).showToast(
          //             child: Toast(
          //               type: ToastType.alert,
          //               message: Intl.message('issue_form_contract_too_many'),
          //             ),
          //           );
          //     }

          //     final file = details.files.last;
          //     final mimeType = details.files.last.mimeType;

          //     if (mimeType == null ||
          //         mimeType !=
          //             'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
          //       LoadingOverlay.hide();
          //       ref.read(toastProvider).showToast(
          //             child: Toast(
          //               type: ToastType.alert,
          //               message: Intl.message(
          //                 'issue_form_contract_invalid',
          //               ),
          //             ),
          //           );
          //       return;
          //     }

          //     await processFile(file);
          //   },
          //   onDragEntered: (details) => dragged.value = true,
          //   onDragExited: (details) => dragged.value = false,
          //   child: AnimatedContainer(
          //     duration: Duration(milliseconds: 300),
          //     curve: Curves.easeInQuad,
          //     padding: EdgeInsets.symmetric(vertical: 24.0),
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8.0),
          //       border: Border.all(
          //         color: dragged.value
          //             ? Theme.of(context)
          //                 .colorScheme
          //                 .primary
          //                 .withValues(alpha: 0.2)
          //             : Theme.of(context)
          //                 .colorScheme
          //                 .outline
          //                 .withValues(alpha: 0.2),
          //       ),
          //       color: dragged.value
          //           ? Theme.of(context)
          //               .colorScheme
          //               .tertiaryContainer
          //               .withValues(alpha: 0.5)
          //           : Theme.of(context).colorScheme.surface,
          //     ),
          //     child: Column(
          //       children: [
          //         Skeleton.unite(
          //           child: Stack(
          //             alignment: Alignment.bottomRight,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(6.0),
          //                 child: Icon(
          //                   Symbols.contract_rounded,
          //                   size: 36.0,
          //                   color: colorScheme.primary,
          //                 ),
          //               ),
          //               Positioned(
          //                 bottom: 4.0,
          //                 right: 4.0,
          //                 child: Container(
          //                   padding: EdgeInsets.all(3.0),
          //                   decoration: ShapeDecoration(
          //                     shape: CircleBorder(),
          //                     color: colorScheme.primary,
          //                   ),
          //                   child: Icon(
          //                     Symbols.upload_rounded,
          //                     size: 14.0,
          //                     weight: 700.0,
          //                     color: colorScheme.onPrimary,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(height: 12.0),
          //         Text(
          //           Intl.message('issue_form_contract_drop'),
          //           style: textTheme.bodyMedium?.copyWith(
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //         SizedBox(height: 4.0),
          //         Text(
          //           Intl.message('issue_form_contract_2'),
          //           style: textTheme.bodySmall?.copyWith(
          //             color: colorScheme.onSurface.withValues(alpha: 0.7),
          //           ),
          //         ),
          //         SizedBox(height: 12.0),
          //         Skeleton.unite(
          //           child: ElevatedButton(
          //             onPressed: () async {
          //               final xlsxType =
          //                   'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';

          //               final group = XTypeGroup(mimeTypes: [xlsxType]);

          //               final XFile? file = await openFile(
          //                   acceptedTypeGroups: <XTypeGroup>[group]);

          //               LoadingOverlay.show(context);

          //               if (file == null) {
          //                 LoadingOverlay.hide();
          //                 return;
          //               }

          //               if (extension(file.name) != '.xlsx') {
          //                 ref.read(toastProvider).showToast(
          //                       child: Toast(
          //                         type: ToastType.alert,
          //                         message: Intl.message(
          //                           'issue_form_contract_invalid',
          //                         ),
          //                       ),
          //                     );
          //                 LoadingOverlay.hide();
          //                 return;
          //               }

          //               // final bytes = await file.readAsBytes();
          //               // UNDONE: .xlsx mimeType 확인 불가
          //               // final mimeType =
          //               //     lookupMimeType(file.path, headerBytes: bytes);

          //               // if (mimeType == null || mimeType != xlsxType) {
          //               //   ref.read(toastProvider).showToast(
          //               //         child: Toast(
          //               //           type: ToastType.alert,
          //               //           message: Intl.message(
          //               //             'issue_form_contract_invalid',
          //               //             args: [file.name],
          //               //           ),
          //               //         ),
          //               //       );
          //               //   return;
          //               // }

          //               await processFile(file);
          //             },
          //             child: Text(
          //               Intl.message('issue_form_contract_upload'),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 16.0),
          TextButton.icon(
            onPressed: () {
              hasContractItems.value = false;
              isContractItemEmpty.value = false;

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
                  .addContractItem();
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
                        selectedItem: selectedCurrency,
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
                          ref
                              .read(
                                issueFormControllerProvider(
                                  projectId: projectId,
                                  categoryId: categoryId,
                                  issueId: issueId,
                                ).notifier,
                              )
                              .setContractCurrency(currency: value!);
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
                            columnWidth: FlexColumnWidth(0.7),
                            label: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Symbols.text_fields_rounded,
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.7,
                                    ),
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    Intl.message('issue_form_contract_3'),
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
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
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.7,
                                    ),
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    Intl.message('issue_form_contract_4'),
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
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
                                      isContractItemEmpty.value = false;

                                      ref
                                          .read(
                                            issueFormControllerProvider(
                                              projectId: projectId,
                                              categoryId: categoryId,
                                              issueId: issueId,
                                            ).notifier,
                                          )
                                          .updateContractItem(
                                            index: index,
                                            item: value,
                                          );
                                    },
                                    onSubmitted: (_) => FocusScope.of(
                                      context,
                                    ).requestFocus(contractPriceFocuses[index]),
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
                                            isContractItemEmpty.value = false;

                                            ref
                                                .read(
                                                  issueFormControllerProvider(
                                                    projectId: projectId,
                                                    categoryId: categoryId,
                                                    issueId: issueId,
                                                  ).notifier,
                                                )
                                                .updateContractItem(
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
                                            hasContractItems.value = false;
                                            isContractItemEmpty.value = false;

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
                                              .removeContractItem(index: index);
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
                              color: colorScheme.outline.withValues(alpha: 0.2),
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
                                '${NumberFormat('#,###').format(total)} ${selectedCurrency.value.code}',
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
          InvalidWidget(
            visible: hasContractItems.value,
            text: Intl.message('issue_form_contract_item_invalid_1'),
          ),
          InvalidWidget(
            visible: isContractItemEmpty.value,
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
              hasTransactionItems.value = false;
              isTransactionItemEmpty.value = false;

              ref
                  .read(
                    issueFormControllerProvider(
                      projectId: projectId,
                      categoryId: categoryId,
                      issueId: issueId,
                    ).notifier,
                  )
                  .addTransactionItem();
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
                            columnWidth: FixedColumnWidth(140.0),
                            label: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Symbols.checkbook_rounded,
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.7,
                                    ),
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    Intl.message('issue_form_transaction_3'),
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
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
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.7,
                                    ),
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    Intl.message('issue_form_transaction_4'),
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
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
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.7,
                                    ),
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    Intl.message('issue_form_transaction_5'),
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.7,
                                      ),
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
                                        TransactionItemCategory
                                      >(
                                        isExpanded: true,
                                        items: categories,
                                        selectedItem: selectedCategories[index],
                                        icon: Icon(Symbols.checkbook_rounded),
                                        label: Text(
                                          Intl.message(
                                            'issue_form_transaction_6',
                                          ),
                                        ),
                                        itemBuilder: (category) =>
                                            Text(category.name),
                                        onChanged: (value) {
                                          hasTransactionItems.value = false;
                                          isTransactionItemEmpty.value = false;
                                          isRatioInvalid.value = false;
                                          ref
                                              .read(
                                                issueFormControllerProvider(
                                                  projectId: projectId,
                                                  categoryId: categoryId,
                                                  issueId: issueId,
                                                ).notifier,
                                              )
                                              .updateTransactionItem(
                                                index: index,
                                                category: value,
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
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [DecimalInputFormatter()],
                                    textAlign: TextAlign.end,
                                    style: textTheme.bodyMedium,
                                    maxLength: 3,
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
                                      hasTransactionItems.value = false;
                                      isTransactionItemEmpty.value = false;
                                      isRatioInvalid.value = false;

                                      final ratio =
                                          double.tryParse(
                                            value.replaceAll(',', ''),
                                          ) ??
                                          0.0;

                                      final calculatedPrice =
                                          (total) * (ratio / 100);

                                      final formattedPrice = NumberFormat(
                                        '#,###.##',
                                      ).format(calculatedPrice);

                                      transactionPriceControllers[index].text =
                                          formattedPrice;

                                      ref
                                          .read(
                                            issueFormControllerProvider(
                                              projectId: projectId,
                                              categoryId: categoryId,
                                              issueId: issueId,
                                            ).notifier,
                                          )
                                          .updateTransactionItem(
                                            index: index,
                                            ratio: value,
                                            price: formattedPrice,
                                          );
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
                                            hasTransactionItems.value = false;
                                            isTransactionItemEmpty.value =
                                                false;
                                            isRatioInvalid.value = false;

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
                                              .removeTransactionItem(
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
          InvalidWidget(
            visible: hasTransactionItems.value,
            text: Intl.message('issue_form_transaction_item_invalid_1'),
          ),
          InvalidWidget(
            visible: isTransactionItemEmpty.value,
            text: Intl.message('issue_form_transaction_item_invalid_2'),
          ),
          InvalidWidget(
            visible: isRatioInvalid.value,
            text: Intl.message('issue_form_transaction_item_invalid_3'),
          ),
        ],
      ),
    );
  }
}
