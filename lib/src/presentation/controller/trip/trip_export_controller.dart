part of '../controller.dart';

@riverpod
class TripExportController extends _$TripExportController {
  @override
  TripExportState build() => TripExportState.idle();

  Future<void> export({required int tripId}) async {
    state = TripExportState.loading();

    try {
      final result = await ref
          .read(reportRepositoryProvider)
          .exportTrip(id: tripId);

      if (result.data.isEmpty) {
        state = TripExportState.failed();
        return;
      }

      state = TripExportState.rendering();

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async =>
            Uint8List.fromList(result.data),
      );

      state = TripExportState.success();
    } catch (e) {
      state = TripExportState.failed();
    }
  }
}
