import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/work/screen/issue_list/issue_list_screen.dart';
import 'package:taskflow/src/presentation/screen/work/screen/project_list/project_list_screen.dart';
import 'package:taskflow/src/presentation/screen/work/screen/report_list/report_list_screen.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class OverviewWidget extends HookConsumerWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(workFilterControllerProvider);
    final selectedItem = useState<WorkSegment>(
      WorkSegment.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => WorkSegment.values.first,
      ),
    );

    final controller = useTabController(
      initialLength: WorkSegment.values.length,
      initialIndex: WorkSegment.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = WorkSegment.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => WorkSegment.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(WorkSegment.values.indexOf(newItem));
      }

      return null;
    }, [filter.view]);

    return Column(
      children: [
        TabBar(
          controller: controller,
          onTap: (index) {
            selectedItem.value = WorkSegment.values[index];

            ref
                .read(workFilterControllerProvider.notifier)
                .setView(view: selectedItem.value.name);

            context.goNamed(
              RouteNames.work,
              queryParameters: context.buildQueryParameters(
                updates: {'view': selectedItem.value.name},
              ),
            );

            controller.animateTo(index);
          },
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 24.0),
          tabs: List.generate(
            WorkSegment.values.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(WorkSegment.values[index].label),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              ProjectListScreen(),
              IssueListScreen(),
              ReportListScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
