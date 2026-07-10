import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/data/screen/supplier/widget/supplier_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/data/screen/supplier/widget/supplier_list_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class SupplierScreen extends ConsumerWidget {
  const SupplierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(supplierSubmitControllerProvider, (_, state) {
      if (state is SupplierSubmitPending) {
        LoadingOverlay.show(context);
        return;
      }

      LoadingOverlay.hide();

      switch (state) {
        case SupplierSubmitCreated() || SupplierSubmitUpdated():
          final isCreated = state is SupplierSubmitCreated;

          ref
              .read(toastProvider)
              .showToast(
                child: Toast(
                  type: ToastType.verified,
                  message: Intl.message(
                    isCreated
                        ? 'data_supplier_created'
                        : 'data_supplier_updated',
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

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SupplierFilterWidget(),
          SizedBox(height: 8.0),
          SupplierListWidget(),
        ],
      ),
    );
  }
}
