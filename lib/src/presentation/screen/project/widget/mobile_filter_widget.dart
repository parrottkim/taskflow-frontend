import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/widget/mobile_filter_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class MobileFilterWidget extends ConsumerWidget {
  const MobileFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
        view: value.view,
        sort: value.sort,
        order: value.order,
        search: value.search,
        clients: value.clients,
        categories: value.categories,
        clientItems: value.clientItems,
        categoryItems: value.categoryItems,
        maxClientDepth: value.maxClientDepth,
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

class _DesktopWidget extends StatelessWidget {
  final String? view;
  final ProjectSort? sort;
  final Order? order;
  final String? search;
  final List<int>? clients;
  final List<int>? categories;
  final List<ClientGroup> clientItems;
  final List<IssueCategory> categoryItems;
  final int maxClientDepth;

  const _DesktopWidget({
    this.view,
    this.sort,
    this.order,
    this.search,
    this.clients,
    this.categories,
    required this.clientItems,
    required this.categoryItems,
    required this.maxClientDepth,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton.icon(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => MobileFilterDialog(
          sort: sort,
          order: order,
          clients: clients,
          categories: categories,
          clientItems: clientItems,
          categoryItems: categoryItems,
          maxClientDepth: maxClientDepth,
        ),
      ),
      icon: Icon(Symbols.filter_alt_rounded),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(Intl.message('project_filter_5')),
          if (sort != null ||
              order != null ||
              search != null ||
              clients != null ||
              categories != null)
            Container(
              margin: EdgeInsets.only(left: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
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
