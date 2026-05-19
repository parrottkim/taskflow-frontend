part of '../controller.dart';

@freezed
abstract class ReportFormState with _$ReportFormState {
  const ReportFormState._();
  factory ReportFormState({
    @Default([]) List<TripActualExpense> expenses,
    @Default([]) List<TripRegulationRate> rates,
    TripFuelExpense? fuel,
    bool? isDeducted,
    String? content,
    List<ReportAttachment>? attachments,
    List<XFile>? files,
    Schedule? schedule,
  }) = _ReportFormState;

  bool get hasTripSchedule =>
      schedule?.category is ScheduleDomestic ||
      schedule?.category is ScheduleOverseas;

  List<String> get steps => hasTripSchedule
      ? [
          'transportation',
          'local_transportation',
          'accommodation',
          'daily_expense',
          'other',
          'description',
        ]
      : ['description'];
}
