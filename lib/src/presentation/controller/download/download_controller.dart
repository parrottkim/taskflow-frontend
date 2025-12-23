part of '../controller.dart';

@riverpod
class DownloadController extends _$DownloadController {
  @override
  FutureOr<DownloadState> build({String? type, int? id}) async {
    return await _init();
  }

  Future<DownloadState> _init() async {
    if (type == null || id == null) return DownloadState.failed();

    final result = await ref
        .read(sftpRepositoryProvider)
        .downloadFile(type: type!, id: id!);

    if (result.data.isEmpty) return DownloadState.failed();

    String? filename;
    final contentDisposition = result.response.headers['Content-Disposition']
        ?.first; // 실제 HTTP 클라이언트 라이브러리의 속성에 맞게 수정 필요

    if (contentDisposition != null) {
      final regex = RegExp(r'filename="([^"]+)"');
      final match = regex.firstMatch(contentDisposition);
      if (match != null && match.groupCount >= 1) {
        filename = Uri.decodeComponent(match.group(1)!);
      }
    }

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
