import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/dashboard/widget/summary_card_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/shared/tool/responsive.dart';

class SummaryWidget extends ConsumerWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateSelection = ref.watch(dateSelectionControllerProvider);
    final state = ref.watch(summaryControllerProvider(
        start: dateSelection.start, end: dateSelection.end));
    final dummy = ProjectSummary.dummy();

    return switch (state) {
      AsyncData(:final value) => Responsive(
          desktop: _DesktopWidget(item: value.summary),
          mobile: _MobileWidget(item: value.summary),
        ),
      AsyncError(:final error, :final stackTrace) =>
        ErrorContainerWidget(error: error, stackTrace: stackTrace),
      _ => Skeletonizer(
          child: Responsive(
            desktop: _DesktopWidget(item: dummy),
            mobile: _MobileWidget(item: dummy),
          ),
        )
    };
  }
}

class _DesktopWidget extends StatelessWidget {
  final ProjectSummary item;

  const _DesktopWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return BentoGrid(
      rows: 1,
      columns: 4,
      tiles: [
        BentoTile(
          row: 1,
          column: 1,
          child: SummaryCardWidget(
            type: SummaryCardType.primary,
            icon: Symbols.work_rounded,
            title: Intl.message('dashboard_summary_1'),
            value: item.total,
          ),
        ),
        BentoTile(
          row: 1,
          column: 2,
          child: SummaryCardWidget(
            type: SummaryCardType.secondary,
            icon: Symbols.mountain_flag_rounded,
            title: Intl.message('dashboard_summary_2'),
            value: item.closed,
          ),
        ),
        BentoTile(
          row: 1,
          column: 3,
          child: SummaryCardWidget(
            type: SummaryCardType.surface,
            icon: Symbols.rocket_launch_rounded,
            title: Intl.message('dashboard_summary_3'),
            value: item.kickedOff,
          ),
        ),
        BentoTile(
          row: 1,
          column: 4,
          child: SummaryCardWidget(
            type: SummaryCardType.surface,
            icon: Symbols.carry_on_bag_rounded,
            title: Intl.message('dashboard_summary_4'),
            value: item.active,
          ),
        ),
      ],
    );
  }
}

class _MobileWidget extends StatelessWidget {
  final ProjectSummary item;

  const _MobileWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return BentoGrid(
      rows: 2,
      columns: 2,
      spacing: 8.0,
      tiles: [
        BentoTile(
          row: 1,
          column: 1,
          child: SummaryCardWidget(
            type: SummaryCardType.primary,
            icon: Symbols.work_rounded,
            title: Intl.message('dashboard_summary_1'),
            value: item.total,
          ),
        ),
        BentoTile(
          row: 1,
          column: 2,
          child: SummaryCardWidget(
            type: SummaryCardType.secondary,
            icon: Symbols.mountain_flag_rounded,
            title: Intl.message('dashboard_summary_2'),
            value: item.closed,
          ),
        ),
        BentoTile(
          row: 2,
          column: 1,
          child: SummaryCardWidget(
            type: SummaryCardType.surface,
            icon: Symbols.rocket_launch_rounded,
            title: Intl.message('dashboard_summary_3'),
            value: item.kickedOff,
          ),
        ),
        BentoTile(
          row: 2,
          column: 2,
          child: SummaryCardWidget(
            type: SummaryCardType.surface,
            icon: Symbols.carry_on_bag_rounded,
            title: Intl.message('dashboard_summary_4'),
            value: item.active,
          ),
        ),
      ],
    );
  }
}
