part of '../controller.dart';

@riverpod
class IssueExportController extends _$IssueExportController {
  @override
  IssueExportState build() => IssueExportState.idle();

  Future<void> exportPurchaseRequest({required int issueId}) async {
    state = IssueExportState.loading();

    try {
      final result = await ref
          .read(issueRepositoryProvider)
          .exportPurchaseRequest(id: issueId);

      if (result.data.isEmpty) {
        state = IssueExportState.failed();
        return;
      }

      state = IssueExportState.rendering();

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async =>
            Uint8List.fromList(result.data),
      );

      state = IssueExportState.success();
    } catch (e) {
      state = IssueExportState.failed();
    }
  }

  Future<void> exportPurchaseOrder({required int requestId}) async {
    state = IssueExportState.loading();

    try {
      final result = await ref
          .read(issueRepositoryProvider)
          .exportPurchaseOrder(id: requestId);

      if (result.data.isEmpty) {
        state = IssueExportState.failed();
        return;
      }

      state = IssueExportState.rendering();

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async =>
            Uint8List.fromList(result.data),
      );

      state = IssueExportState.success();
    } catch (e) {
      state = IssueExportState.failed();
    }
  }
}
