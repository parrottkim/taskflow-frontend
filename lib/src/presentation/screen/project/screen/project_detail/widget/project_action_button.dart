import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/router/router.dart';

class ProjectActionButton extends ConsumerWidget {
  const ProjectActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      onPressed: () {
        final state = GoRouterState.of(context);
        final projectId = state.pathParameters['project_id'];

        if (projectId != null) {
          context.pushNamed(
            RouteNames.projectAction,
            pathParameters: {'project_id': projectId},
          );
        }
      },
      icon: Icon(Symbols.add_rounded),
      label: Text(Intl.message('project_action')),
    );
  }
}
