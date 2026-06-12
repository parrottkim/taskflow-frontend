import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/screen/setting/screen/supplier/widget/supplier_edit_dialog.dart';

class SupplierAddButton extends ConsumerWidget {
  const SupplierAddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      onPressed: () {
        showDialog(context: context, builder: (_) => SupplierEditDialog());
      },
      icon: Icon(Symbols.add_rounded),
      label: Text(Intl.message('setting_supplier_add')),
    );
  }
}
