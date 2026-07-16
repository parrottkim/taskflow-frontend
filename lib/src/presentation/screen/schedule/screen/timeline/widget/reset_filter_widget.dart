import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
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
    return ElevatedIconButton(
      onTap: filter.search != null || filter.departments != null
          ? () {
              ref.invalidate(
                scheduleFilterControllerProvider(
                  ScheduleFilterScope.schedulePage,
                ),
              );

              context.goNamed(
                RouteNames.schedule,
                queryParameters: context.buildQueryParameters(
                  updates: {'search': null, 'departments': null},
                ),
              );
            }
          : null,
      icon: Symbols.filter_alt_off_rounded,
    );
  }
}
