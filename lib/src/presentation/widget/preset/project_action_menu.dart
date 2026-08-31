part of '../widget.dart';

extension ProjectActionMenuConfiguration on UiConfiguration {
  List<ActionMenuItem> projectActionMenu({
    required int projectId,
    required bool isClosed,
  }) => [
    ActionMenuItem(
      icon: Symbols.task_rounded,
      label: Intl.message('project_action_1'),
      description: Intl.message('project_action_1_1'),
      onPressed: isClosed
          ? null
          : () {
              context.pushNamed(
                RouteNames.issueNewChoose,
                pathParameters: {'project_id': projectId.toString()},
              );
            },
    ),
    ActionMenuItem(
      icon: Symbols.summarize_rounded,
      label: Intl.message('project_action_2'),
      description: Intl.message('project_action_2_1'),
      onPressed: () {
        context.pushNamed(
          RouteNames.reportNew,
          pathParameters: {'project_id': projectId.toString()},
        );
      },
    ),
  ];
}
