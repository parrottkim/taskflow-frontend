import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class TransactionFormItem extends ConsumerWidget {
  final Currency? currency;
  final List<TransactionIssueItem> items;

  const TransactionFormItem({super.key, this.currency, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(issueOptionsProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
        currency: currency,
        categories: value.transactionCategories,
        currencies: value.currencies,
        items: items,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorStateView(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        child: _DesktopWidget(
          currency: Currency.empty(),
          categories: [],
          currencies: [],
          items: List.filled(1, TransactionIssueItem.dummy()),
        ),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final Currency? currency;
  final List<TransactionIssueItemCategory> categories;
  final List<Currency> currencies;
  final List<TransactionIssueItem>? items;

  const _DesktopWidget({
    this.currency,
    required this.categories,
    required this.currencies,
    this.items,
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
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
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
                            columnWidth: FixedColumnWidth(100.0),
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
                            columnWidth: FixedColumnWidth(90.0),
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
                            columnWidth: FlexColumnWidth(0.4),
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
                          DataColumn(
                            columnWidth: FixedColumnWidth(90.0),
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
                                    Intl.message('issue_form_transaction_6'),
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
                        rows: List.generate(items!.length, (index) {
                          useListenable(priceFocusNodes[index]);
                          useListenable(noteFocusNodes[index]);

                          return DataRow(
                            cells: [
                              DataCell(
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(items![index].category!.name),
                                ),
                              ),
                              DataCell(
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    '${items![index].ratio} %',
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    '${items![index].price} ${currency!.symbol}',
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              DataCell(
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: AppToggleButton(
                                    value: items![index].isPaid,
                                    onChanged: (value) {
                                      ref
                                          .read(
                                            issueFormControllerProvider(
                                              projectId: projectId,
                                              categoryId: categoryId,
                                              issueId: issueId,
                                            ).notifier,
                                          )
                                          .toggleTransactionIssueItemPaid(
                                            index: index,
                                            isPaid: value,
                                          );
                                    },
                                  ),
                                ),
                              ),
                              DataCell(
                                Material(
                                  elevation: noteFocusNodes[index].hasFocus
                                      ? 1.0
                                      : 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
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
                                      validationController.clearTransaction();
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
                                            note: value,
                                          );
                                    },
                                  ),
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
            )
          else
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: ContentContainer(
                width: double.infinity,
                borderRadius: BorderRadius.circular(8.0),
                color: colorScheme.outline.subtle,
                borderColor: colorScheme.outline,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Intl.message('issue_form_transaction_item_empty_1'),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4.0),
                    AppTextButton(
                      onPressed: () async {
                        final filter = await ref.read(
                          issueOptionsProvider.future,
                        );
                        final list = await ref.read(
                          issueListControllerProvider(
                            projectId: projectId,
                          ).future,
                        );

                        final categoryId = filter.categories
                            .firstWhere((category) => category is IssueContract)
                            .id;

                        if (list.contract == null) {
                          context.goNamed(
                            RouteNames.issueNew,
                            pathParameters: {
                              'project_id': projectId.toString(),
                              'category_id': categoryId.toString(),
                            },
                          );
                        } else {
                          context.goNamed(
                            RouteNames.issueEdit,
                            pathParameters: {
                              'category_id': categoryId.toString(),
                              'project_id': projectId.toString(),
                              'issue_id': list.contract!.id.toString(),
                            },
                          );
                        }
                      },
                      text: Intl.message('issue_form_transaction_item_empty_2'),
                    ),
                  ],
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
        ],
      ),
    );
  }
}
