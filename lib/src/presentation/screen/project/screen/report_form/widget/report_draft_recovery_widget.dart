import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/report_draft_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ReportDraftRecoveryWidget extends ConsumerWidget {
  final int projectId;
  final ValueChanged<String> onSelected;

  const ReportDraftRecoveryWidget({
    super.key,
    required this.projectId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final draft = ref.watch(
      reportDraftControllerProvider(projectId: projectId),
    );

    return switch (draft) {
      AsyncData(:final value) when value.drafts.isNotEmpty => Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ElevatedButton.icon(
          onPressed: () async {
            final draftId = await showDialog<String>(
              context: context,
              builder: (_) => ReportDraftDialog(projectId: projectId),
            );

            if (draftId != null) onSelected(draftId);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.surfaceContainerHighest,
            foregroundColor: colorScheme.outline.strong,
            iconColor: colorScheme.outline.strong,
          ),
          icon: const Icon(Symbols.save_clock_rounded),
          label: Text(
            Intl.message('draft_list', args: [value.drafts.length]),
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      _ => const SizedBox.shrink(),
    };
  }
}
