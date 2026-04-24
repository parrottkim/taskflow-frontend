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
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(bookmark: value.bookmark),
      _ => Skeletonizer(child: _DesktopWidget()),
    };
  }
}

class _DesktopWidget extends ConsumerWidget {
  final bool? bookmark;

  const _DesktopWidget({this.bookmark});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedIconButton(
      onTap: () {
        final updatedBookmark = !(bookmark ?? false);
        ref
            .read(projectFilterControllerProvider.notifier)
            .setBookmark(bookmark: updatedBookmark);

        final queryParameters = ref
            .read(projectFilterControllerProvider.notifier)
            .toQueryParameters();

        context.goNamed(RouteNames.project, queryParameters: queryParameters);
      },
      icon: Symbols.bookmark_rounded,
      fill: bookmark ?? false ? 1.0 : 0.0,
    );
  }
}
