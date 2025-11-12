part of '../controller.dart';

@freezed
sealed class TripPreviewState with _$TripPreviewState {
  factory TripPreviewState.idle() = TripPreviewIdle;
  factory TripPreviewState.loading() = TripPreviewLoading;
  factory TripPreviewState.rendering() = TripPreviewRendering;
  factory TripPreviewState.success() = TripPreviewSuccess;
  factory TripPreviewState.failed() = TripPreviewFailed;
}
