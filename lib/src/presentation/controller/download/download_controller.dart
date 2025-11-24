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

    final userAgent = window.navigator.userAgent.toLowerCase();
    final isIOS = userAgent.contains("iphone") || userAgent.contains("ipad");

    if (isIOS) {
      // iOS는 blob 다운로드가 안되므로 data url 사용
      final base64 = base64Encode(result.data);
      final url = "data:application/octet-stream;base64,$base64";

      AnchorElement(href: url)
        ..setAttribute("download", filename!)
        ..click();
    } else {
      // 일반 브라우저 정상 동작
      final bytes = Uint8List.fromList(result.data);
      final blob = Blob([bytes]);
      final url = Url.createObjectUrlFromBlob(blob);

      AnchorElement(href: url)
        ..setAttribute("download", filename!)
        ..click();

      Url.revokeObjectUrl(url);
    }

    return DownloadState.success();
  }
}
