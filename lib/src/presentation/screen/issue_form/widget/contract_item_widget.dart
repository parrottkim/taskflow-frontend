import 'dart:js_interop';

import 'package:path/path.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_selector/file_selector.dart';
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
import 'package:taskflow/src/presentation/widget/overlay.dart';
import 'package:taskflow/src/presentation/widget/toast.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/provider.dart';
import 'package:taskflow/src/shared/tool/formatter.dart';
import 'package:taskflow/src/shared/tool/js_interop.dart';
import 'package:universal_html/html.dart';

class ContractItemWidget extends ConsumerWidget {
  final int categoryId;
  final int projectId;
  final int? issueId;
  final List<ContractItem>? items;
  final ValueNotifier<bool> hasContractItems;
  final ValueNotifier<bool> isContractItemEmpty;

  const ContractItemWidget({
    super.key,
    required this.categoryId,
    required this.projectId,
    this.issueId,
    this.items,
    required this.hasContractItems,
    required this.isContractItemEmpty,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(issueFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
          categoryId: categoryId,
          projectId: projectId,
          issueId: issueId,
          currencies: value.currencies,
          items: items,
          hasContractItems: hasContractItems,
          isContractItemEmpty: isContractItemEmpty,
        ),
      AsyncError(:final error, :final stackTrace) =>
        ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
          child: _DesktopWidget(
              categoryId: categoryId,
              projectId: projectId,
              currencies: [],
              hasContractItems: hasContractItems,
              isContractItemEmpty: isContractItemEmpty),
        ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final int categoryId;
  final int projectId;
  final int? issueId;
  final List<Currency> currencies;
  final List<ContractItem>? items;
  final ValueNotifier<bool> hasContractItems;
  final ValueNotifier<bool> isContractItemEmpty;

  const _DesktopWidget({
    required this.categoryId,
    required this.projectId,
    this.issueId,
    required this.currencies,
    this.items,
    required this.hasContractItems,
    required this.isContractItemEmpty,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selectedCurrencies = useMemoized(
      () =>
          items
              ?.map((element) =>
                  ValueNotifier(element.currency ?? currencies.first))
              .toList() ??
          [],
      [items?.length],
    );

    final itemControllers = useMemoized(
      () =>
          items
              ?.map((element) => TextEditingController(text: element.item))
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
    final itemFocusNodes = useMemoized(
      () => items?.map((_) => FocusNode()).toList() ?? [],
      [items?.length],
    );
    final priceFocusNodes = useMemoized(
      () => items?.map((_) => FocusNode()).toList() ?? [],
      [items?.length],
    );

    final total = useMemoized(
      () {
        return items?.map((e) => e.price).fold(0.0, (sum, priceString) {
          String cleanedPrice = priceString.replaceAll(',', '');
          double price = double.tryParse(cleanedPrice) ?? 0.0;
          return sum + price;
        });
      },
      [items],
    );

    final dragged = useState(false);

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

    useEffect(() {
      if (items != null && items!.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final formController = ref.read(issueFormControllerProvider(
            categoryId: categoryId,
            projectId: projectId,
            issueId: issueId,
          ).notifier);

          for (int i = 0; i < items!.length; i++) {
            final item = items![i];
            // ContractItem에 currency 값이 null이면, 기본 통화로 업데이트합니다.
            if (item.currency == null) {
              // ref.read()로 가져온 formController를 사용해 상태 업데이트
              formController.updateContractItem(
                index: i,
                currency: currencies.first,
              );
            }
          }
        });
      }
      return null;
    }, [items, currencies]);

    Future<void> processFile(XFile file) async {
      hasContractItems.value = false;

      LoadingOverlay.show(context);

      try {
        final bytes = await file.readAsBytes();
        final blob = Blob([bytes]); // Blob 생성
        final jsFile = blob.jsify();

        final jsArray = await extractContract(jsFile).toDart;
        final rows = jsArray.toDart
            .map((element) => element.toDart.map((e) => e.dartify()).toList())
            .toList();

        ref
            .read(issueFormControllerProvider(
                    categoryId: categoryId,
                    projectId: projectId,
                    issueId: issueId)
                .notifier)
            .removeAllContractItem();

        for (final row in rows) {
          if (row.isEmpty) return;

          final rawPrice = row.last.toString().trim().replaceAll(',', '');
          final parsedPrice = int.tryParse(rawPrice);

          if (parsedPrice == null) continue;

          final item = row.first.toString();
          final price = NumberFormat('#,###').format(parsedPrice * 1000);

          ref
              .read(issueFormControllerProvider(
                      categoryId: categoryId,
                      projectId: projectId,
                      issueId: issueId)
                  .notifier)
              .addContractItem(item: ContractItem(item: item, price: price));
        }
      } catch (e) {
        ref.read(toastProvider).showToast(
              child: Toast(
                type: ToastType.alert,
                message: Intl.message(
                  'issue_form_contract_format_invalid',
                  args: [file.name],
                ),
              ),
            );
      } finally {
        LoadingOverlay.hide();
      }
    }

    return Container(
      padding: EdgeInsets.only(bottom: 24.0),
      constraints: BoxConstraints(maxWidth: 600.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intl.message('issue_form_contract_1'),
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          DropTarget(
            onDragDone: (details) async {
              LoadingOverlay.show(context);

              if (details.files.length > 1) {
                ref.read(toastProvider).showToast(
                      child: Toast(
                        type: ToastType.alert,
                        message: Intl.message('issue_form_contract_too_many'),
                      ),
                    );
              }

              final file = details.files.last;
              final mimeType = details.files.last.mimeType;

              if (mimeType == null ||
                  mimeType !=
                      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
                LoadingOverlay.hide();
                ref.read(toastProvider).showToast(
                      child: Toast(
                        type: ToastType.alert,
                        message: Intl.message(
                          'issue_form_contract_invalid',
                        ),
                      ),
                    );
                return;
              }

              await processFile(file);
            },
            onDragEntered: (details) => dragged.value = true,
            onDragExited: (details) => dragged.value = false,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInQuad,
              padding: EdgeInsets.symmetric(vertical: 24.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: dragged.value
                      ? Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.2)
                      : Theme.of(context)
                          .colorScheme
                          .outline
                          .withValues(alpha: 0.2),
                ),
                color: dragged.value
                    ? Theme.of(context)
                        .colorScheme
                        .tertiaryContainer
                        .withValues(alpha: 0.5)
                    : Theme.of(context).colorScheme.surface,
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(
                          Symbols.contract_rounded,
                          size: 36.0,
                          color: colorScheme.primary,
                        ),
                      ),
                      Positioned(
                        bottom: 4.0,
                        right: 4.0,
                        child: Container(
                          padding: EdgeInsets.all(3.0),
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: colorScheme.primary,
                          ),
                          child: Icon(
                            Symbols.upload_rounded,
                            size: 14.0,
                            weight: 700.0,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    Intl.message('issue_form_contract_drop'),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    Intl.message('issue_form_contract_2'),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  ElevatedButton(
                    onPressed: () async {
                      final xlsxType =
                          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';

                      final group = XTypeGroup(mimeTypes: [xlsxType]);

                      final XFile? file = await openFile(
                          acceptedTypeGroups: <XTypeGroup>[group]);

                      LoadingOverlay.show(context);

                      if (file == null) {
                        LoadingOverlay.hide();
                        return;
                      }

                      if (extension(file.name) != '.xlsx') {
                        ref.read(toastProvider).showToast(
                              child: Toast(
                                type: ToastType.alert,
                                message: Intl.message(
                                  'issue_form_contract_invalid',
                                ),
                              ),
                            );
                        LoadingOverlay.hide();
                        return;
                      }

                      // final bytes = await file.readAsBytes();
                      // UNDONE: .xlsx mimeType 확인 불가
                      // final mimeType =
                      //     lookupMimeType(file.path, headerBytes: bytes);

                      // if (mimeType == null || mimeType != xlsxType) {
                      //   ref.read(toastProvider).showToast(
                      //         child: Toast(
                      //           type: ToastType.alert,
                      //           message: Intl.message(
                      //             'issue_form_contract_invalid',
                      //             args: [file.name],
                      //           ),
                      //         ),
                      //       );
                      //   return;
                      // }

                      await processFile(file);
                    },
                    child: Text(
                      Intl.message('issue_form_contract_upload'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          TextButton.icon(
            onPressed: () {
              hasContractItems.value = false;
              isContractItemEmpty.value = false;

              ref
                  .read(issueFormControllerProvider(
                          categoryId: categoryId,
                          projectId: projectId,
                          issueId: issueId)
                      .notifier)
                  .addContractItem();
            },
            icon: Icon(
              Symbols.add_rounded,
            ),
            label: Text(
              Intl.message('issue_form_contract_7'),
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
                            columnWidth: FlexColumnWidth(0.7),
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
                                    Intl.message('issue_form_contract_3'),
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
                                    Intl.message('issue_form_contract_4'),
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
                            columnWidth: FlexColumnWidth(0.5),
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
                                    Intl.message('issue_form_contract_5'),
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
                            useListenable(itemFocusNodes[index]);
                            useListenable(priceFocusNodes[index]);

                            return DataRow(
                              cells: [
                                DataCell(
                                  Material(
                                    elevation: itemFocusNodes[index].hasFocus
                                        ? 1.0
                                        : 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: itemFocusNodes[index].hasFocus
                                        ? colorScheme.surfaceBright
                                        : colorScheme.surfaceContainerLow,
                                    child: TextField(
                                      controller: itemControllers[index],
                                      focusNode: itemFocusNodes[index],
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
                                        isContractItemEmpty.value = false;

                                        ref
                                            .read(issueFormControllerProvider(
                                              categoryId: categoryId,
                                              projectId: projectId,
                                              issueId: issueId,
                                            ).notifier)
                                            .updateContractItem(
                                                index: index, item: value);
                                      },
                                      onSubmitted: (value) =>
                                          FocusScope.of(context).requestFocus(
                                              priceFocusNodes[index]),
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
                                        Intl.message('issue_form_contract_6'),
                                      ),
                                      itemBuilder: (currency) =>
                                          Text(currency.code),
                                      onChanged: (value) {
                                        isContractItemEmpty.value = false;
                                        ref
                                            .read(issueFormControllerProvider(
                                                    categoryId: categoryId,
                                                    projectId: projectId,
                                                    issueId: issueId)
                                                .notifier)
                                            .updateContractItem(
                                                index: index, currency: value);
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Material(
                                          elevation:
                                              priceFocusNodes[index].hasFocus
                                                  ? 1.0
                                                  : 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: priceFocusNodes[index].hasFocus
                                              ? colorScheme.surfaceBright
                                              : colorScheme.surfaceContainerLow,
                                          child: TextField(
                                            controller: priceControllers[index],
                                            focusNode: priceFocusNodes[index],
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              ThousandsSeparatorInputFormatter()
                                            ],
                                            textAlign: TextAlign.end,
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
                                              suffixText:
                                                  selectedCurrencies[index]
                                                      .value
                                                      .symbol,
                                            ),
                                            onChanged: (value) {
                                              isContractItemEmpty.value = false;

                                              ref
                                                  .read(
                                                      issueFormControllerProvider(
                                                    categoryId: categoryId,
                                                    projectId: projectId,
                                                    issueId: issueId,
                                                  ).notifier)
                                                  .updateContractItem(
                                                      index: index,
                                                      price: value);
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ElevatedIconButton(
                                          onTap: () async {
                                            if (items!.length == 1) {
                                              hasContractItems.value = false;
                                              isContractItemEmpty.value = false;

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
                                                .removeContractItem(
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
                                  Intl.message('issue_form_contract_8'),
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
          InvalidWidget(
            visible: hasContractItems.value,
            text: Intl.message('issue_form_contract_item_invalid_1'),
          ),
          InvalidWidget(
            visible: isContractItemEmpty.value,
            text: Intl.message('issue_form_contract_item_invalid_2'),
          ),
        ],
      ),
    );
  }
}
