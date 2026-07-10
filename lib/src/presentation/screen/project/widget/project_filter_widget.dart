import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/screen/project/widget/bookmark_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/desktop_category_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/desktop_client_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/desktop_sort_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/mobile_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/new_project_button.dart';
import 'package:taskflow/src/presentation/screen/project/widget/reset_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/search_widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ProjectFilterWidget extends ConsumerWidget {
  const ProjectFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Responsive(
      desktop: _DesktopFilterWidget(),
      mobile: _MobileFilterWidget(),
    );
  }
}

class _DesktopFilterWidget extends StatelessWidget {
  const _DesktopFilterWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: const [
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

class _MobileFilterWidget extends StatelessWidget {
  const _MobileFilterWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [MobileFilterWidget(), Spacer(), NewProjectButton()],
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              BookmarkFilterWidget(),
              SizedBox(width: 8.0),
              ResetFilterWidget(),
              SizedBox(width: 8.0),
              Expanded(child: SearchWidget()),
            ],
          ),
        ),
      ],
    );
  }
}
