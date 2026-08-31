part of '../controller.dart';

enum ReportFormStep {
  schedule('schedule'),
  transportation('transportation', categoryId: 1),
  localTransportation('local_transportation', categoryId: 2),
  accommodation('accommodation', categoryId: 3),
  dailyExpense('daily_expense', categoryId: 4),
  other('other', categoryId: 5),
  description('description');

  final String key;
  final int? categoryId;

  const ReportFormStep(this.key, {this.categoryId});
}

@freezed
abstract class ReportFormState with _$ReportFormState {
  const ReportFormState._();
  factory ReportFormState({
    @Default([]) List<TripActualExpense> expenses,
    @Default([]) List<TripRegulationRate> rates,
    TripFuelExpense? fuel,
    bool? isDeducted,
    String? content,
    @Default(<ReportAttachment>[]) List<ReportAttachment> attachments,
    @Default(<XFile>[]) List<XFile> files,
    Schedule? schedule,
  }) = _ReportFormState;

  bool get hasTripSchedule =>
      schedule?.category is ScheduleDomestic ||
      schedule?.category is ScheduleOverseas;

  List<ReportFormStep> get steps => hasTripSchedule
      ? [
          ReportFormStep.transportation,
          ReportFormStep.localTransportation,
          ReportFormStep.accommodation,
          ReportFormStep.dailyExpense,
          ReportFormStep.other,
          ReportFormStep.description,
        ]
      : [ReportFormStep.description];
}
