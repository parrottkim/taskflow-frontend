part of '../controller.dart';

@riverpod
class ReportValidationController extends _$ReportValidationController {
  @override
  ReportValidationState build() => ReportValidationState();

  void setContentValid(bool isInvalid) {
    state = state.copyWith(contentInvalid: isInvalid);
  }

  bool validate({
    required ReportFormState value,
    required List<TripStep> steps,
    required bool validateHolidays,
    required bool validateContent,
    required bool contentIsEmpty,
  }) {
    state = evaluateReportValidation(
      value: value,
      steps: steps,
      validateHolidays: validateHolidays,
      validateContent: validateContent,
      contentIsEmpty: contentIsEmpty,
    );

    return isValid();
  }

  bool isValid() {
    return !state.optionsInvalid &&
        !state.fuelInvalid &&
        !state.holidaysInvalid &&
        !state.contentInvalid &&
        state.stepValidations.values.every((isInvalid) => !isInvalid) &&
        state.regulationRateValidations.values.every((isInvalid) => !isInvalid);
  }
}

ReportValidationState evaluateReportValidation({
  required ReportFormState value,
  required List<TripStep> steps,
  required bool validateHolidays,
  required bool validateContent,
  required bool contentIsEmpty,
}) {
  final schedule = value.schedule;
  final hasTripSchedule =
      schedule?.category is ScheduleDomestic ||
      schedule?.category is ScheduleOverseas;
  final stepValidations = <int, bool>{};
  final regulationRateValidations = <int, bool>{};

  for (final step in steps) {
    final requiresCurrency = step.requiresExpenseCurrency;
    final expenses = value.expenses.where(
      (expense) => expense.stepId == step.id,
    );
    final rates = value.rates.where((rate) => rate.stepId == step.id);

    stepValidations[step.id] = expenses.any(
      (expense) =>
          !_hasText(expense.price) ||
          (requiresCurrency &&
              ((expense.currencyId ?? 0) <= 0 || expense.paymentDate == null)),
    );
    regulationRateValidations[step.id] = rates.any(
      (rate) => !_hasText(rate.days) || !_hasText(rate.rate),
    );
  }

  final fuel = value.fuel;
  final fuelInvalid =
      steps.any((step) => step.categoryId == 5) &&
      schedule?.category is ScheduleDomestic &&
      fuel != null &&
      (!_hasText(fuel.rate) ||
          !_hasText(fuel.mileage) ||
          !_hasText(fuel.distance));
  final holidaysInvalid =
      validateHolidays &&
      schedule?.category is ScheduleDomestic &&
      (hasInvalidReportHolidayDate(schedule!) ||
          hasDuplicateReportHolidayDate(schedule));

  return ReportValidationState(
    stepValidations: stepValidations,
    regulationRateValidations: regulationRateValidations,
    fuelInvalid: fuelInvalid,
    holidaysInvalid: holidaysInvalid,
    contentInvalid: validateContent && contentIsEmpty,
    optionsInvalid: hasTripSchedule && steps.isEmpty,
  );
}

bool _hasText(String? value) => value?.trim().isNotEmpty ?? false;

bool hasInvalidReportHolidayDate(Schedule schedule) => schedule.holidays.any(
  (holiday) => _isInvalidReportCompensatoryLeaveDate(
    holiday.compensatoryLeaveDate,
    schedule.start,
    schedule.end,
  ),
);

bool hasDuplicateReportHolidayDate(Schedule schedule) {
  final dates = schedule.holidays
      .map((holiday) => holiday.compensatoryLeaveDate)
      .whereType<DateTime>()
      .map((date) => DateTime(date.year, date.month, date.day))
      .toList();
  return dates.toSet().length != dates.length;
}

bool _isInvalidReportCompensatoryLeaveDate(
  DateTime? date,
  DateTime start,
  DateTime end,
) {
  if (date == null) return true;

  final now = DateTime.now();
  final normalizedDate = DateTime(date.year, date.month, date.day);
  final normalizedStart = DateTime(start.year, start.month, start.day);
  final normalizedEnd = DateTime(end.year, end.month, end.day);
  return normalizedDate.isBefore(DateTime(now.year, now.month, now.day)) ||
      normalizedDate.weekday == DateTime.saturday ||
      normalizedDate.weekday == DateTime.sunday ||
      (!normalizedDate.isBefore(normalizedStart) &&
          !normalizedDate.isAfter(normalizedEnd));
}
