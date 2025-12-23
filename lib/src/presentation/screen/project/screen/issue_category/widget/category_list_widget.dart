import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class CategoryListWidget extends ConsumerWidget {
  final int projectId;

  const CategoryListWidget({
    super.key,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final filter = ref.watch(projectFilterControllerProvider);

    return switch (filter) {
      AsyncData(value: final filterValue) => ContainerWidget(
          padding: EdgeInsets.zero,
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: filterValue.categoryItems.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () async {
                ref
                    .read(issueFormControllerProvider(projectId: projectId)
                        .notifier)
                    .setCategory(category: filterValue.categoryItems[index]);
                context.goNamed(
                  RouteNames.issueNew,
                  pathParameters: {
                    'category_id':
                        filterValue.categoryItems[index].id.toString(),
                    'project_id': projectId.toString(),
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
      AsyncError(:final error, :final stackTrace) =>
        ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
          child: ContainerWidget(
            padding: EdgeInsets.zero,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Loading',
                          style: textTheme.titleMedium,
                        ),
                        Spacer(),
                        Icon(
                          Symbols.arrow_right_alt_rounded,
                          size: 20.0,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              separatorBuilder: (_, __) => Divider(),
            ),
          ),
        ),
    };
  }
}
