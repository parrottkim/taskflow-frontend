part of '../controller.dart';

@freezed
sealed class ReportSubmitState with _$ReportSubmitState {
  const factory ReportSubmitState.idle() = ReportSubmitIdle;
  const factory ReportSubmitState.pending() = ReportSubmitPending;
  const factory ReportSubmitState.created(Report report) = ReportSubmitCreated;
  const factory ReportSubmitState.updated(Report report) = ReportSubmitUpdated;
  const factory ReportSubmitState.deleted() = ReportSubmitDeleted;
  const factory ReportSubmitState.mailed() = ReportSubmitMailed;
  const factory ReportSubmitState.failure(String message) = ReportSubmitFailure;
}
