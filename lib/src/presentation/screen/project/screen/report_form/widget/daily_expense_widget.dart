import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/expense_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/trip_duty_dialog.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DailyExpenseWidget extends ConsumerWidget {
  final Schedule schedule;
  final List<TripRegulationRate> rates;
  final bool? isDeducted;

  const DailyExpenseWidget({
    super.key,
    required this.schedule,
    required this.rates,
    this.isDeducted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final projectId = int.parse(state.pathParameters['project_id']!);
    final reportId = int.tryParse(state.pathParameters['report_id'] ?? '');
    final scheduleId = int.tryParse(
      state.uri.queryParameters['schedule_id'] ?? '',
    );

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final filter = ref.watch(
      tripFilterControllerProvider(categoryId: schedule.category.id),
    );

    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.all(24.0),
          constraints: BoxConstraints(maxWidth: 400.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    Intl.message('report_form_daily_expense'),
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (schedule.category is ScheduleDomestic)
                    Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => TripDutyDialog(
                              categoryId: schedule.category.id,
                            ),
                          );
                        },
                        child: Icon(
                          Symbols.info_rounded,
                          size: 18.0,
                          color: colorScheme.outline.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 24.0),
              if (schedule.category is ScheduleOverseas)
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: CustomToggleButton(
                    value: isDeducted,
                    onChanged: (value) => ref
                        .read(
                          reportFormControllerProvider(
                            projectId: projectId,
                            reportId: reportId,
                            scheduleId: scheduleId,
                          ).notifier,
                        )
                        .setDeducted(flag: value ?? false),
                    child: Text(Intl.message('report_form_column_5')),
                  ),
                ),
              switch (filter) {
                AsyncData(:final value) => ExpenseListWidget(
                  schedule: schedule,
                  steps: value.steps.where((e) => e.categoryId == 4).toList(),
                  regulations: value.regulations,
                  rates: rates,
                ),
                AsyncError(:final error, :final stackTrace) =>
                  ErrorContainerWidget(error: error, stackTrace: stackTrace),
                _ => Skeletonizer(
                  ignoreContainers: true,
                  child: ExpenseListWidget(
                    schedule: schedule,
                    steps: List.filled(3, TripStep.dummy()),
                    regulations: [],
                    rates: [],
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
