part of '../controller.dart';

@riverpod
class DownloadController extends _$DownloadController {
  @override
  FutureOr<DownloadState> build({String? path, String? filename}) async {
    return await _init();
  }

  Future<DownloadState> _init() async {
    if (path == null || filename == null) {
      return DownloadState.failed();
    }

    try {
      final result = await ref
          .read(sftpRepositoryProvider)
          .downloadFile(path: path!);

      if (result.data.isEmpty) {
        return DownloadState.failed();
      }

      final bytes = Uint8List.fromList(result.data);
      final mimeType = lookupMimeType(filename!) ?? 'application/octet-stream';
      final blob = Blob([bytes.toJS].toJS, BlobPropertyBag(type: mimeType));
      final url = URL.createObjectURL(blob);
      final anchor = HTMLAnchorElement()
        ..href = url
        ..download = filename!
        ..style.display = 'none';

      // Mobile Safari requires the link to be attached to the document. Keep
      // the object URL alive long enough for Safari to consume it as well.
      document.body?.append(anchor);
      anchor.click();
      anchor.remove();
      Timer(const Duration(seconds: 60), () => URL.revokeObjectURL(url));

      return DownloadState.success();
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stackTrace);
      return DownloadState.failed();
    }
  }
}
