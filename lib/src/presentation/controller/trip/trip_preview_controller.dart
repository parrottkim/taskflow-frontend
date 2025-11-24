part of '../controller.dart';

@riverpod
class TripPreviewController extends _$TripPreviewController {
  @override
  TripPreviewState build() => TripPreviewState.idle();

  Future<void> preview({required int tripId}) async {
    state = TripPreviewState.loading();

    try {
      final result =
          await ref.read(reportRepositoryProvider).exportTrip(id: tripId);

      if (result.data.isEmpty) {
        state = TripPreviewState.failed();
        return;
      }

      state = TripPreviewState.rendering();

      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async =>
              Uint8List.fromList(result.data));

      state = TripPreviewState.success();
    } catch (e) {
      print(e);
      state = TripPreviewState.failed();
    }
  }
}
