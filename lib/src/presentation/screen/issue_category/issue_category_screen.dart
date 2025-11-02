import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/issue_category/widget/closure_dialog.dart';
import 'package:taskflow/src/presentation/widget/overlay.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class IssueCategoryScreen extends ConsumerWidget {
  final int? projectId;

  const IssueCategoryScreen({
    super.key,
    this.projectId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail =
        ref.watch(projectDetailControllerProvider(projectId: projectId!));
    final filter = ref.watch(projectFilterControllerProvider);
    final dummy = List.filled(7, IssueCategory.dummy());

    return BranchLayout(
      child: Container(
        padding: EdgeInsets.all(24.0),
        constraints: BoxConstraints(maxWidth: 430.0),
        child: switch ((detail, filter)) {
          (AsyncData(value: final detail), AsyncData(value: final filter)) =>
            _DesktopWidget(
                projectId: projectId,
                project: detail.item,
                items: filter.categoryItems),
          ((AsyncError(:final error, :final stackTrace), _) ||
                (_, AsyncError(:final error, :final stackTrace))) =>
            ErrorContainerWidget(error: error, stackTrace: stackTrace),
          _ => Skeletonizer(
              child: _DesktopWidget(
                  projectId: projectId, project: Project.dummy(), items: dummy),
            ),
        },
      ),
    );
  }
}

class _DesktopWidget extends ConsumerWidget {
  final int? projectId;
  final Project project;
  final List<IssueCategory> items;

  const _DesktopWidget({
    required this.projectId,
    required this.project,
    required this.items,
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
        ContainerWidget(
          padding: EdgeInsets.zero,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                context.goNamed(
                  RouteNames.issueNew,
                  pathParameters: {
                    'project_id': projectId.toString(),
                  },
                  queryParameters: {
                    'category': items[index].id.toString(),
                  },
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
                        Text.rich(
                          style: textTheme.titleMedium,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: Intl.message(
                                    'issue_new_choose_${index + 1}'),
                              ),
                              TextSpan(
                                text: Intl.message(
                                    'issue_new_choose_${index + 1}_1'),
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
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
                      Intl.message('issue_new_choose_${index + 1}_2'),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (_, __) => Divider(),
          ),
        ),
        SizedBox(height: 16.0),
        ElevatedButton.icon(
          onPressed: () => showDialog(
            context: context,
            builder: (_) => ClosureDialog(
              project: project,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.errorContainer,
            foregroundColor: colorScheme.error,
            iconColor: colorScheme.error,
          ),
          icon: Icon(
            Symbols.mountain_flag_rounded,
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(Intl.message('issue_new_choose_8')),
              SizedBox(width: 8.0),
              Icon(
                Symbols.chevron_right_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
