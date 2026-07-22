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
    final filter = ref.watch(workReportFilterControllerProvider);

    return ElevatedIconButton(
      onTap:
          filter.sort != null ||
              filter.order != null ||
              filter.search != null ||
              filter.clients != null ||
              filter.categories != null ||
              filter.start != null ||
              filter.end != null
          ? () {
              ref.invalidate(workReportFilterControllerProvider);

              context.goNamed(
                RouteNames.work,
                queryParameters: context.buildQueryParameters(
                  updates: {
                    'sort': null,
                    'order': null,
                    'search': null,
                    'clients': null,
                    'categories': null,
                    'start': null,
                    'end': null,
                  },
                ),
              );
            }
          : null,
      icon: Symbols.filter_alt_off_rounded,
    );
  }
}
