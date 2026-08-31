import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/expense_list_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/fuel_expense_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

/// Shared layout and async-state handling for every trip expense step.
class TripExpenseStepWidget extends ConsumerWidget {
  final ReportFormStep step;
  final ReportFormState form;

  const TripExpenseStepWidget({
    super.key,
    required this.step,
    required this.form,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = form.schedule!;
    final options = ref.watch(
      tripOptionsProvider(categoryId: schedule.category.id),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Intl.message('report_form_${step.key}'),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24.0),
              switch (options) {
                AsyncData(:final value) => _ExpenseSections(
                  step: step,
                  form: form,
                  options: value,
                ),
                AsyncError(:final error, :final stackTrace) => ErrorStateView(
                  error: error,
                  stackTrace: stackTrace,
                ),
                _ => Skeletonizer(
                  ignoreContainers: true,
                  child: _ExpenseSections(
                    step: step,
                    form: form,
                    options: TripOptionsState(
                      steps: List.filled(3, TripStep.dummy()),
                      currencies: [Currency.empty()],
                    ),
                  ),
                ),
              },
              if (step == ReportFormStep.other &&
                  schedule.category is ScheduleDomestic)
                FuelExpenseWidget(fuel: form.fuel),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExpenseSections extends StatelessWidget {
  final ReportFormStep step;
  final ReportFormState form;
  final TripOptionsState options;

  const _ExpenseSections({
    required this.step,
    required this.form,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return ExpenseListWidget(
      schedule: form.schedule!,
      steps: options.steps
          .where((option) => option.categoryId == step.categoryId)
          .toList(),
      currencies: options.currencies,
      regulations: step == ReportFormStep.accommodation
          ? options.regulations
          : null,
      expenses: form.expenses,
      rates: step == ReportFormStep.accommodation ? form.rates : null,
    );
  }
}
