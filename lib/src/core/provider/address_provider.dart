part of '../core.dart';

@riverpod
String addressConfmKey(Ref ref) => throw UnimplementedError();

@riverpod
Dio addressHttp(Ref ref) {
  final confmKey = ref.watch(addressConfmKeyProvider);
  final options = BaseOptions(
    baseUrl: 'https://business.juso.go.kr',
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    queryParameters: {'confmKey': confmKey},
  );

  return Dio(options);
}
