import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/core/core.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_category/widget/category_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/issue_category/widget/closure_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

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

class _DesktopWidget extends ConsumerWidget {
  final int projectId;
  final List<IssueCategory> categories;

  const _DesktopWidget({required this.projectId, required this.categories});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryListWidget(projectId: projectId, categories: categories),
          SizedBox(height: 16.0),
          ContentContainer(
            elevation: 1.0,
            padding: EdgeInsets.zero,
            color: colorScheme.errorContainer,
            borderColor: colorScheme.error.subtle,
            child: InkWell(
              onTap: () async {
                final project = await ref.read(
                  projectDetailControllerProvider(projectId: projectId).future,
                );

                if (!context.mounted) return;

                final closed = await showDialog<bool>(
                  context: context,
                  builder: (_) => ClosureDialog(project: project.project),
                );

                if (!context.mounted || closed != true) return;

                ref
                    .read(toastProvider)
                    .showToast(
                      child: Toast(
                        type: ToastType.verified,
                        message: Intl.message('issue_new_choose_7_created'),
                      ),
                    );

                context.goNamed(
                  RouteNames.projectDetail,
                  pathParameters: {'project_id': projectId.toString()},
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
                          color: colorScheme.error.strong,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      Intl.message('issue_new_choose_7_1'),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.error.strong,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
