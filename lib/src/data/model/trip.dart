part of '../data.dart';

@freezed
abstract class Trip with _$Trip {
  factory Trip({
    required int id,
    required Schedule schedule,
    required User user,
    required List<TripActualExpense> expenses,
    required List<TripRegulationRate> rates,
    TripFuelExpense? fuel,
    @Default(false) bool isDeducted,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime? deletedAt,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  factory Trip.dummy() => Trip(
        id: 0,
        schedule: Schedule.dummy(),
        user: User.dummy(),
        expenses: [],
        rates: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
      );
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

  factory TripRegulationRate.empty() => TripRegulationRate(stepId: 0);
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
