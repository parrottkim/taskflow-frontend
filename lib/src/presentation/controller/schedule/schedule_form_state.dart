part of '../controller.dart';

@freezed
abstract class ScheduleFormState with _$ScheduleFormState {
  factory ScheduleFormState({
    int? projectId,
    String? projectName,
    int? projectClientId,
    String? projectClientName,
    String? summary,
    String? description,
    DateTime? start,
    DateTime? end,
  }) = _ScheduleFormState;
}
