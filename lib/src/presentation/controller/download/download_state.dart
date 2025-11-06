part of '../controller.dart';

@freezed
abstract class DownloadState with _$DownloadState {
  factory DownloadState.idle() = DownloadIdle;
  factory DownloadState.pending() = DownloadPending;
  factory DownloadState.success() = DownloadSuccess;
  factory DownloadState.failed() = DownloadFailed;
}
