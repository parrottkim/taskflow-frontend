import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/screen/setting/screen/supplier/widget/search_widget.dart';

class SupplierFilterWidget extends StatelessWidget {
  const SupplierFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(children: [Spacer(), SearchWidget()]),
    );
  }
}
