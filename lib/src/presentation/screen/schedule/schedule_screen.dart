import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/schedule/widget/overview_widget.dart';
import 'package:taskflow/src/presentation/screen/schedule/widget/schedule_add_button.dart';
import 'package:taskflow/src/router/router.dart';

class ScheduleScreen extends HookConsumerWidget {
  final String? view;
  final String? search;
  final String? departments;

  const ScheduleScreen({super.key, this.view, this.search, this.departments});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final location = GoRouter.of(context).name;

      if (location != RouteNames.schedule) return;

      Future.microtask(
        () => ref
            .read(
              scheduleFilterControllerProvider(
                ScheduleFilterScope.schedulePage,
              ).notifier,
            )
            .init(view: view, search: search, departments: departments),
      );
      return null;
    }, [search, departments]);

    return BranchLayout(
      actions: const [ScheduleAddButton()],
      child: OverviewWidget(view: view),
    );
  }
}
