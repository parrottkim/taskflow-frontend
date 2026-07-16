import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class DocumentFilterWidget extends ConsumerWidget {
  const DocumentFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(documentFilterControllerProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
      child: CupertinoSlidingSegmentedControl<DocumentSort>(
        groupValue: filter.sort,
        onValueChanged: (_) {},
        children: {
          for (final sort in DocumentSort.values)
            sort: _DocumentSortSegment(sort: sort, filter: filter),
        },
      ),
    );
  }
}

class _DocumentSortSegment extends ConsumerWidget {
  final DocumentSort sort;
  final DocumentFilterState filter;

  const _DocumentSortSegment({required this.sort, required this.filter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isSelected = filter.sort == sort;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final nextOrder = isSelected
            ? (filter.order == Order.asc ? Order.desc : Order.asc)
            : Order.desc;

        ref.read(documentFilterControllerProvider.notifier)
          ..setSort(sort: sort)
          ..setOrder(order: nextOrder);

        context.goNamed(
          RouteNames.document,
          queryParameters: context.buildQueryParameters(
            updates: {'sort': sort.key, 'order': nextOrder.key},
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              sort.icon,
              size: 16.0,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            SizedBox(width: 6.0),
            Text(sort.label, style: textTheme.bodyMedium),
            SizedBox(width: 6.0),
            if (isSelected)
              RotatedBox(
                quarterTurns: filter.order == Order.asc ? 0 : 2,
                child: Icon(Symbols.arrow_drop_up_rounded, size: 16.0),
              ),
          ],
        ),
      ),
    );
  }
}
