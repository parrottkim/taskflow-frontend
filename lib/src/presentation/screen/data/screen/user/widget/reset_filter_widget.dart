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
      userFilterControllerProvider(UserFilterScope.dataPage),
    );
    final dataFilter = ref.watch(dataFilterControllerProvider);

    return switch ((filter, dataFilter)) {
      (AsyncData(value: final value), AsyncData(value: final dataFilter)) =>
        _DesktopWidget(
          view: dataFilter.view,
          search: value.search,
          departments: value.departments,
          positionId: value.positionId,
        ),
      _ => Skeletonizer(child: _DesktopWidget()),
    };
  }
}

class _DesktopWidget extends ConsumerWidget {
  final String? view;
  final String? search;
  final List<int>? departments;
  final int? positionId;

  const _DesktopWidget({
    this.view,
    this.search,
    this.departments,
    this.positionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedIconButton(
      onTap: search != null || departments != null || positionId != null
          ? () {
              ref.invalidate(
                userFilterControllerProvider(UserFilterScope.dataPage),
              );

              context.goNamed(
                RouteNames.data,
                queryParameters: {if (view != null) 'view': view},
              );
            }
          : null,
      icon: Symbols.filter_alt_off_rounded,
    );
  }
}
