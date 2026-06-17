import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/widget/mobile_category_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/mobile_client_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/mobile_sort_filter_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class MobileFilterDialog extends HookWidget {
  final ProjectSort? sort;
  final Order? order;
  final List<int>? clients;
  final List<int>? categories;
  final List<ClientGroup> clientItems;
  final List<IssueCategory> categoryItems;
  final int maxClientDepth;

  const MobileFilterDialog({
    super.key,
    this.sort,
    this.order,
    this.clients,
    this.categories,
    required this.clientItems,
    required this.categoryItems,
    required this.maxClientDepth,
  });

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();

    final selectedClients = useState<List<int>>(clients ?? []);
    final selectedCategories = useState<List<int>>(categories ?? []);
    final selectedSort = useState<ProjectSort?>(sort);
    final selectedOrder = useState<Order?>(order);

    final currentDepth = useState(
      clients?.length.clamp(0, maxClientDepth - 1) ?? 0,
    );

    return Dialog(
      child: ContainerWidget(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(maxWidth: 430.0, maxHeight: 600.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: PageView(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            children: [
              MainFilterPage(
                controller: controller,
                clientItems: clientItems,
                categoryItems: categoryItems,
                selectedClients: selectedClients,
                selectedCategories: selectedCategories,
                selectedSort: selectedSort,
                selectedOrder: selectedOrder,
                currentDepth: currentDepth,
                maxClientDepth: maxClientDepth,
              ),
              ClientFilterPage(
                controller: controller,
                selectedClients: selectedClients,
                clientItems: clientItems,
                depth: currentDepth.value == 0
                    ? 0
                    : clientItems
                          .firstWhere(
                            (item) =>
                                item.depth == currentDepth.value &&
                                item.parentId ==
                                    selectedClients.value[currentDepth.value -
                                        1],
                          )
                          .depth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainFilterPage extends ConsumerWidget {
  final PageController controller;
  final List<ClientGroup> clientItems;
  final List<IssueCategory> categoryItems;
  final ValueNotifier<List<int>> selectedClients;
  final ValueNotifier<List<int>> selectedCategories;
  final ValueNotifier<ProjectSort?> selectedSort;
  final ValueNotifier<Order?> selectedOrder;
  final ValueNotifier<int> currentDepth;
  final int maxClientDepth;

  const MainFilterPage({
    super.key,
    required this.controller,
    required this.clientItems,
    required this.categoryItems,
    required this.selectedClients,
    required this.selectedCategories,
    required this.selectedSort,
    required this.selectedOrder,
    required this.currentDepth,
    required this.maxClientDepth,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Intl.message('project_filter_5_1'),
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(height: 16.0),
        Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MobileClientFilterWidget(
                    controller: controller,
                    selectedClients: selectedClients,
                    clientItems: clientItems,
                    currentDepth: currentDepth,
                    maxClientDepth: maxClientDepth,
                  ),
                  SizedBox(height: 24.0),
                  MobileCategoryFilterWidget(
                    selectedCategories: selectedCategories,
                    categoryItems: categoryItems,
                  ),
                  SizedBox(height: 24.0),
                  MobileSortFilterWidget(
                    selectedSort: selectedSort,
                    selectedOrder: selectedOrder,
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(),
        SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.pop(),
                  child: Text(Intl.message('common_cancel')),
                ),
              ),
              SizedBox(width: 4.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(projectFilterControllerProvider.notifier)
                        .setSort(sort: selectedSort.value);
                    ref
                        .read(projectFilterControllerProvider.notifier)
                        .setOrder(order: selectedOrder.value);
                    if (selectedClients.value.isNotEmpty) {
                      ref
                          .read(projectFilterControllerProvider.notifier)
                          .setClients(clients: selectedClients.value);
                    }
                    ref
                        .read(projectFilterControllerProvider.notifier)
                        .setCategories(
                          categories: selectedCategories.value.isEmpty
                              ? null
                              : selectedCategories.value,
                        );

                    final queryParameters = ref
                        .read(projectFilterControllerProvider.notifier)
                        .toQueryParameters();

                    context.goNamed(
                      RouteNames.project,
                      queryParameters: queryParameters,
                    );

                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: colorScheme.onPrimary,
                    backgroundColor: colorScheme.primary,
                  ),
                  child: Text(Intl.message('common_apply')),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ClientFilterPage extends StatelessWidget {
  final PageController controller;
  final ValueNotifier<List<int>> selectedClients;
  final List<ClientGroup> clientItems;
  final int depth;

  const ClientFilterPage({
    super.key,
    required this.controller,
    required this.selectedClients,
    required this.clientItems,
    required this.depth,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final parentId = depth == 0 ? null : selectedClients.value[depth - 1];

    final group = clientItems.firstWhere(
      (item) => item.depth == depth && item.parentId == parentId,
    );

    final items = group.items;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 24.0),
          child: Row(
            children: [
              CustomIconButton(
                onTap: () => controller.animateToPage(
                  0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInQuad,
                ),
                icon: Icon(Symbols.chevron_left_rounded),
              ),
              SizedBox(width: 8.0),
              Text(
                Intl.message('project_filter_${depth + 1}_1'),
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.0),
        ListView.separated(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final client = items[index];

            return InkWell(
              onTap: () {
                final updated = [
                  ...selectedClients.value.take(depth),
                  client.id,
                ];
                selectedClients.value = updated;

                controller.animateToPage(
                  0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInQuad,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                child: Row(
                  children: [
                    if (depth == 0)
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Color(ClientType.fromKey(client.id).color),
                        ),
                        child: SizedBox(
                          width: 13.0,
                          height: 13.0,
                          child: SvgPicture.asset(
                            ClientType.fromKey(client.id).asset,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ), // only at depth 0
                    if (depth == 0) SizedBox(width: 8.0),
                    Text(
                      client.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        ),
      ],
    );
  }
}
