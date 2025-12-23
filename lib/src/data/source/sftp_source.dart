part of '../data.dart';

class SftpDataSource implements SftpRepository {
  final SftpService _service;

  SftpDataSource({required SftpService service}) : _service = service;

  @override
  Future<List<File>> uploadInlineImage(
          {required String path, required List<MultipartFile> files}) =>
      _service.uploadInlineImage(path: path, files: files);

  @override
  Future<HttpResponse<List<int>>> downloadFile({required String path}) =>
      _service.downloadFile(path: path);
}

@riverpod
SftpRepository sftpRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return SftpDataSource(service: SftpService(dio));
}
