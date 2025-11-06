part of '../data.dart';

@RestApi()
abstract class SftpService {
  factory SftpService(Dio dio, {String baseUrl}) = _SftpService;

  @POST('files/inline-image')
  @MultiPart()
  Future<List<File>> uploadInlineImage({
    @Part(name: 'files') required List<MultipartFile> files,
  });

  @GET('files/download')
  @DioResponseType(ResponseType.bytes) // 스트림 응답 타입을 명시적으로 지정
  Future<HttpResponse<List<int>>> downloadFile(
      {@Query('path') required String path});
}
