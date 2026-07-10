import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/schedule/widget/schedule_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/schedule/widget/schedule_search_list_widget.dart';
import 'package:taskflow/src/presentation/screen/schedule/widget/schedule_timeline_widget.dart';
import 'package:taskflow/src/router/router.dart';

class ScheduleScreen extends HookConsumerWidget {
  final String? search;
  final String? departments;

  const ScheduleScreen({super.key, this.search, this.departments});

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
            .init(search: search, departments: departments),
      );
      return null;
    }, [search, departments]);

    final filter = ref.watch(
      scheduleFilterControllerProvider(ScheduleFilterScope.schedulePage),
    );
    final isListView = filter.value?.search?.trim().isNotEmpty ?? false;

    return BranchLayout(
      child: Column(
        children: [
          SizedBox(height: 24.0),
          ScheduleFilterWidget(),
          SizedBox(height: 8.0),
          if (isListView)
            ScheduleSearchListWidget()
          else
            ScheduleTimelineWidget(),
        ],
      ),
    );
  }
}
