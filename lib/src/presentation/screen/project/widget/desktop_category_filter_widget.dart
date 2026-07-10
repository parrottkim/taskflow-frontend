import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class DesktopCategoryFilterWidget extends ConsumerWidget {
  const DesktopCategoryFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(
      projectFilterControllerProvider(ProjectFilterScope.projectPage),
    );
    final options = ref.watch(projectOptionsControllerProvider);

    return switch ((filter, options)) {
      (AsyncData(value: final filter), AsyncData(value: final options)) =>
        _DesktopWidget(
          filter: filter,
          categories: filter.categories,
          items: options.categoryItems,
        ),
      (AsyncError(:final error, :final stackTrace), _) ||
      (
        _,
        AsyncError(:final error, :final stackTrace),
      ) => ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
        ignoreContainers: true,
        child: _DesktopWidget(filter: ProjectFilterState(), items: []),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final ProjectFilterState filter;
  final List<int>? categories;
  final List<IssueCategory> items;

  const _DesktopWidget({
    required this.filter,
    this.categories,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = useState<List<IssueCategory>>(
      categories
              ?.map((e) => items.firstWhere((element) => element.id == e))
              .toList() ??
          [],
    );

    useEffect(() {
      selectedItems.value =
          categories
              ?.map((e) => items.firstWhere((element) => element.id == e))
              .toList() ??
          [];
      return null;
    }, [categories]);

    return MultiSelectElevatedDropdownButton(
      onChanged: (value) {
        final nextCategories = value.isEmpty
            ? null
            : value.map((e) => e.id).toList();

        ref
            .read(
              projectFilterControllerProvider(
                ProjectFilterScope.projectPage,
              ).notifier,
            )
            .setCategories(categories: nextCategories);

        context.goNamed(
          RouteNames.project,
          queryParameters: {
            if (filter.view != null) 'view': filter.view,
            if (filter.sort != null) 'sort': filter.sort?.key,
            if (filter.order != null) 'order': filter.order?.key,
            if (filter.search != null) 'search': filter.search,
            if (filter.bookmark != null) 'bookmark': filter.bookmark.toString(),
            if (filter.clients != null) 'clients': filter.clients?.join(','),
            if (nextCategories != null) 'categories': nextCategories.join(','),
          },
        );
      },
      items: items,
      selectedItems: selectedItems,
      icon: Icon(Symbols.widgets_rounded),
      label: Intl.message('project_filter_4'),
      itemBuilder: (item) => Row(
        children: [
          Container(
            width: 8.0,
            height: 8.0,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: Functions(context).generateColorFromId(item.id),
            ),
          ),
          SizedBox(width: 4.0),
          Text(
            item.name,
            style: TextStyle(
              fontWeight: selectedItems.value.contains(item)
                  ? FontWeight.w600
                  : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
