import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/trip_form/widget/expense_list_widget.dart';
import 'package:taskflow/src/presentation/screen/trip_form/widget/fuel_expense_widget.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class OtherWidget extends ConsumerWidget {
  final int projectId;
  final int? tripId;
  final Schedule? selectedSchedule;
  final List<TripActualExpense> expenses;
  final TripFuelExpense? fuel;
  final ValueNotifier<Map<int, bool>> isOtherInvalid;
  final ValueNotifier<bool> isFuelInvalid;

  const OtherWidget({
    super.key,
    required this.projectId,
    this.tripId,
    this.selectedSchedule,
    required this.expenses,
    this.fuel,
    required this.isOtherInvalid,
    required this.isFuelInvalid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final filter = ref.watch(tripFilterControllerProvider(
        categoryId: selectedSchedule?.category.id));

    if (selectedSchedule == null) return Container();

    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          constraints: BoxConstraints(maxWidth: 430.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Intl.message('trip_form_5'),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 24.0),
              switch (filter) {
                AsyncData(:final value) => ExpenseListWidget(
                    projectId: projectId,
                    tripId: tripId,
                    selectedSchedule: selectedSchedule!,
                    steps: value.steps.where((e) => e.categoryId == 5).toList(),
                    expenses: expenses,
                    stepInvalid: isOtherInvalid,
                  ),
                AsyncError(:final error, :final stackTrace) =>
                  ErrorContainerWidget(error: error, stackTrace: stackTrace),
                _ => Skeletonizer(
                    ignoreContainers: true,
                    child: ExpenseListWidget(
                      projectId: projectId,
                      tripId: tripId,
                      selectedSchedule: selectedSchedule!,
                      steps: List.filled(3, TripStep.dummy()),
                      expenses: [],
                      stepInvalid: isOtherInvalid,
                    ),
                  ),
              },
              if (selectedSchedule!.category is ScheduleDomestic)
                FuelExpenseWidget(
                  projectId: projectId,
                  tripId: tripId,
                  fuel: fuel,
                  isFuelInvalid: isFuelInvalid,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
