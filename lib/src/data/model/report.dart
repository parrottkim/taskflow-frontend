part of '../data.dart';

@freezed
abstract class Report with _$Report {
  factory Report({
    required int id,
    Schedule? schedule,
    required User user,
    TripReport? trip,
    required String content,
    required List<ReportAttachment> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime? deletedAt,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  factory Report.dummy() => Report(
    id: 0,
    user: User.dummy(),
    content: '',
    attachments: [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    deletedAt: null,
  );
}

@freezed
abstract class ReportAttachment with _$ReportAttachment {
  factory ReportAttachment({
    required int id,
    required String filename,
    required int size,
    required String path,
    required DateTime createdAt,
  }) = _ReportAttachment;

  factory ReportAttachment.fromJson(Map<String, dynamic> json) =>
      _$ReportAttachmentFromJson(json);
}

@freezed
abstract class TripReport with _$TripReport {
  const TripReport._();
  factory TripReport({
    required List<TripActualExpense> expenses,
    required List<TripRegulationRate> rates,
    TripFuelExpense? fuel,
    @Default(false) bool isDeducted,
    TripCalculations? calculations,
  }) = _TripReport;

  factory TripReport.fromJson(Map<String, dynamic> json) =>
      _$TripReportFromJson(json);

  factory TripReport.dummy() => TripReport(expenses: [], rates: []);

  double totalExpenseFor(int stepId) {
    return expenses
        .where((e) => e.stepId == stepId)
        .map(
          (e) => double.tryParse((e.price ?? '0').replaceAll(',', '')) ?? 0.0,
        )
        .fold(0.0, (prev, element) => prev + element);
  }

  /// 규정 요금(Rate * Days) 합계: 쉼표 제거 및 다중 항목 합산
  double totalRateFor(int stepId) {
    return rates
        .where((r) => r.stepId == stepId)
        .map((r) {
          final rate =
              double.tryParse((r.rate ?? '0').replaceAll(',', '')) ?? 0.0;
          final days =
              double.tryParse((r.days ?? '0').replaceAll(',', '')) ?? 0.0;
          return rate * days;
        })
        .fold(0.0, (prev, element) => prev + element);
  }

  double get totalFuelExpense {
    if (fuel == null) return 0.0;

    final rate =
        double.tryParse((fuel!.rate ?? '0').replaceAll(',', '')) ?? 0.0;
    final distance =
        double.tryParse((fuel!.distance ?? '0').replaceAll(',', '')) ?? 0.0;
    final mileage =
        double.tryParse((fuel!.mileage ?? '0').replaceAll(',', '')) ??
        1.0; // 0으로 나누기 방지

    if (mileage == 0) return 0.0;

    return (rate * distance) / mileage;
  }
}

@freezed
abstract class TripCategory with _$TripCategory {
  factory TripCategory({
    required int id,
    required String name,
    String? description,
  }) = _TripCategory;

  factory TripCategory.fromJson(Map<String, dynamic> json) =>
      _$TripCategoryFromJson(json);

  factory TripCategory.dummy() => TripCategory(id: 0, name: '카테고리');
}

@freezed
abstract class TripStep with _$TripStep {
  factory TripStep({
    required int id,
    required int categoryId,
    required String name,
    String? description,
  }) = _TripStep;

  factory TripStep.fromJson(Map<String, dynamic> json) =>
      _$TripStepFromJson(json);

  factory TripStep.dummy() => TripStep(id: 0, categoryId: 0, name: '스텝');
}

@freezed
abstract class TripActualExpense with _$TripActualExpense {
  factory TripActualExpense({
    int? id,
    required int stepId,
    String? price,
    String? details,
  }) = _TripActualExpense;

  factory TripActualExpense.fromJson(Map<String, dynamic> json) =>
      _$TripActualExpenseFromJson(json);

  factory TripActualExpense.empty() => TripActualExpense(stepId: 0);
}

@freezed
abstract class TripRegulationRate with _$TripRegulationRate {
  factory TripRegulationRate({
    int? id,
    required int stepId,
    String? days,
    String? rate,
    String? details,
  }) = _TripRegulationRate;

  factory TripRegulationRate.fromJson(Map<String, dynamic> json) =>
      _$TripRegulationRateFromJson(json);

  factory TripRegulationRate.empty() =>
      TripRegulationRate(stepId: 0, rate: '0', days: '0');
}

@freezed
abstract class TripFuelExpense with _$TripFuelExpense {
  factory TripFuelExpense({
    int? id,
    String? rate,
    String? mileage,
    String? distance,
  }) = _TripFuelExpense;

  factory TripFuelExpense.fromJson(Map<String, dynamic> json) =>
      _$TripFuelExpenseFromJson(json);
}

@freezed
abstract class TripRegulation with _$TripRegulation {
  factory TripRegulation({
    required int id,
    required int stepId,
    required String rate,
  }) = _TripRegulation;

  factory TripRegulation.fromJson(Map<String, dynamic> json) =>
      _$TripRegulationFromJson(json);

  factory TripRegulation.dummy() => TripRegulation(id: 0, stepId: 0, rate: '0');
}

@freezed
abstract class TripCalculations with _$TripCalculations {
  factory TripCalculations({
    required int totalCost,
    int? taxableAmount,
    int? nonTaxableAmount,
    int? exchangeRate,
  }) = _TripCalculations;

  factory TripCalculations.fromJson(Map<String, dynamic> json) =>
      _$TripCalculationsFromJson(json);
}
