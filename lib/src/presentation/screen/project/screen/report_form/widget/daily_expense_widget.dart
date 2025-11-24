import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/expense_list_widget.dart';
import 'package:taskflow/src/presentation/widget/button.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DailyExpenseWidget extends ConsumerWidget {
  final int projectId;
  final int? reportId;
  final Schedule schedule;
  final List<TripRegulationRate> rates;
  final bool? isDeducted;

  const DailyExpenseWidget({
    super.key,
    required this.projectId,
    this.reportId,
    required this.schedule,
    required this.rates,
    this.isDeducted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final filter = ref
        .watch(tripFilterControllerProvider(categoryId: schedule.category.id));

    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.all(24.0),
          constraints: BoxConstraints(maxWidth: 430.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Intl.message('report_form_daily_expense'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 24.0),
              if (schedule.category is ScheduleOverseas)
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: CustomToggleButton(
                    value: isDeducted,
                    onChanged: (value) => ref
                        .read(reportFormControllerProvider(
                                projectId: projectId, reportId: reportId)
                            .notifier)
                        .setDeducted(flag: value ?? false),
                    child: Text(
                      Intl.message('report_form_column_5'),
                    ),
                  ),
                ),
              switch (filter) {
                AsyncData(:final value) => ExpenseListWidget(
                    projectId: projectId,
                    reportId: reportId,
                    schedule: schedule,
                    steps: value.steps.where((e) => e.categoryId == 4).toList(),
                    regulations: value.regulations,
                    rates: rates,
                    // stepInvalid: isDailyExpenseInvalid,
                  ),
                AsyncError(:final error, :final stackTrace) =>
                  ErrorContainerWidget(error: error, stackTrace: stackTrace),
                _ => Skeletonizer(
                    ignoreContainers: true,
                    child: ExpenseListWidget(
                      projectId: projectId,
                      reportId: reportId,
                      schedule: schedule,
                      steps: List.filled(3, TripStep.dummy()),
                      regulations: [],
                      rates: [],
                      // stepInvalid: isDailyExpenseInvalid,
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
