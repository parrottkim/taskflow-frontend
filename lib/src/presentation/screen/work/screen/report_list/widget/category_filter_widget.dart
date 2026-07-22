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

class CategoryFilterWidget extends ConsumerWidget {
  const CategoryFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(scheduleOptionsControllerProvider);

    return switch (options) {
      AsyncData(value: final options) => _DesktopWidget(
        items: options.categoryItems,
      ),
      AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Skeletonizer(
        ignoreContainers: true,
        child: _DesktopWidget(items: []),
      ),
    };
  }
}

class _DesktopWidget extends HookConsumerWidget {
  final List<ScheduleCategory> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(workReportFilterControllerProvider);
    final selectedItems = useState<List<ScheduleCategory>>(
      items
          .where((item) => filter.categories?.contains(item.id) ?? false)
          .toList(),
    );

    useEffect(() {
      selectedItems.value = items
          .where((item) => filter.categories?.contains(item.id) ?? false)
          .toList();
      return null;
    }, [filter.categories, items]);

    return MultiSelectElevatedDropdownButton(
      onChanged: (value) {
        final nextCategories = value.isEmpty
            ? null
            : value.map((e) => e.id).toList();

        ref
            .read(workReportFilterControllerProvider.notifier)
            .setCategories(categories: nextCategories);

        context.goNamed(
          RouteNames.work,
          queryParameters: context.buildQueryParameters(
            updates: {'categories': nextCategories?.join(',')},
          ),
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
