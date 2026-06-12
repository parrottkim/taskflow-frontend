import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class ScheduleCategoryScreen extends ConsumerWidget {
  final String? path;
  final int? projectId;

  const ScheduleCategoryScreen({super.key, this.path, this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(scheduleFilterControllerProvider);

    return BranchLayout(
      child: Container(
        constraints: BoxConstraints(maxWidth: 430.0),
        child: switch (filter) {
          AsyncData(:final value) => _DesktopWidget(
            path: path,
            projectId: projectId,
            items: value.categoryItems,
          ),
          AsyncError(:final error, :final stackTrace) => ErrorContainerWidget(
            error: error,
            stackTrace: stackTrace,
          ),
          _ => Skeletonizer(
            child: _DesktopWidget(
              items: List.filled(5, ScheduleCategory.dummy()),
            ),
          ),
        },
      ),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final String? path;
  final int? projectId;
  final List<ScheduleCategory> items;

  const _DesktopWidget({this.path, this.projectId, required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: EdgeInsets.all(24.0),
      child: ContainerWidget(
        padding: EdgeInsets.zero,
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              context.pushNamed(
                RouteNames.scheduleNew,
                queryParameters: {
                  if (path != null) 'redirect_to': path,
                  if (projectId != null) 'project_id': projectId.toString(),
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
                                'schedule_new_choose_${index + 1}',
                              ),
                            ),
                            TextSpan(
                              text: Intl.message(
                                'schedule_new_choose_${index + 1}_1',
                              ),
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
                    Intl.message('schedule_new_choose_${index + 1}_2'),
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
    );
  }
}
