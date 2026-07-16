import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/work/widget/overview_widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class WorkScreen extends HookConsumerWidget {
  final String? view;

  const WorkScreen({super.key, this.view});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final location = GoRouter.of(context).name;

      if (location != RouteNames.work) return;

      Future.microtask(
        () => ref.read(workFilterControllerProvider.notifier).init(view: view),
      );

      return null;
    }, [view]);

    return BranchLayout(
      child: Padding(
        padding: Responsive.isDesktop(context)
            ? EdgeInsets.only(top: 24.0)
            : EdgeInsets.zero,
        child: OverviewWidget(),
      ),
    );
  }
}
