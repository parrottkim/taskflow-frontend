part of '../controller.dart';

@freezed
sealed class ReportFormState with _$ReportFormState {
  factory ReportFormState({
    @Default([]) List<TripActualExpense> expenses,
    @Default([]) List<TripRegulationRate> rates,
    TripFuelExpense? fuel,
    bool? isDeducted,
    String? content,
    List<ReportAttachment>? attachments,
    List<XFile>? files,
    Schedule? schedule,
    @Default([]) List<String> steps,
  }) = _ReportFormState;
}
