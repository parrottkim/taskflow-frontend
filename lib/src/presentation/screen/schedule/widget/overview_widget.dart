import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/schedule_list/schedule_list_screen.dart';
import 'package:taskflow/src/presentation/screen/schedule/screen/timeline/timeline_screen.dart';
import 'package:taskflow/src/presentation/screen/schedule/widget/schedule_add_button.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class OverviewWidget extends HookConsumerWidget {
  final String? view;

  const OverviewWidget({super.key, this.view});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = useState<ScheduleSegment>(
      ScheduleSegment.values.firstWhere(
        (e) => e.name == view,
        orElse: () => ScheduleSegment.values.first,
      ),
    );

    final controller = useTabController(
      initialLength: ScheduleSegment.values.length,
      initialIndex: ScheduleSegment.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = ScheduleSegment.values.firstWhere(
        (e) => e.name == view,
        orElse: () => ScheduleSegment.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(ScheduleSegment.values.indexOf(newItem));
      }

      return null;
    }, [view]);

    return Column(
      children: [
        TabBar(
          controller: controller,
          onTap: (index) {
            selectedItem.value = ScheduleSegment.values[index];

            ref
                .read(
                  scheduleFilterControllerProvider(
                    ScheduleFilterScope.schedulePage,
                  ).notifier,
                )
                .setView(view: selectedItem.value.name);

            context.goNamed(
              RouteNames.schedule,
              queryParameters: context.buildQueryParameters(
                updates: {'view': selectedItem.value.name, 'search': null},
              ),
            );

            controller.animateTo(index);
          },
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 24.0),
          tabs: List.generate(
            ScheduleSegment.values.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(ScheduleSegment.values[index].label),
            ),
          ),
        ),
        if (!Responsive.isDesktop(context))
          const Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              left: 24.0,
              right: 24.0,
              bottom: 8.0,
            ),
            child: Row(children: [Spacer(), ScheduleAddButton()]),
          ),
        Expanded(
          child: TabBarView(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            children: [TimelineScreen(), ScheduleListScreen()],
          ),
        ),
      ],
    );
  }
}
