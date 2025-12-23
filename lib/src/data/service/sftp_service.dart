part of '../data.dart';

@RestApi()
abstract class SftpService {
  factory SftpService(Dio dio, {String baseUrl}) = _SftpService;

  @POST('files/inline-image')
  @MultiPart()
  Future<List<File>> uploadInlineImage({
    @Query('path') required String path,
    @Part(name: 'files') required List<MultipartFile> files,
  });

  @GET('files/download')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadFile({
    @Query('type') required String type,
    @Query('id') required int id,
  });
}
