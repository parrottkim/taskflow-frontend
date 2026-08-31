import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/issue_form_scope.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_form/widget/issue_draft_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class IssueDraftRecoveryWidget extends ConsumerWidget {
  final ValueChanged<String> onSelected;

  const IssueDraftRecoveryWidget({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final scope = IssueFormScope.of(context);
    final draft = ref.watch(
      issueDraftControllerProvider(projectId: scope.projectId),
    );
    final draftCount = draft.value?.drafts
        .where((item) => item.context['categoryId'] == scope.categoryId)
        .length;

    return Skeleton.unite(
      child: switch (draft) {
        AsyncData() when draftCount != null && draftCount > 0 => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ElevatedButton.icon(
            onPressed: () async {
              final draftId = await showDialog<String>(
                context: context,
                builder: (_) => scope.wrap(child: const IssueDraftDialog()),
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
      },
    );
  }
}
