part of '../controller.dart';

@freezed
abstract class SummaryState with _$SummaryState {
  factory SummaryState({
    required ProjectSummary summary,
  }) = _SummaryState;
}
