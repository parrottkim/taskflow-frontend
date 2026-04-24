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

      final userAgent = window.navigator.userAgent.toLowerCase();
      final isIOS = userAgent.contains('iphone') || userAgent.contains('ipad');

      if (isIOS) {
        // iOS: blob 다운로드 불가 → data URL 사용
        final base64 = base64Encode(result.data);
        final url = 'data:application/octet-stream;base64,$base64';

        final anchor = HTMLAnchorElement()
          ..href = url
          ..download = filename!;
        anchor.click();
      } else {
        // 일반 브라우저
        final bytes = Uint8List.fromList(result.data);
        final blob = Blob([bytes.toJS].toJS);
        final url = URL.createObjectURL(blob);

        final anchor = HTMLAnchorElement()
          ..href = url
          ..download = filename!;
        anchor.click();

        URL.revokeObjectURL(url);
      }

      return DownloadState.success();
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return DownloadState.failed();
    }
  }
}
