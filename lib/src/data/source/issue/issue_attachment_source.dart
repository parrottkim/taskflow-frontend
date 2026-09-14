part of '../../data.dart';

class IssueAttachmentDataSource implements IssueAttachmentRepository {
  final IssueAttachmentService _service;

  IssueAttachmentDataSource({required this._service});

  @override
  Future<List<IssueAttachment>> uploadAttachments({
    required int issueId,
    required List<MultipartFile> files,
  }) => _service.uploadAttachments(issueId: issueId, files: files);

  @override
  Future<void> deleteAttachment({required int issueId, required int fileId}) =>
      _service.deleteAttachment(issueId: issueId, fileId: fileId);
}

@riverpod
IssueAttachmentRepository issueAttachmentRepository(Ref ref) {
  final dio = ref.watch(httpProvider);
  return IssueAttachmentDataSource(service: IssueAttachmentService(dio));
}
