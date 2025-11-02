import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/preset.dart';
import 'package:taskflow/src/router/router.dart';

class ResetFilterWidget extends ConsumerWidget {
  const ResetFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
          view: value.view,
          sort: value.sort,
          order: value.order,
          search: value.search,
          bookmark: value.bookmark,
          clients: value.clients,
          categories: value.categories,
        ),
      _ => Skeletonizer(
          child: _DesktopWidget(),
        ),
    };
  }
}

class _DesktopWidget extends ConsumerWidget {
  final String? view;
  final ProjectSort? sort;
  final Order? order;
  final String? search;
  final bool? bookmark;
  final List<int>? clients;
  final List<int>? categories;

  const _DesktopWidget({
    this.view,
    this.sort,
    this.order,
    this.search,
    this.bookmark,
    this.clients,
    this.categories,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedIconButton(
      onTap: view != null ||
              sort != null ||
              order != null ||
              search != null ||
              bookmark != null ||
              clients != null ||
              categories != null
          ? () {
              ref.read(projectFilterControllerProvider.notifier).reset();

              context.goNamed(RouteNames.project);
            }
          : null,
      icon: Symbols.filter_alt_off_rounded,
    );
  }
}
