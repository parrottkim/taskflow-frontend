import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class SegmentWidget extends ConsumerWidget {
  const SegmentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(view: value.view),
      _ => Skeletonizer(child: _DesktopWidget()),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final String? view;

  const _DesktopWidget({this.view});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = useState<ProjectSegment>(
      ProjectSegment.values.firstWhere(
        (e) => e.name == view,
        orElse: () => ProjectSegment.values.first,
      ),
    );

    final controller = useTabController(
      initialLength: ProjectSegment.values.length,
      initialIndex: ProjectSegment.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = ProjectSegment.values.firstWhere(
        (e) => e.name == view,
        orElse: () => ProjectSegment.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(ProjectSegment.values.indexOf(newItem));
      }

      return null;
    }, [view]);

    return TabBar(
      controller: controller,
      onTap: (index) {
        selectedItem.value = ProjectSegment.values[index];

        ref
            .read(projectFilterControllerProvider.notifier)
            .setView(view: selectedItem.value.name);

        final queryParameters = ref
            .read(projectFilterControllerProvider.notifier)
            .toQueryParameters();

        context.goNamed(RouteNames.project, queryParameters: queryParameters);

        controller.animateTo(index);
      },
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelPadding: EdgeInsets.symmetric(horizontal: 24.0),
      tabs: List.generate(
        ProjectSegment.values.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(ProjectSegment.values[index].label),
        ),
      ),
    );
  }
}
