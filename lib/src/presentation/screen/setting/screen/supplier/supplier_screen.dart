import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/screen/setting/screen/supplier/widget/supplier_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/setting/screen/supplier/widget/supplier_list_widget.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
