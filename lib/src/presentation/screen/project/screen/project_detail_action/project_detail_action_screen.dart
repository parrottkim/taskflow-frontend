import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_category/widget/closure_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class ProjectDetailActionScreen extends ConsumerWidget {
  final int projectId;

  const ProjectDetailActionScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(
      projectDetailControllerProvider(projectId: projectId),
    );

    return BranchLayout(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 430.0),
        child: switch (detail) {
          AsyncData(:final value) => _DesktopWidget(
            projectId: projectId,
            project: value.project,
          ),
          AsyncError(:final error, :final stackTrace) => ErrorStateView(
            error: error,
            stackTrace: stackTrace,
          ),
          _ => Skeletonizer(
            child: _DesktopWidget(
              projectId: projectId,
              project: Project.dummy(),
            ),
          ),
        },
      ),
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  final int projectId;
  final Project project;

  const _DesktopWidget({required this.projectId, required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final actions = UiConfiguration(
      context,
    ).projectDetailActionMenu(projectId: projectId, isClosed: project.isClosed);

    final isClosable = !project.isClosed && project.isClosable;

    final backgroundColor = isClosable
        ? colorScheme.errorContainer
        : colorScheme.onSurface.withValues(alpha: 0.12);

    final foregroundColor = isClosable
        ? colorScheme.error
        : colorScheme.onSurface.withValues(alpha: 0.38);

    final secondaryColor = isClosable
        ? colorScheme.error.strong
        : colorScheme.onSurface.withValues(alpha: 0.38);

    final borderColor = colorScheme.outline.subtle;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (project.isClosed) ...[
            ContentContainer(
              color: colorScheme.outline.subtle,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Symbols.mountain_flag_rounded, size: 20.0),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Intl.message('project_closed_title'),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4.0),
                        Text(Intl.message('project_closed_description')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
          ContentContainer(
            elevation: 1.0,
            padding: EdgeInsets.zero,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: actions.length,
              itemBuilder: (context, index) {
                final action = actions[index];

                return InkWell(
                  onTap: action.onPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              action.icon,
                              size: 20.0,
                              color: action.onPressed != null
                                  ? colorScheme.primary
                                  : colorScheme.onSurface.muted,
                            ),
                            SizedBox(width: 6.0),
                            Text(
                              action.label,
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: action.onPressed != null
                                    ? null
                                    : colorScheme.onSurface.muted,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Symbols.arrow_right_alt_rounded,
                              size: 20.0,
                              color: action.onPressed != null
                                  ? colorScheme.onSurface.strong
                                  : colorScheme.onSurface.subtle,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          action.description,
                          style: textTheme.bodySmall?.copyWith(
                            color: action.onPressed != null
                                ? colorScheme.onSurface.strong
                                : colorScheme.onSurface.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, _) => Divider(),
            ),
          ),
          if (!project.isClosed) ...[
            const SizedBox(height: 16.0),
            ContentContainer(
              elevation: isClosable ? 1.0 : 0.0,
              padding: EdgeInsets.zero,
              color: backgroundColor,
              borderColor: borderColor,
              child: Column(
                children: [
                  InkWell(
                    onTap: isClosable
                        ? () async {
                            final project = await ref.read(
                              projectDetailControllerProvider(
                                projectId: projectId,
                              ).future,
                            );

                            if (!context.mounted) return;

                            final closed = await showDialog<bool>(
                              context: context,
                              builder: (_) =>
                                  ClosureDialog(project: project.project),
                            );

                            if (!context.mounted || closed != true) return;

                            ref
                                .read(toastProvider)
                                .showToast(
                                  child: Toast(
                                    type: ToastType.verified,
                                    message: Intl.message(
                                      'project_closure_success',
                                    ),
                                  ),
                                );

                            context.goNamed(
                              RouteNames.projectDetail,
                              pathParameters: {
                                'project_id': projectId.toString(),
                              },
                            );
                          }
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Symbols.mountain_flag_rounded,
                                size: 20.0,
                                color: foregroundColor,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                Intl.message('project_closure_title'),
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: foregroundColor,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Symbols.arrow_right_alt_rounded,
                                size: 20.0,
                                color: secondaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            Intl.message('project_closure_description'),
                            style: textTheme.bodySmall?.copyWith(
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!isClosable)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        border: Border(
                          top: BorderSide(color: colorScheme.outline.subtle),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Symbols.info_rounded,
                            size: 18.0,
                            color: colorScheme.onSurface.strong,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Intl.message(
                                    'project_closure_not_available_title',
                                  ),
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  Intl.message(
                                    'project_closure_not_available_description',
                                  ),
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface.strong,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
