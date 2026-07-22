import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/router/router.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class ProjectStatsWidget extends ConsumerWidget {
  const ProjectStatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final dateSelection = ref.watch(dateSelectionControllerProvider);
    final state = ref.watch(
      projectStatsControllerProvider(
        start: dateSelection.start,
        end: dateSelection.end,
      ),
    );
    final dummy = List.filled(4, ProjectStats.dummy());

    return LayoutBuilder(
      builder: (context, constraints) => ContainerWidget(
        height: Responsive.isDesktop(context) ? constraints.maxHeight : 300.0,
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                Intl.message('dashboard_project_stats'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Expanded(
              child: switch (state) {
                AsyncData(:final value) => _DesktopWidget(items: value.items),
                AsyncError(:final error, :final stackTrace) =>
                  ErrorContainerWidget(error: error, stackTrace: stackTrace),
                _ => Skeletonizer(child: _DesktopWidget(items: dummy)),
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final List<ProjectStats> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FixedHeaderDataTable(
      columns: [
        DataTableColumnConfig(
          label: Intl.message('dashboard_project_stats_1'),
          width: const FractionColumnWidth(0.6),
        ),
        DataTableColumnConfig(
          label: Intl.message('dashboard_project_stats_2'),
          width: const FractionColumnWidth(0.2),
          headingRowAlignment: MainAxisAlignment.center,
        ),
        DataTableColumnConfig(
          label: Intl.message('dashboard_project_stats_3'),
          width: const FractionColumnWidth(0.2),
          headingRowAlignment: MainAxisAlignment.center,
        ),
      ],
      rows: [
        for (final item in items)
          DataRow(
            onSelectChanged: (_) {
              context.goNamed(
                RouteNames.project,
                queryParameters: {'search': item.user.username},
              );
            },
            cells: [
              DataCell(UserInformation(user: item.user)),
              DataCell(
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${item.valid}',
                    style: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ),
              DataCell(
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${item.total}',
                    style: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
      empty: const SizedBox.shrink(),
      headingRowHeight: 40.0,
      horizontalMargin: 20.0,
      columnSpacing: 0.0,
      showDivider: false,
    );
  }
}
