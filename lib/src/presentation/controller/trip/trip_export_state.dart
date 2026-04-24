part of '../controller.dart';

@freezed
sealed class TripExportState with _$TripExportState {
  factory TripExportState.idle() = TripExportIdle;
  factory TripExportState.loading() = TripExportLoading;
  factory TripExportState.rendering() = TripExportRendering;
  factory TripExportState.success() = TripExportSuccess;
  factory TripExportState.failed() = TripExportFailed;
}
