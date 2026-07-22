import 'package:flutter/material.dart';
import 'package:taskflow/src/presentation/screen/project/widget/bookmark_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/category_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/client_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/mobile_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/sort_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/reset_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/search_widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ProjectFilterWidget extends StatelessWidget {
  const ProjectFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Responsive(desktop: _DesktopWidget(), mobile: _MobileWidget()),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  const _DesktopWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ClientFilterWidget(),
        SizedBox(width: 8.0),
        CategoryFilterWidget(),
        SizedBox(width: 8.0),
        SortWidget(),
        Spacer(),
        BookmarkFilterWidget(),
        SizedBox(width: 8.0),
        ResetFilterWidget(),
        SizedBox(width: 8.0),
        SearchWidget(),
      ],
    );
  }
}

class _MobileWidget extends StatelessWidget {
  const _MobileWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MobileFilterWidget(),
            Spacer(),
            BookmarkFilterWidget(),
            SizedBox(width: 8.0),
            ResetFilterWidget(),
          ],
        ),
        SizedBox(height: 8.0),
        Row(children: [Expanded(child: SearchWidget())]),
      ],
    );
  }
}
