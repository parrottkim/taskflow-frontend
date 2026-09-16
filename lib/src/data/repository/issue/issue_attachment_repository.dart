part of '../../data.dart';

abstract class IssueAttachmentRepository {
  Future<List<IssueAttachment>> uploadAttachments({
    required int issueId,
    required List<MultipartFile> files,
  });

  Future<void> deleteAttachment({required int issueId, required int fileId});
}
