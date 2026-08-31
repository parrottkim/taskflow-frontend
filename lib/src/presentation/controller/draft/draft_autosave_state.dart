part of '../controller.dart';

@freezed
sealed class DraftAutosaveState with _$DraftAutosaveState {
  const factory DraftAutosaveState.idle() = ReportDraftAutosaveIdle;
  const factory DraftAutosaveState.saving() = ReportDraftAutosaveSaving;
  const factory DraftAutosaveState.saved() = ReportDraftAutosaveSaved;
  const factory DraftAutosaveState.failed() = ReportDraftAutosaveFailed;
}
