import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/setting/screen/user/user_screen.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class OverviewWidget extends ConsumerWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(settingFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(view: value.view),
      _ => Skeletonizer(
          child: _DesktopWidget(),
        ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final String? view;

  const _DesktopWidget({this.view});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem =
        useState<SettingSegment>(SettingSegment.values.firstWhere(
      (e) => e.name == view,
      orElse: () => SettingSegment.values.first,
    ));

    final controller = useTabController(
      initialLength: SettingSegment.values.length,
      initialIndex: SettingSegment.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = SettingSegment.values.firstWhere(
        (e) => e.name == view,
        orElse: () => SettingSegment.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(SettingSegment.values.indexOf(newItem));
      }

      return null;
    }, [view]);

    return Column(
      children: [
        TabBar(
          controller: controller,
          onTap: (index) {
            selectedItem.value = SettingSegment.values[index];

            ref
                .read(settingFilterControllerProvider.notifier)
                .setView(view: selectedItem.value.name);

            final queryParameters = ref
                .read(settingFilterControllerProvider.notifier)
                .toQueryParameters();

            context.goNamed(RouteNames.setting,
                queryParameters: queryParameters);

            controller.animateTo(index);
          },
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 24.0),
          tabs: List.generate(
            SettingSegment.values.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                SettingSegment.values[index].label,
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              UserScreen(),
              Center(),
            ],
          ),
        )
      ],
    );
  }
}
