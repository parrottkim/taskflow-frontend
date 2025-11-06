part of '../data.dart';

abstract class SftpRepository {
  Future<List<File>> uploadInlineImage({required List<MultipartFile> files});

  Future<HttpResponse<List<int>>> downloadFile({required String path});
}
