part of '../controller.dart';

@riverpod
class DownloadController extends _$DownloadController {
  @override
  FutureOr<DownloadState> build({String? path, String? filename}) async {
    return await _init();
  }

  Future<DownloadState> _init() async {
    if (path == null || filename == null) return DownloadState.failed();

    final result =
        await ref.read(sftpRepositoryProvider).downloadFile(path: path!);

    if (result.data.isEmpty) return DownloadState.failed();

    if (window.navigator.userAgent.contains('Mozilla')) {
      final bytes = Uint8List.fromList(result.data);
      final blob = Blob([bytes]);
      final url = Url.createObjectUrlFromBlob(blob);

      AnchorElement(href: url)
        ..setAttribute("download", filename!)
        ..click();
      Url.revokeObjectUrl(url);

      window.close();
    }

    return DownloadState.success();
  }
}
