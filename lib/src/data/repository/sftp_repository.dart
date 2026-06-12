part of '../data.dart';

abstract class SftpRepository {
  Future<List<File>> uploadInlineImage({
    required String path,
    required List<MultipartFile> files,
  });

  Future<SupplierLogo> uploadSupplierLogo({required MultipartFile file});

  Future<HttpResponse<List<int>>> downloadFile({required String path});
}
