import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class ProjectParticipantSummaryWidget extends HookConsumerWidget {
  final Project project;
  final ProjectParticipantSummary participantSummary;

  const ProjectParticipantSummaryWidget({
    super.key,
    required this.project,
    required this.participantSummary,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final auth = ref.watch(authControllerProvider);
    final isAssigningManager = useRef(false);
    final canAssignManager =
        project.id != 0 &&
        !project.isClosed &&
        auth is AuthAuthenticated &&
        auth.user.isAdmin;

    ref.listen(projectSubmitControllerProvider, (_, state) {
      if (!isAssigningManager.value) return;

      if (state is ProjectSubmitPending) {
        LoadingOverlay.show(context);
        return;
      }

      LoadingOverlay.hide();
      isAssigningManager.value = false;

      if (state is ProjectSubmitUpdated) {
        ref
            .read(toastProvider)
            .showToast(
              child: Toast(
                type: ToastType.verified,
                message: Intl.message('project_form_updated'),
              ),
            );
      } else if (state is ProjectSubmitFailure) {
        ref
            .read(toastProvider)
            .showToast(
              child: Toast(
                type: ToastType.error,
                message: Intl.message('error_unexpected'),
              ),
            );
      }
    });

    return ContentContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intl.message('project_detail_summary_7'),
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          if (participantSummary.manager case final manager?)
            UserInfo.compact(user: manager)
          else if (canAssignManager)
            InkWell(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (_) => UserSelectorDialog(
                    selectionType: UserSelectionType.single,
                    onSingleSelected: (manager) {
                      isAssigningManager.value = true;
                      unawaited(
                        ref
                            .read(projectSubmitControllerProvider.notifier)
                            .assignProjectManager(
                              project: project,
                              manager: manager,
                            ),
                      );
                    },
                  ),
                );
              },
              borderRadius: BorderRadius.circular(4.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 2.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Symbols.person_search_rounded, size: 20.0),
                    const SizedBox(width: 6.0),
                    Text(
                      Intl.message('project_detail_pm_empty'),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: colorScheme.onSurface.muted,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Text(
              '-',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.outline.strong,
              ),
            ),
          Divider(height: 32.0, color: colorScheme.outline.subtle),
          Text(
            Intl.message('project_detail_summary_8'),
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          if (participantSummary.participants.isEmpty)
            Text(
              '-',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.outline.strong,
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: participantSummary.participants.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8.0),
              itemBuilder: (context, index) {
                final item = participantSummary.participants[index];

                return _ParticipantInfo(item: item);
              },
            ),
        ],
      ),
    );
  }
}

class _ParticipantInfo extends StatelessWidget {
  final KickoffIssueParticipantItem item;

  const _ParticipantInfo({required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final participant = item.participant;

    if (participant == null) return const Text('-');

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Functions(
            context,
          ).generateColorFromId(participant.id),
          radius: 10.0,
          child: Text(
            getInitials(participant.username),
            style: const TextStyle(fontSize: 10.0, color: Colors.white),
          ),
        ),
        const SizedBox(width: 6.0),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                participant.username,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              if (item.role.isNotEmpty)
                Text(
                  item.role,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.outline.strong,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
