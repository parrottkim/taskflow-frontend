import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ProcurementRequestExportWidget extends ConsumerWidget {
  final ProcurementIssue item;
  final List<ProcurementIssueRequest> requests;

  const ProcurementRequestExportWidget({
    super.key,
    required this.item,
    required this.requests,
  });

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

    return IgnorePointer(
      ignoring: requests.isNotEmpty,
      child: Opacity(
        opacity: requests.isNotEmpty ? 0.4 : 1.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextButton.icon(
            onPressed: () async => await ref
                .read(issueExportControllerProvider.notifier)
                .exportPurchaseRequest(issueId: item.id),
            icon: Icon(Symbols.print_rounded),
            label: Text(Intl.message('issue_form_procurement_18')),
          ),
        ),
      ),
    );
  }
}
