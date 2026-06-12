import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/data/screen/supplier/widget/supplier_edit_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SupplierListWidget extends ConsumerWidget {
  const SupplierListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(supplierListControllerProvider);

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ContainerWidget(
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(8.0),
          child: switch (list) {
            AsyncData(:final value) => _DesktopWidget(items: value.items),
            AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
              error: error,
              stackTrace: stackTrace,
            ),
            _ => Skeletonizer(
              child: _DesktopWidget(items: List.filled(30, Supplier.dummy())),
            ),
          },
        ),
      ),
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  final List<Supplier> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    ref.listen(supplierSubmitControllerProvider, (_, state) {
      if (state is SupplierSubmitPending) {
        LoadingOverlay.show(context);
        return;
      }

      LoadingOverlay.hide();

      switch (state) {
        case SupplierSubmitCreated() || SupplierSubmitEdited():
          final isCreated = state is IssueSubmitCreated;

          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message(
                    isCreated
                        ? 'data_supplier_created'
                        : 'data_supplier_edited',
                  ),
                ),
              );

        case SupplierSubmitDeleted():
          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.standard,
                  message: Intl.message('data_supplier_deleted'),
                ),
              );

        default:
          break;
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Skeleton.keep(
          child: DataTable(
            headingRowHeight: 48.0,
            showCheckboxColumn: false,
            columns: [
              DataColumn(
                columnWidth: FlexColumnWidth(1.5),
                label: Text(
                  Intl.message('data_supplier_column_1'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(),
                label: Text(
                  Intl.message('data_supplier_column_2'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(2.5),
                label: Text(
                  Intl.message('data_supplier_column_3'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(),
                label: Text(
                  Intl.message('data_supplier_column_4'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FlexColumnWidth(),
                label: Text(
                  Intl.message('data_supplier_column_5'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              DataColumn(
                columnWidth: FixedColumnWidth(92.0),
                label: Text(
                  Intl.message('data_supplier_column_6'),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ],
            rows: [],
          ),
        ),
        Divider(),
        if (items.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/empty.svg',
                    width: 40.0,
                    height: 40.0,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurface.withValues(alpha: 0.7),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(Intl.message('data_supplier_no_item')),
                ],
              ),
            ),
          )
        else
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels >=
                    notification.metrics.maxScrollExtent - 20.0) {
                  ref.read(supplierListControllerProvider.notifier).load();
                }
                return false;
              },
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowHeight: 0.0,
                  showCheckboxColumn: false,
                  columns: [
                    DataColumn(
                      columnWidth: FlexColumnWidth(1.5),
                      label: Text(Intl.message('data_supplier_column_1')),
                    ),
                    DataColumn(
                      columnWidth: FlexColumnWidth(),
                      label: Text(Intl.message('data_supplier_column_2')),
                    ),
                    DataColumn(
                      columnWidth: FlexColumnWidth(2.5),
                      label: Text(Intl.message('data_supplier_column_3')),
                    ),
                    DataColumn(
                      columnWidth: FlexColumnWidth(),
                      label: Text(Intl.message('data_supplier_column_4')),
                    ),
                    DataColumn(
                      columnWidth: FlexColumnWidth(),
                      label: Text(Intl.message('data_supplier_column_5')),
                    ),
                    DataColumn(
                      columnWidth: FixedColumnWidth(92.0),
                      label: Text(
                        Intl.message('data_supplier_column_6'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(
                    items.length,
                    (index) => DataRow(
                      onSelectChanged: (value) {},
                      cells: [
                        DataCell(
                          Row(
                            children: [
                              Skeleton.unite(
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: items[index].logo != null
                                        ? Colors.white
                                        : colorScheme.primary,
                                  ),
                                  child: items[index].logo != null
                                      ? Image.network(
                                          items[index].logo!,
                                          fit: BoxFit.contain,
                                          errorBuilder: (_, _, _) => Icon(
                                            Symbols.public_rounded,
                                            size: 20.0,
                                            color: colorScheme.onPrimary,
                                          ),
                                        )
                                      : Icon(
                                          Symbols.public_rounded,
                                          size: 20.0,
                                          color: colorScheme.onPrimary,
                                        ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  items[index].name,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(items[index].number)),
                        DataCell(Text(items[index].address ?? '')),
                        DataCell(Text(items[index].phone ?? '')),
                        DataCell(Text(items[index].email ?? '')),
                        DataCell(
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedIconButton(
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    builder: (_) => SupplierEditDialog(
                                      supplierId: items[index].id,
                                    ),
                                  );
                                },
                                padding: EdgeInsets.all(4.0),
                                borderRadius: BorderRadius.circular(4.0),
                                icon: Symbols.edit_rounded,
                                size: 20.0,
                              ),
                              SizedBox(width: 8.0),
                              ElevatedIconButton(
                                onTap: () async {
                                  final result = await showDialog(
                                    context: context,
                                    builder: (_) => DeleteDialog(
                                      title: Intl.message(
                                        'data_supplier_delete_dialog_1',
                                      ),
                                      content: Intl.message(
                                        'data_supplier_delete_dialog_2',
                                      ),
                                    ),
                                  );

                                  if (result) {
                                    await ref
                                        .read(
                                          supplierSubmitControllerProvider
                                              .notifier,
                                        )
                                        .deleteSupplier(
                                          supplierId: items[index].id,
                                        );
                                  }
                                },
                                padding: EdgeInsets.all(4.0),
                                borderRadius: BorderRadius.circular(4.0),
                                icon: Symbols.delete_rounded,
                                size: 20.0,
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
      ],
    );
  }
}
