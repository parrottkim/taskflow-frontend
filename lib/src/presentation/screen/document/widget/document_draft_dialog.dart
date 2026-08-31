import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class DocumentDraftDialog extends ConsumerWidget {
  final int? documentId;

  const DocumentDraftDialog({super.key, required this.documentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = documentDraftControllerProvider;
    final state = ref.watch(provider);
    final drafts = state.value?.drafts
        .where((draft) => _matchesDocument(draft, documentId))
        .toList();

    return BaseDialog(
      maxHeight: 600.0,
      contentPadding: EdgeInsets.zero,
      title: Intl.message('draft_dialog_title'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: AppTextButton(
                  onPressed: switch (state) {
                    AsyncData() when drafts != null && drafts.isNotEmpty =>
                      () async {
                        for (final draft in drafts) {
                          await ref.read(provider.notifier).delete(draft.id);
                        }
                      },
                    _ => null,
                  },
                  text: Intl.message('draft_delete_all'),
                ),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: switch (state) {
              AsyncData() when drafts != null && drafts.isEmpty =>
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('임시 저장된 작성 내용이 없습니다.'),
                ),
              AsyncData() => ListView.separated(
                shrinkWrap: true,
                itemCount: drafts!.length,
                separatorBuilder: (_, _) => const Divider(height: 1.0),
                itemBuilder: (_, index) => _ListItemView(draft: drafts[index]),
              ),
              AsyncError(:final error, :final stackTrace) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: ErrorStateView(error: error, stackTrace: stackTrace),
              ),
              _ => const Center(child: CircularProgressIndicator()),
            },
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: context.pop,
          child: Text(
            Intl.message('common_close'),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class _ListItemView extends ConsumerWidget {
  final Draft draft;

  const _ListItemView({required this.draft});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final title = draft.payload['title']?.toString().trim();
    final content = draft.payload['content']?.toString().trim();
    final normalizedContent = content
        ?.replaceAll(RegExp(r'!\[[^\]]*\]\([^\)]*\)'), '[이미지]')
        .replaceAll(RegExp(r'[#>*_`~-]+'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    final preview = normalizedContent == null || normalizedContent.isEmpty
        ? null
        : normalizedContent.length <= 160
        ? normalizedContent
        : '${normalizedContent.substring(0, 160)}…';

    return InkWell(
      onTap: () => Navigator.pop(context, draft.id),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      draft.mode == DraftMode.create
                          ? Symbols.note_add_rounded
                          : Symbols.edit_document_rounded,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        title == null || title.isEmpty
                            ? Intl.message('draft_no_preview')
                            : title,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  preview ?? Intl.message('draft_no_preview'),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    color: preview == null
                        ? colorScheme.onSurface.muted
                        : colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  formatRelativeDate(draft.updatedAt),
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.strong,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: AppIconButton(
              onTap: () => ref
                  .read(documentDraftControllerProvider.notifier)
                  .delete(draft.id),
              size: 20.0,
              icon: const Icon(Symbols.delete_rounded),
            ),
          ),
        ],
      ),
    );
  }
}

bool _matchesDocument(Draft draft, int? documentId) {
  if (documentId == null) return draft.mode == DraftMode.create;

  return draft.mode == DraftMode.edit && draft.entityId == documentId;
}
