import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/data/screen/supplier/widget/supplier_add_button.dart';
import 'package:taskflow/src/presentation/screen/data/widget/overview_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class DataScreen extends HookConsumerWidget {
  final String? view;
  final String? search;
  final String? departments;
  final int? positionId;

  const DataScreen({
    super.key,
    this.view,
    this.search,
    this.departments,
    this.positionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(dataFilterControllerProvider);

    useEffect(() {
      final location = GoRouter.of(context).location();

      if (!location.startsWith(Routes.data)) return;

      Future.microtask(() {
        ref.read(dataFilterControllerProvider.notifier).init(view: view);

        if (view == AdminDataSection.supplier.key) {
          ref
              .read(
                supplierFilterControllerProvider(
                  SupplierFilterScope.dataPage,
                ).notifier,
              )
              .init(search: search);
        } else {
          ref
              .read(
                userFilterControllerProvider(UserFilterScope.dataPage).notifier,
              )
              .init(
                search: search,
                departments: departments,
                positionId: positionId,
              );
        }
      });

      return null;
    }, [view, search, departments, positionId]);

    return BranchLayout(
      actions: [
        if (filter.view == AdminDataSection.supplier.name)
          const SupplierAddButton(),
      ],
      child: Padding(
        padding: EdgeInsets.only(top: 24.0),
        child: OverviewWidget(),
      ),
    );
  }
}
