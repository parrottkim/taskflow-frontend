import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/dropdown.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class DesktopCategoryFilterWidget extends ConsumerWidget {
  const DesktopCategoryFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(:final value) => _DesktopWidget(
          categories: value.categories, items: value.categoryItems),
      _ => Skeletonizer(
          ignoreContainers: true,
          child: _DesktopWidget(
            items: [],
          ),
        ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final List<int>? categories;
  final List<IssueCategory> items;

  const _DesktopWidget({
    this.categories,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = useState<List<IssueCategory>>(categories
            ?.map((e) => items.firstWhere((element) => element.id == e))
            .toList() ??
        []);

    useEffect(() {
      selectedItems.value = categories
              ?.map((e) => items.firstWhere((element) => element.id == e))
              .toList() ??
          [];
      return null;
    }, [categories]);

    return MultiSelectElevatedDropdownButton(
      onChanged: (value) {
        ref.read(projectFilterControllerProvider.notifier).setCategories(
            categories: value.isEmpty ? null : value.map((e) => e.id).toList());

        final queryParameters = ref
            .read(projectFilterControllerProvider.notifier)
            .toQueryParameters();

        context.goNamed(RouteNames.project, queryParameters: queryParameters);
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
              color: Functions(context).generateColorFromId(item.charge.id),
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
