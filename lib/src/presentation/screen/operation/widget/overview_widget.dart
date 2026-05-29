import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/operation/screen/supplier/supplier_screen.dart';
import 'package:taskflow/src/presentation/screen/operation/screen/user/user_screen.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class OverviewWidget extends ConsumerWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(operationFilterControllerProvider);

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
    final selectedItem = useState<OperationSegment>(
      OperationSegment.values.firstWhere(
        (e) => e.name == view,
        orElse: () => OperationSegment.values.first,
      ),
    );

    final controller = useTabController(
      initialLength: OperationSegment.values.length,
      initialIndex: OperationSegment.values.indexOf(selectedItem.value),
    );

    useEffect(() {
      final newItem = OperationSegment.values.firstWhere(
        (e) => e.name == view,
        orElse: () => OperationSegment.values.first,
      );

      if (selectedItem.value != newItem) {
        selectedItem.value = newItem;
        controller.animateTo(OperationSegment.values.indexOf(newItem));
      }

      return null;
    }, [view]);

    return Column(
      children: [
        TabBar(
          controller: controller,
          onTap: (index) {
            selectedItem.value = OperationSegment.values[index];

            ref
                .read(operationFilterControllerProvider.notifier)
                .setView(view: selectedItem.value.name);

            final queryParameters = ref
                .read(operationFilterControllerProvider.notifier)
                .toQueryParameters();

            context.goNamed(
              RouteNames.operation,
              queryParameters: queryParameters,
            );

            controller.animateTo(index);
          },
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 24.0),
          tabs: List.generate(
            OperationSegment.values.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(OperationSegment.values[index].label),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [UserScreen(), ClientScreen()],
          ),
        ),
      ],
    );
  }
}
