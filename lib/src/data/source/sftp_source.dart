part of '../data.dart';

class SftpDataSource implements SftpRepository {
  final SftpService _service;

  SftpDataSource({required SftpService service}) : _service = service;

  @override
  Future<List<UploadedFile>> uploadInlineImage({
    required String path,
    required int resourceId,
    required List<MultipartFile> files,
  }) => _service.uploadInlineImage(
    path: path,
    resourceId: resourceId,
    files: files,
  );

  @override
  Future<SupplierLogo> uploadSupplierLogo({required MultipartFile file}) =>
      _service.uploadSupplierLogo(file: file);

  @override
  Future<HttpResponse<List<int>>> downloadFile({required String path}) =>
      _service.downloadFile(path: path);
}

@riverpod
SftpRepository sftpRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return SftpDataSource(service: SftpService(dio));
}
