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
      projectFilterControllerProvider(ProjectFilterScope.projectPage),
    );
    return ElevatedIconButton(
      onTap:
          filter.view != null ||
              filter.sort != null ||
              filter.order != null ||
              filter.search != null ||
              filter.bookmark != null ||
              filter.clients != null ||
              filter.categories != null
          ? () {
              ref.invalidate(
                projectFilterControllerProvider(ProjectFilterScope.projectPage),
              );

              context.goNamed(
                RouteNames.project,
                queryParameters: buildQueryParameters(
                  context,
                  updates: {
                    'view': null,
                    'sort': null,
                    'order': null,
                    'search': null,
                    'bookmark': null,
                    'clients': null,
                    'categories': null,
                  },
                ),
              );
            }
          : null,
      icon: Symbols.filter_alt_off_rounded,
    );
  }
}
