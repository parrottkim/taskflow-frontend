import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskflow/src/presentation/screen/project/widget/bookmark_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/mobile_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/new_project_button.dart';
import 'package:taskflow/src/presentation/screen/project/widget/reset_filter_widget.dart';
import 'package:taskflow/src/presentation/screen/project/widget/search_widget.dart';

class MobileFilterBar extends ConsumerWidget {
  const MobileFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              MobileFilterWidget(),
              Spacer(),
              NewProjectButton(),
            ],
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
              Expanded(
                child: SearchWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
