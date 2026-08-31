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
    final selectedItem = useState<WorkSection>(
      WorkSection.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => WorkSection.values.first,
      ),
    );

    final controller = useTabController(
      initialLength: WorkSection.values.length,
      initialIndex: WorkSection.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = WorkSection.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => WorkSection.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(WorkSection.values.indexOf(newItem));
      }

      return null;
    }, [filter.view]);

    return Column(
      children: [
        TabBar(
          controller: controller,
          onTap: (index) {
            selectedItem.value = WorkSection.values[index];

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
            WorkSection.values.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(WorkSection.values[index].label),
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
