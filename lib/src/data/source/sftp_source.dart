part of '../data.dart';

class SftpDataSource implements SftpRepository {
  final SftpService _service;

  SftpDataSource({required SftpService service}) : _service = service;

  @override
  Future<List<File>> uploadInlineImage({required List<MultipartFile> files}) =>
      _service.uploadInlineImage(files: files);
}

@riverpod
SftpRepository sftpRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return SftpDataSource(service: SftpService(dio));
}
