import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class ProjectActionScreen extends ConsumerWidget {
  final int projectId;

  const ProjectActionScreen({super.key, required this.projectId});

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
            isClosed: value.project.isClosed,
          ),
          AsyncError(:final error, :final stackTrace) => ErrorStateView(
            error: error,
            stackTrace: stackTrace,
          ),
          _ => Skeletonizer(
            child: _DesktopWidget(projectId: projectId, isClosed: false),
          ),
        },
      ),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final int projectId;
  final bool isClosed;

  const _DesktopWidget({required this.projectId, required this.isClosed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final actions = UiConfiguration(
      context,
    ).projectActionMenu(projectId: projectId, isClosed: isClosed);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          if (isClosed)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ContentContainer(
                color: colorScheme.outline.subtle,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Symbols.mountain_flag_rounded, size: 20.0),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Intl.message('project_detail_closed_1'),
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 4.0),
                          Text(Intl.message('project_detail_closed_2')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
