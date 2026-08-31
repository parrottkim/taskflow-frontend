import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class SegmentWidget extends HookConsumerWidget {
  const SegmentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      projectFilterControllerProvider(ProjectFilterScope.projectPage),
    );
    final selectedItem = useState<ProjectStatusFilter>(
      ProjectStatusFilter.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => ProjectStatusFilter.values.first,
      ),
    );

    final controller = useTabController(
      initialLength: ProjectStatusFilter.values.length,
      initialIndex: ProjectStatusFilter.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = ProjectStatusFilter.values.firstWhere(
        (e) => e.name == filter.view,
        orElse: () => ProjectStatusFilter.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(ProjectStatusFilter.values.indexOf(newItem));
      }

      return null;
    }, [filter.view]);

    return TabBar(
      controller: controller,
      onTap: (index) {
        selectedItem.value = ProjectStatusFilter.values[index];

        ref
            .read(
              projectFilterControllerProvider(
                ProjectFilterScope.projectPage,
              ).notifier,
            )
            .setView(view: selectedItem.value.name);

        context.goNamed(
          RouteNames.project,
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
        ProjectStatusFilter.values.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(ProjectStatusFilter.values[index].label),
        ),
      ),
    );
  }
}
