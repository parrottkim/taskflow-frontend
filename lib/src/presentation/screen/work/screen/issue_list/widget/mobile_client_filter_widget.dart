import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class MobileClientFilterWidget extends ConsumerWidget {
  final PageController controller;
  final ValueNotifier<List<int>> selectedClients;
  final List<ClientGroup> clientItems;
  final ValueNotifier<int> currentDepth;
  final int maxClientDepth;

  const MobileClientFilterWidget({
    super.key,
    required this.controller,
    required this.selectedClients,
    required this.clientItems,
    required this.currentDepth,
    required this.maxClientDepth,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Intl.message('project_filter_1'),
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 8.0),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: maxClientDepth,
          itemBuilder: (context, depth) {
            if (depth > 0 && selectedClients.value.length < depth) {
              return const SizedBox.shrink();
            }

            final bool isSelected = selectedClients.value.length > depth;
            final parentId = depth == 0
                ? null
                : selectedClients.value[depth - 1];

            final group = clientItems.firstWhere(
              (g) => g.depth == depth && g.parentId == parentId,
              orElse: () =>
                  ClientGroup(depth: depth, parentId: parentId, items: []),
            );

            return Column(
              children: [
                ListTile(
                  onTap: () {
                    controller.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInQuad,
                    );
                    currentDepth.value = depth;
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  title: Row(
                    children: [
                      if (isSelected && depth == 0)
                        Container(
                          margin: EdgeInsets.only(right: 8.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Color(
                              ClientBrand.fromKey(
                                selectedClients.value[depth],
                              ).color,
                            ),
                          ),
                          child: SizedBox(
                            width: 13.0,
                            height: 13.0,
                            child: SvgPicture.asset(
                              ClientBrand.fromKey(
                                selectedClients.value[depth],
                              ).asset,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      Text(
                        !isSelected
                            ? Intl.message('project_filter_${depth + 1}')
                            : group.items
                                      .firstWhereOrNull(
                                        (c) =>
                                            c.id ==
                                            selectedClients.value[depth],
                                      )
                                      ?.name ??
                                  Intl.message('project_filter_${depth + 1}'),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Symbols.chevron_right_rounded,
                    size: 18.0,
                  ),
                ),
                if (isSelected) const Divider(),
              ],
            );
          },
        ),
      ],
    );
  }
}
