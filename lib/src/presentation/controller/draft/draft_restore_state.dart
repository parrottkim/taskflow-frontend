part of '../controller.dart';

@freezed
sealed class DraftRestoreState with _$DraftRestoreState {
  const factory DraftRestoreState.idle() = DraftRestoreIdle;
  const factory DraftRestoreState.restoring() = DraftRestoring;
  const factory DraftRestoreState.restored() = DraftRestored;
  const factory DraftRestoreState.invalid() = DraftRestoreInvalid;
  const factory DraftRestoreState.failure() = DraftRestoreFailure;
}
