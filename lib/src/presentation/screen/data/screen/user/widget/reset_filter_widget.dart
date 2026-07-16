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
      userFilterControllerProvider(UserFilterScope.dataPage),
    );
    return ElevatedIconButton(
      onTap:
          (filter.search?.isNotEmpty ?? false) ||
              filter.departments != null ||
              filter.positionId != null
          ? () {
              context.goNamed(
                RouteNames.data,
                queryParameters: context.buildQueryParameters(
                  updates: {
                    'search': null,
                    'departments': null,
                    'position_id': null,
                  },
                ),
              );
            }
          : null,
      icon: Symbols.filter_alt_off_rounded,
    );
  }
}
