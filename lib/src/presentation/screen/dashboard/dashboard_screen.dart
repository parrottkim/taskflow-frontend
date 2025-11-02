import 'package:flutter/material.dart' hide DateRangePickerDialog;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/layout/branch_layout.dart';
import 'package:taskflow/src/presentation/screen/dashboard/widget/functions_widget.dart';
import 'package:taskflow/src/presentation/screen/dashboard/widget/schedule_widget.dart';
import 'package:taskflow/src/presentation/screen/dashboard/widget/latest_update_widget.dart';
import 'package:taskflow/src/presentation/screen/dashboard/widget/summary_widget.dart';
import 'package:taskflow/src/presentation/screen/dashboard/widget/project_stats_widget.dart';
import 'package:taskflow/src/presentation/screen/dashboard/widget/world_map_widget.dart';
import 'package:taskflow/src/presentation/widget/bento_grid.dart';
import 'package:taskflow/src/presentation/widget/dialog.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BranchLayout(
      child: Responsive(
        desktop: _DesktopWidget(),
        mobile: _MobileWidget(),
      ),
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  const _DesktopWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          SummaryWidget(),
          SizedBox(height: 16.0),
          Expanded(
            child: BentoGrid(
              rows: 2,
              columns: 4,
              tiles: [
                BentoTile(
                  row: 1,
                  column: 1,
                  columnSpan: 2,
                  child: WorldMapWidget(),
                ),
                BentoTile(
                  row: 1,
                  column: 3,
                  child: ScheduleWidget(),
                ),
                BentoTile(
                  row: 1,
                  column: 4,
                  child: ProjectStatsWidget(),
                ),
                BentoTile(
                  row: 2,
                  column: 1,
                  columnSpan: 3,
                  child: LatestUpdateWidget(),
                ),
                BentoTile(
                  row: 2,
                  column: 4,
                  child: FunctionsWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileWidget extends ConsumerWidget {
  const _MobileWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateSelection = ref.watch(dateSelectionControllerProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (_) => DateRangePickerDialog(
                        startDate: dateSelection.start,
                        endDate: dateSelection.end,
                      ),
                    );

                    if (result != null) {
                      final startDate = result['start'] as DateTime;
                      final endDate = result['end'] as DateTime;

                      ref
                          .read(dateSelectionControllerProvider.notifier)
                          .dataSelectionChange(start: startDate, end: endDate);
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 4.0),
                      Text(
                          '${DateFormat.yMMMd(Intl.getCurrentLocale()).format(dateSelection.start)} - ${DateFormat.yMMMd(Intl.getCurrentLocale()).format(dateSelection.end)}'),
                      SizedBox(width: 4.0),
                      Icon(Symbols.expand_more_rounded),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            FunctionsWidget(),
            SizedBox(height: 16.0),
            SummaryWidget(),
            SizedBox(height: 8.0),
            ScheduleWidget(),
            SizedBox(height: 8.0),
            ProjectStatsWidget(),
            SizedBox(height: 8.0),
            LatestUpdateWidget(),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
