import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/router/router.dart';

class SupplierAddButton extends ConsumerWidget {
  const SupplierAddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      onPressed: () {
        context.pushNamed(
          RouteNames.supplierNew,
          queryParameters: buildQueryParameters(
            context,
            updates: const {'view': 'supplier'},
          ),
        );
      },
      icon: Icon(Symbols.add_rounded),
      label: Text(Intl.message('data_supplier_add')),
    );
  }
}
