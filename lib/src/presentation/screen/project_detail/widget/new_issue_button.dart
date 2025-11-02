import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/router/router.dart';

class NewIssueButton extends ConsumerWidget {
  const NewIssueButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final projectId = state.pathParameters['project_id'];

    final detail = ref.watch(
        projectDetailControllerProvider(projectId: int.parse(projectId!)));

    return FilledButton.icon(
      onPressed: detail is AsyncData &&
              detail.value != null &&
              !detail.value!.item.isClosed
          ? () {
              context.goNamed(RouteNames.issueNewChoose,
                  pathParameters: {'project_id': projectId});
            }
          : null,
      icon: Icon(Symbols.add_rounded),
      label: Text(
        Intl.message('issue_new'),
      ),
    );
  }
}
