import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
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
          queryParameters: context.buildQueryParameters(
            updates: {'bookmark': updatedBookmark.toString()},
          ),
        );
      },
      icon: Symbols.bookmark_rounded,
      fill: filter.bookmark ?? false ? 1.0 : 0.0,
    );
  }
}
