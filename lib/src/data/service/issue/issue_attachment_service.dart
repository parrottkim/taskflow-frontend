part of '../../data.dart';

@RestApi()
abstract class IssueAttachmentService {
  factory IssueAttachmentService(Dio dio, {String baseUrl}) =
      _IssueAttachmentService;

  @POST('issue/{issue_id}/attachments')
  @MultiPart()
  Future<List<IssueAttachment>> uploadAttachments({
    @Path('issue_id') required int issueId,
    @Part() required List<MultipartFile> files,
  });

  @DELETE('issue/{issue_id}/attachments/{file_id}')
  Future<void> deleteAttachment({
    @Path('issue_id') required int issueId,
    @Path('file_id') required int fileId,
  });
}
