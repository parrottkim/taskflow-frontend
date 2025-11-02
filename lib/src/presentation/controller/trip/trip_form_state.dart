part of '../controller.dart';

@freezed
abstract class TripFormState with _$TripFormState {
  factory TripFormState.domestic({
    Schedule? schedule,
    @Default([]) List<TripActualExpense> expenses,
    @Default([]) List<TripRegulationRate> rates,
    TripFuelExpense? fuel,
  }) = TripFormDomestic;
  factory TripFormState.overseas({
    Schedule? schedule,
    @Default([]) List<TripActualExpense> expenses,
    @Default([]) List<TripRegulationRate> rates,
    @Default(false) bool isDeducted,
  }) = TripFormOverseas;
}
