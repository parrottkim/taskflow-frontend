import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/screen/work/screen/issue_list/widget/mobile_category_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/issue_list/widget/mobile_client_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/work/screen/issue_list/widget/mobile_sort_filter_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

typedef WorkIssueFilterApplyCallback =
    void Function(
      WorkIssueSortOption? sort,
      SortDirection? order,
      List<int>? clients,
      List<int>? categories,
    );

class MobileFilterDialog extends HookWidget {
  final WorkIssueSortOption? sort;
  final SortDirection? order;
  final List<int>? clients;
  final List<int>? categories;
  final List<ClientGroup> clientItems;
  final List<IssueCategory> categoryItems;
  final int maxClientDepth;
  final WorkIssueFilterApplyCallback onApply;

  const MobileFilterDialog({
    super.key,
    this.sort,
    this.order,
    this.clients,
    this.categories,
    required this.clientItems,
    required this.categoryItems,
    required this.maxClientDepth,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();

    final selectedSort = useState<WorkIssueSortOption?>(sort);
    final selectedOrder = useState<SortDirection?>(order);
    final selectedClients = useState<List<int>>(clients ?? []);
    final selectedCategories = useState<List<int>>(categories ?? []);

    final currentDepth = useState(
      clients?.length.clamp(0, maxClientDepth - 1) ?? 0,
    );

    return Dialog(
      child: ContentContainer(
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
                selectedSort: selectedSort,
                selectedOrder: selectedOrder,
                selectedClients: selectedClients,
                selectedCategories: selectedCategories,
                clientItems: clientItems,
                categoryItems: categoryItems,
                currentDepth: currentDepth,
                maxClientDepth: maxClientDepth,
                onApply: onApply,
              ),
              ClientFilterPage(
                controller: controller,
                selectedClients: selectedClients,
                clientItems: clientItems,
                depth: currentDepth.value == 0
                    ? 0
                    : clientItems
                              .firstWhereOrNull(
                                (item) =>
                                    item.depth == currentDepth.value &&
                                    item.parentId ==
                                        selectedClients
                                            .value[currentDepth.value - 1],
                              )
                              ?.depth ??
                          0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainFilterPage extends StatelessWidget {
  final PageController controller;
  final ValueNotifier<WorkIssueSortOption?> selectedSort;
  final ValueNotifier<SortDirection?> selectedOrder;
  final ValueNotifier<List<int>> selectedClients;
  final ValueNotifier<List<int>> selectedCategories;
  final List<ClientGroup> clientItems;
  final List<IssueCategory> categoryItems;
  final ValueNotifier<int> currentDepth;
  final int maxClientDepth;
  final WorkIssueFilterApplyCallback onApply;

  const MainFilterPage({
    super.key,
    required this.controller,
    required this.selectedSort,
    required this.selectedOrder,
    required this.selectedClients,
    required this.selectedCategories,
    required this.clientItems,
    required this.categoryItems,
    required this.currentDepth,
    required this.maxClientDepth,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(Intl.message('common_cancel')),
                ),
              ),
              SizedBox(width: 4.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final nextClients = selectedClients.value.isEmpty
                        ? null
                        : selectedClients.value;
                    final nextCategories = selectedCategories.value.isEmpty
                        ? null
                        : selectedCategories.value;

                    Navigator.of(context).pop();
                    onApply(
                      selectedSort.value,
                      selectedOrder.value,
                      nextClients,
                      nextCategories,
                    );
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

    final group = clientItems.firstWhereOrNull(
      (item) => item.depth == depth && item.parentId == parentId,
    );

    final items = group?.items ?? [];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 24.0),
          child: Row(
            children: [
              AppIconButton(
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
                          color: Color(ClientBrand.fromKey(client.id).color),
                        ),
                        child: SizedBox(
                          width: 13.0,
                          height: 13.0,
                          child: SvgPicture.asset(
                            ClientBrand.fromKey(client.id).asset,
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
          separatorBuilder: (_, _) => const Divider(),
        ),
      ],
    );
  }
}
