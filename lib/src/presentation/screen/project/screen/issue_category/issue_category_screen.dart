import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_category/widget/category_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_category/widget/closure_dialog.dart';
import 'package:taskflow/src/presentation/widget/overlay.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class IssueCategoryScreen extends ConsumerWidget {
  final int projectId;

  const IssueCategoryScreen({
    super.key,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(projectFilterControllerProvider);

    return BranchLayout(
      child: Container(
        padding: EdgeInsets.all(24.0),
        constraints: BoxConstraints(maxWidth: 430.0),
        child: switch (filter) {
          AsyncData(:final value) => _DesktopWidget(
              projectId: projectId,
              categoryItems: value.categoryItems,
            ),
          AsyncError(:final error, :final stackTrace) =>
            ErrorContainerWidget(error: error, stackTrace: stackTrace),
          _ => Skeletonizer(
              child: _DesktopWidget(
                projectId: projectId,
                categoryItems: List.filled(6, IssueCategory.dummy()),
              ),
            ),
        },
      ),
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  final int projectId;
  final List<IssueCategory> categoryItems;

  const _DesktopWidget({
    required this.projectId,
    required this.categoryItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    ref.listen(projectSubmitControllerProvider, (_, state) {
      if (state is ProjectSubmitPending) {
        LoadingOverlay.show(context);
      } else {
        LoadingOverlay.hide();

        if (state is ProjectSubmitSuccess) {
          context.pop();
          context.goNamed(
            RouteNames.projectDetail,
            pathParameters: {
              'project_id': projectId.toString(),
            },
          );
        }
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryListWidget(
          projectId: projectId,
          categoryItems: categoryItems,
        ),
        SizedBox(height: 16.0),
        ContainerWidget(
          padding: EdgeInsets.zero,
          color: colorScheme.errorContainer,
          child: InkWell(
            onTap: () async {
              final project = await ref.read(
                  projectDetailControllerProvider(projectId: projectId).future);

              showDialog(
                context: context,
                builder: (_) => ClosureDialog(
                  project: project.project,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Symbols.mountain_flag_rounded,
                        size: 20.0,
                        color: colorScheme.error,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        Intl.message('issue_new_choose_7'),
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.error,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Symbols.arrow_right_alt_rounded,
                        size: 20.0,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    Intl.message('issue_new_choose_7_1'),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.error.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
