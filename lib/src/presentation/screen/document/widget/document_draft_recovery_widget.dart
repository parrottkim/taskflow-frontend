import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/document/widget/document_draft_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DocumentDraftRecoveryWidget extends ConsumerWidget {
  final int? documentId;
  final ValueChanged<String> onSelected;

  const DocumentDraftRecoveryWidget({
    super.key,
    required this.documentId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(documentDraftControllerProvider);
    final draftCount = state.value?.drafts
        .where((draft) => _matchesDocument(draft, documentId))
        .length;

    return switch (state) {
      AsyncData() when draftCount != null && draftCount > 0 => Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: ElevatedButton.icon(
          onPressed: () async {
            final draftId = await showDialog<String>(
              context: context,
              builder: (_) => DocumentDraftDialog(documentId: documentId),
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
            Intl.message('draft_list', args: [draftCount]),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      _ => const SizedBox.shrink(),
    };
  }
}

bool _matchesDocument(Draft draft, int? documentId) {
  if (documentId == null) return draft.mode == DraftMode.create;

  return draft.mode == DraftMode.edit && draft.entityId == documentId;
}
