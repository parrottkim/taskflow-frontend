import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/functions.dart';

class MobileCategoryFilterWidget extends ConsumerWidget {
  final ValueNotifier<List<int>> selectedCategories;
  final List<IssueCategory> categoryItems;

  const MobileCategoryFilterWidget({
    super.key,
    required this.selectedCategories,
    required this.categoryItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    bool? getToggleState() {
      if (selectedCategories.value.isEmpty) {
        return false;
      } else if (selectedCategories.value.length == categoryItems.length) {
        return true;
      } else {
        return null; // 일부만 선택된 경우
      }
    }

    void toggleAllCategories(bool? value) {
      selectedCategories.value = value == true
          ? categoryItems.map((item) => item.id).toList()
          : [];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Intl.message('project_filter_4'),
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: SizedBox(
            width: double.infinity,
            child: AppToggleButton.tristate(
              padding: 12.0,
              value: getToggleState(),
              onChanged: toggleAllCategories,
              child: Text(
                selectedCategories.value.isEmpty
                    ? Intl.message('filter_select_all')
                    : Intl.message('filter_unselect_all'),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface.strong,
                ),
              ),
            ),
          ),
        ),
        Divider(),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: categoryItems.length,
          itemBuilder: (context, index) {
            final isSelected = selectedCategories.value.contains(
              categoryItems[index].id,
            );

            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (isSelected) {
                    // 이 항목을 선택 해제
                    selectedCategories.value = [
                      ...selectedCategories.value.where(
                        (e) => e != categoryItems[index].id,
                      ),
                    ];
                  }
                  if (!isSelected) {
                    // 새로운 항목을 추가
                    selectedCategories.value = [
                      ...selectedCategories.value,
                      categoryItems[index].id,
                    ];
                  }

                  selectedCategories.value.sort((a, b) => a.compareTo(b));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: IgnorePointer(
                    child: AppToggleButton(
                      padding: 12.0,
                      value: isSelected,
                      onChanged: (_) {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: Functions(
                                context,
                              ).generateColorFromId(categoryItems[index].id),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            categoryItems[index].name,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
