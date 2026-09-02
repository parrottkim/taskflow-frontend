part of '../widget.dart';

extension ProjectDetailActionMenuConfiguration on UiConfiguration {
  List<ActionMenuItem> projectDetailActionMenu({
    required int projectId,
    required bool isClosed,
  }) => [
    ActionMenuItem(
      icon: Symbols.task_rounded,
      label: Intl.message('project_detail_action_1'),
      description: Intl.message('project_detail_action_1_1'),
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
      label: Intl.message('project_detail_action_2'),
      description: Intl.message('project_detail_action_2_1'),
      onPressed: () {
        context.pushNamed(
          RouteNames.reportNew,
          pathParameters: {'project_id': projectId.toString()},
        );
      },
    ),
  ];
}
