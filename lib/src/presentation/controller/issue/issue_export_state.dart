part of '../controller.dart';

@freezed
sealed class IssueExportState with _$IssueExportState {
  factory IssueExportState.idle() = IssueExportIdle;
  factory IssueExportState.loading() = IssueExportLoading;
  factory IssueExportState.rendering() = IssueExportRendering;
  factory IssueExportState.success() = IssueExportSuccess;
  factory IssueExportState.failed() = IssueExportFailed;
}
