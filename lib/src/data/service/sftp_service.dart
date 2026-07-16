part of '../data.dart';

@RestApi()
abstract class SftpService {
  factory SftpService(Dio dio, {String baseUrl}) = _SftpService;

  @POST('files/inline-image')
  @MultiPart()
  Future<List<File>> uploadInlineImage({
    @Query('path') required String path,
    @Query('resource_id') required int resourceId,
    @Part(name: 'files') required List<MultipartFile> files,
  });

  @POST('files/supplier-logo')
  @MultiPart()
  Future<SupplierLogo> uploadSupplierLogo({
    @Part(name: 'file') required MultipartFile file,
  });

  @GET('files/download')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadFile({
    @Query('path') required String path,
  });
}
