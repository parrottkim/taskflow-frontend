import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ProcurementExportWidget extends ConsumerWidget {
  final ProcurementIssue item;

  const ProcurementExportWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(issueExportControllerProvider, (_, state) {
      if (state is IssueExportLoading) {
        TextOverlay.show(context, Intl.message('export_loading_1'));
      } else if (state is IssueExportRendering) {
        TextOverlay.hide();
        TextOverlay.show(context, Intl.message('export_loading_2'));
      } else {
        TextOverlay.hide();
      }
    });

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton.icon(
              onPressed: () async {
                await ref
                    .read(issueExportControllerProvider.notifier)
                    .export(issueId: item.id);
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
