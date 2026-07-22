import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/work/screen/issue_list/widget/mobile_filter_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class MobileFilterWidget extends ConsumerWidget {
  const MobileFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(projectOptionsControllerProvider);

    return switch (options) {
      AsyncData(value: final options) => _MobileWidget(
        clientItems: options.clientItems,
        categoryItems: options.categoryItems,
        maxClientDepth: options.maxClientDepth,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer.zone(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Bone.icon(),
          label: Skeleton.leaf(child: Text(Intl.message('project_filter_5'))),
        ),
      ),
    };
  }
}

class _MobileWidget extends ConsumerWidget {
  final List<ClientGroup> clientItems;
  final List<IssueCategory> categoryItems;
  final int maxClientDepth;

  const _MobileWidget({
    required this.clientItems,
    required this.categoryItems,
    required this.maxClientDepth,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(workIssueFilterControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton.icon(
      onPressed: () => showDialog<void>(
        context: context,
        builder: (_) => MobileFilterDialog(
          sort: filter.sort,
          order: filter.order,
          clients: filter.clients,
          categories: filter.categories,
          clientItems: clientItems,
          categoryItems: categoryItems,
          maxClientDepth: maxClientDepth,
          onApply: (sort, order, clients, categories) {
            ref.read(workIssueFilterControllerProvider.notifier)
              ..setSort(sort: sort)
              ..setOrder(order: order)
              ..setClients(clients: clients)
              ..setCategories(categories: categories);

            context.goNamed(
              RouteNames.work,
              queryParameters: context.buildQueryParameters(
                updates: {
                  'sort': sort?.key,
                  'order': order?.key,
                  'clients': clients?.join(','),
                  'categories': categories?.join(','),
                },
              ),
            );
          },
        ),
      ),
      icon: const Icon(Symbols.filter_alt_rounded),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(Intl.message('project_filter_5')),
          if (filter.sort != null ||
              filter.order != null ||
              filter.clients != null ||
              filter.categories != null)
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: colorScheme.onSurface,
              ),
              child: Text(
                Intl.message('filter_applied'),
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.surface,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
