import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_category/widget/category_list_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class IssueCategoryScreen extends ConsumerWidget {
  final int projectId;

  const IssueCategoryScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(issueOptionsProvider);

    return BranchLayout(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 430.0),
        child: switch (filter) {
          AsyncData(:final value) => _DesktopWidget(
            projectId: projectId,
            categories: value.categories,
          ),
          AsyncError(:final error, :final stackTrace) => ErrorStateView(
            error: error,
            stackTrace: stackTrace,
          ),
          _ => Skeletonizer(
            child: _DesktopWidget(
              projectId: projectId,
              categories: List.filled(6, IssueCategory.dummy()),
            ),
          ),
        },
      ),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final int projectId;
  final List<IssueCategory> categories;

  const _DesktopWidget({required this.projectId, required this.categories});

  @override
  Widget build(BuildContext context) {
    return CategoryListWidget(projectId: projectId, categories: categories);
  }
}
