import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class BookmarkFilterWidget extends ConsumerWidget {
  const BookmarkFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      projectFilterControllerProvider(ProjectFilterScope.projectPage),
    );

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(filter: value),
      _ => Skeletonizer(child: _DesktopWidget(filter: ProjectFilterState())),
    };
  }
}

class _DesktopWidget extends ConsumerWidget {
  final ProjectFilterState filter;

  const _DesktopWidget({required this.filter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedIconButton(
      onTap: () {
        final updatedBookmark = !(filter.bookmark ?? false);
        ref
            .read(
              projectFilterControllerProvider(
                ProjectFilterScope.projectPage,
              ).notifier,
            )
            .setBookmark(bookmark: updatedBookmark);

        context.goNamed(
          RouteNames.project,
          queryParameters: {
            if (filter.view != null) 'view': filter.view,
            if (filter.sort != null) 'sort': filter.sort?.key,
            if (filter.order != null) 'order': filter.order?.key,
            if (filter.search != null) 'search': filter.search,
            'bookmark': updatedBookmark.toString(),
            if (filter.clients != null) 'clients': filter.clients?.join(','),
            if (filter.categories != null)
              'categories': filter.categories?.join(','),
          },
        );
      },
      icon: Symbols.bookmark_rounded,
      fill: filter.bookmark ?? false ? 1.0 : 0.0,
    );
  }
}
