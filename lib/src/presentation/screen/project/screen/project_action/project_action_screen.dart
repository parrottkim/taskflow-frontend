import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

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
          AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
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

    final actions = [
      (
        title: Intl.message('project_action_1'),
        description: Intl.message('project_action_1_1'),
        enabled: !isClosed,
        onTap: () {
          context.pushNamed(
            RouteNames.issueNewChoose,
            pathParameters: {'project_id': projectId.toString()},
          );
        },
      ),
      (
        title: Intl.message('project_action_2'),
        description: Intl.message('project_action_2_1'),
        enabled: true,
        onTap: () {
          context.pushNamed(
            RouteNames.reportNewChoose,
            pathParameters: {'project_id': projectId.toString()},
          );
        },
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerWidget(
            elevation: 1.0,
            padding: EdgeInsets.zero,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: actions.length,
              itemBuilder: (context, index) {
                final action = actions[index];

                return InkWell(
                  onTap: action.enabled ? action.onTap : null,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              index == 0
                                  ? Symbols.mountain_flag_rounded
                                  : Symbols.description_rounded,
                              size: 20.0,
                              color: action.enabled
                                  ? colorScheme.primary
                                  : colorScheme.onSurface.withValues(
                                      alpha: 0.35,
                                    ),
                            ),
                            SizedBox(width: 6.0),
                            Text(
                              action.title,
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: action.enabled
                                    ? null
                                    : colorScheme.onSurface.withValues(
                                        alpha: 0.35,
                                      ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Symbols.arrow_right_alt_rounded,
                              size: 20.0,
                              color: action.enabled
                                  ? colorScheme.onSurface.withValues(alpha: 0.7)
                                  : colorScheme.onSurface.withValues(
                                      alpha: 0.25,
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          action.description,
                          style: textTheme.bodySmall?.copyWith(
                            color: action.enabled
                                ? colorScheme.onSurface.withValues(alpha: 0.7)
                                : colorScheme.onSurface.withValues(alpha: 0.35),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => Divider(),
            ),
          ),
          if (isClosed) ...[
            SizedBox(height: 16.0),
            ContainerWidget(
              padding: const EdgeInsets.all(16.0),
              color: colorScheme.errorContainer,
              child: Row(
                children: [
                  Icon(
                    Symbols.warning_rounded,
                    size: 20.0,
                    color: colorScheme.error,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      '프로젝트가 종결되어 업무 등록은 사용할 수 없습니다.',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.error.withValues(alpha: 0.8),
                        fontWeight: FontWeight.w600,
                      ),
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
