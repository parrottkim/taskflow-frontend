import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class ResetFilterWidget extends ConsumerWidget {
  const ResetFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      scheduleFilterControllerProvider(ScheduleFilterScope.schedulePage),
    );

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
        search: value.search,
        departments: value.departments,
      ),
      _ => Skeletonizer(child: _DesktopWidget()),
    };
  }
}

class _DesktopWidget extends ConsumerWidget {
  final String? search;
  final List<int>? departments;

  const _DesktopWidget({this.search, this.departments});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedIconButton(
      onTap: search != null || departments != null
          ? () {
              ref.invalidate(
                scheduleFilterControllerProvider(
                  ScheduleFilterScope.schedulePage,
                ),
              );

              context.goNamed(RouteNames.schedule);
            }
          : null,
      icon: Symbols.filter_alt_off_rounded,
    );
  }
}
