import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/screen/project/widget/bookmark_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/desktop_category_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/desktop_client_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/reset_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/search_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/desktop_sort_widget.dart';

class DesktopFilterBar extends ConsumerWidget {
  const DesktopFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          DesktopClientFilterWidget(),
          SizedBox(width: 8.0),
          DesktopCategoryFilterWidget(),
          SizedBox(width: 8.0),
          DesktopSortWidget(),
          Spacer(),
          BookmarkFilterWidget(),
          SizedBox(width: 8.0),
          ResetFilterWidget(),
          SizedBox(width: 8.0),
          SearchWidget(),
        ],
      ),
    );
  }
}
