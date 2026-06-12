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
        // 1. usePrinterSettings를 true로 설정하여 프린터의 기본 용지/여백 맞춤 세팅을 따르도록 유도
        usePrinterSettings: true,
        // 2. format 매개변수를 강제 수동 지정하거나, 원본 PDF 데이터 바이트를 그대로 스트리밍
        onLayout: (PdfPageFormat format) async =>
            Uint8List.fromList(result.data),
      );

      state = TripExportState.success();
    } catch (e) {
      state = TripExportState.failed();
    }
  }
}
