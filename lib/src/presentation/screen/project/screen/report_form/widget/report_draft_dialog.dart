import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ReportDraftDialog extends ConsumerWidget {
  final int projectId;

  const ReportDraftDialog({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      reportDraftControllerProvider(projectId: projectId),
    );

    return BaseDialog(
      maxHeight: 600.0,
      contentPadding: EdgeInsets.zero,
      title: Intl.message('draft_dialog_title'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: AppTextButton(
                  onPressed: switch (state) {
                    AsyncData(:final value) when value.drafts.isNotEmpty =>
                      () => ref
                          .read(
                            reportDraftControllerProvider(
                              projectId: projectId,
                            ).notifier,
                          )
                          .deleteAllDrafts(),
                    _ => null,
                  },
                  text: Intl.message('draft_delete_all'),
                ),
              ),
            ],
          ),
          Divider(),
          Expanded(
            child: switch (state) {
              AsyncData(:final value) when value.drafts.isEmpty => Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text('임시 저장된 작성 내용이 없습니다.'),
              ),
              AsyncData(:final value) => ListView.separated(
                shrinkWrap: true,
                itemCount: value.drafts.length,
                separatorBuilder: (_, _) => const Divider(height: 1.0),
                itemBuilder: (context, index) {
                  final draft = value.drafts[index];
                  return _ListItemView(projectId: projectId, draft: draft);
                },
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
          onPressed: () => context.pop(),
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
  final int projectId;
  final Draft draft;

  const _ListItemView({required this.projectId, required this.draft});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final schedule = switch (draft.payload['schedule']) {
      final Schedule value => value,
      final Map value => Schedule.fromJson(Map<String, dynamic>.from(value)),
      _ => null,
    };
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
                if (schedule != null)
                  ScheduleSummaryCard(schedule: schedule)
                else
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
                          Intl.message('draft_no_schedule'),
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
                    color: preview != null
                        ? colorScheme.onSurface
                        : colorScheme.onSurface.muted,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  formatRelativeDate(draft.updatedAt),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.strong,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: AppIconButton(
              onTap: () => ref
                  .read(
                    reportDraftControllerProvider(
                      projectId: projectId,
                    ).notifier,
                  )
                  .delete(draft.id),
              size: 20.0,
              icon: Icon(Symbols.delete_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
