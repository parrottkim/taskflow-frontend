import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/expense_list_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class AccommodationWidget extends ConsumerWidget {
  final int projectId;
  final int? reportId;
  final int? scheduleId;
  final Schedule schedule;
  final List<TripActualExpense> expenses;
  final List<TripRegulationRate> rates;

  const AccommodationWidget({
    super.key,
    required this.projectId,
    this.reportId,
    this.scheduleId,
    required this.schedule,
    required this.expenses,
    required this.rates,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              Text(
                Intl.message('report_form_accommodation'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 24.0),
              switch (filter) {
                AsyncData(:final value) => ExpenseListWidget(
                  projectId: projectId,
                  reportId: reportId,
                  scheduleId: scheduleId,
                  schedule: schedule,
                  steps: value.steps.where((e) => e.categoryId == 3).toList(),
                  regulations: value.regulations,
                  expenses: expenses,
                  rates: rates,
                ),
                AsyncError(:final error, :final stackTrace) =>
                  ErrorContainerWidget(error: error, stackTrace: stackTrace),
                _ => Skeletonizer(
                  ignoreContainers: true,
                  child: ExpenseListWidget(
                    projectId: projectId,
                    reportId: reportId,
                    scheduleId: scheduleId,
                    schedule: schedule,
                    steps: List.filled(3, TripStep.dummy()),
                    regulations: [],
                    expenses: [],
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
