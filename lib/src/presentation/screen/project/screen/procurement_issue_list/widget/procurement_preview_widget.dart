import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class ProcurementPreviewWidget extends StatelessWidget {
  const ProcurementPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton.icon(
              onPressed: () async {
                // await ref
                //     .read(tripPreviewControllerProvider.notifier)
                //     .preview(tripId: item.id);
              },
              icon: Icon(Symbols.print_rounded),
              label: Text(Intl.message('common_print')),
            ),
          ),
        ],
      ),
    );
  }
}
