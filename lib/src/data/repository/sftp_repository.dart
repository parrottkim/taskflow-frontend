part of '../data.dart';

abstract class SftpRepository {
  Future<List<File>> uploadInlineImage({required List<MultipartFile> files});
}
