import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/daily_allowance_summary.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/widget/holiday_options_widget.dart';
import 'package:taskflow/src/presentation/screen/project/screen/report_form/report_form_scope.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';

class DailyExpenseWidget extends ConsumerWidget {
  final Schedule schedule;
  final List<TripActualExpense> expenses;
  final List<ScheduleHoliday> holidays;

  const DailyExpenseWidget({
    super.key,
    required this.schedule,
    required this.expenses,
    required this.holidays,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formController = ReportFormScope.of(context).controller(ref);
    final isDomestic = schedule.category is ScheduleDomestic;
    final validation = ref.watch(reportValidationControllerProvider);
    final preview = ref.watch(
      dailyAllowancePreviewProvider(
        scheduleId: schedule.id,
        holidays: isDomestic ? holidays : null,
        expenses: isDomestic ? null : expenses,
      ),
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
                Intl.message('report_form_daily_expense'),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24.0),
              _DailyAllowancePreview(preview: preview, isDomestic: isDomestic),
              if (isDomestic && holidays.isNotEmpty) ...[
                const SizedBox(height: 16.0),
                HolidayOptionsWidget(
                  holidays: holidays,
                  scheduleStart: DateUtils.dateOnly(schedule.start),
                  scheduleEnd: DateUtils.dateOnly(schedule.end),
                  isDateInvalid:
                      validation.holidaysInvalid &&
                      hasInvalidReportHolidayDate(schedule),
                  isDuplicateInvalid:
                      validation.holidaysInvalid &&
                      hasDuplicateReportHolidayDate(schedule),
                  onTravelOnlyChanged: (index, value) =>
                      formController.updateHolidayTravelOnly(
                        index: index,
                        isTravelOnly: value,
                      ),
                  onCompensatoryLeaveDateChanged: (index, value) =>
                      formController.updateHolidayCompensatoryLeaveDate(
                        index: index,
                        compensatoryLeaveDate: value,
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DailyAllowancePreview extends StatelessWidget {
  final AsyncValue<DailyAllowancePreview> preview;
  final bool isDomestic;

  const _DailyAllowancePreview({
    required this.preview,
    required this.isDomestic,
  });

  @override
  Widget build(BuildContext context) => switch (preview) {
    AsyncData(:final value) => DailyAllowanceSummary(
      value: value,
      isDomestic: isDomestic,
    ),
    AsyncError(:final error, :final stackTrace) => ErrorStateView(
      error: error,
      stackTrace: stackTrace,
    ),
    _ => Skeletonizer(
      ignoreContainers: true,
      child: DailyAllowanceSummary(
        value: DailyAllowancePreview(
          totalTripDays: 3,
          domestic: isDomestic
              ? DomesticHolidayDays(workDays: 1, travelDays: 1)
              : null,
          overseas: isDomestic
              ? null
              : OverseasSpecialAllowance(days: 1, rate: 100, amount: 100),
          dailyRate: 100,
          dailyAmount: 300,
          deductionRate: 0.1,
          exchangeRate: 1000,
          totalAmount: 400,
          currencyCode: isDomestic ? 'KRW' : 'USD',
        ),
        isDomestic: isDomestic,
      ),
    ),
  };
}
