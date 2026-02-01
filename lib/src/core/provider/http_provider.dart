part of '../core.dart';

@riverpod
Dio http(Ref ref) {
  final serviceUrl = ref.read(serviceUrlProvider);

  final options = BaseOptions(
    baseUrl: serviceUrl,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );
  final dio = Dio(options);

  dio.interceptors.add(
    AuthenticationInterceptor(client: dio, container: ref.container),
  );

  return dio;
}

class AuthenticationInterceptor extends Interceptor {
  final Dio client;
  final ProviderContainer container;

  AuthenticationInterceptor({required this.client, required this.container});

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // 1. err.response가 null이 아닐 때만 statusCode를 가져옵니다.
    final statusCode = err.response?.statusCode;
    dynamic responseData = err.response?.data; // 응답 데이터의 실제 타입

    String? message;

    // 응답 데이터가 Uint8List라면 JSON 문자열로 디코딩 후 Map으로 파싱을 시도합니다.
    if (responseData is Uint8List) {
      try {
        final jsonString = utf8.decode(responseData);
        responseData = json.decode(jsonString);
      } catch (_) {
        // 디코딩/파싱 실패 시, message는 null로 유지됩니다.
        responseData = null;
      }
    }

    // responseData가 Map<String, dynamic> 형태라면 message를 가져옵니다.
    if (responseData is Map<String, dynamic>) {
      final rawMessage = responseData['message'];

      if (rawMessage is String) {
        message = rawMessage;
      } else if (rawMessage is List) {
        // NestJS validation error 대응
        message = rawMessage.join('\n');
      } else {
        message = null;
      }
    }

    // statusCode가 null이면 다른 오류 처리 (예: DioExceptionType.connectionTimeout 등)로 흐르게 합니다.
    if (statusCode == 401) {
      // 3. message가 'access_token_expired'일 때만 로직을 실행합니다.
      if (message == 'access_token_expired') {
        final refreshToken = await container
            .read(localRepositoryProvider)
            .getRefreshToken();

        if (refreshToken == null) {
          return handler.reject(err);
        }

        // ... (토큰 갱신 로직은 그대로 유지) ...
        final response = await client.post(
          'auth/refresh',
          options: Options(headers: {'Authorization': 'Bearer $refreshToken'}),
        );

        if (response.statusCode == 201) {
          final accessToken = response.data['accessToken'];
          final refreshToken = response.data['refreshToken'];

          container
              .read(localRepositoryProvider)
              .setAccessToken(accessToken: accessToken);
          container
              .read(localRepositoryProvider)
              .setRefreshToken(refreshToken: refreshToken);

          err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';

          print('refreshed');

          return handler.resolve(await client.fetch(err.requestOptions));
        }
      }

      // 401 오류지만 access_token_expired가 아니거나, message가 null인 경우
      // (Refresh Token 만료, 유효하지 않은 토큰, 기타 401)
      await container.read(authControllerProvider.notifier).logout();
    }

    // 401이 아니거나 갱신 실패 후 최종 오류 처리
    await container
        .read(errorControllerProvider.notifier)
        .onError(err, StackTrace.current);
    return handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String languageCode = PlatformDispatcher.instance.locale.languageCode;
    final String countryCode =
        PlatformDispatcher.instance.locale.countryCode ?? '';

    String acceptLanguage = languageCode;
    if (countryCode.isNotEmpty) {
      acceptLanguage += '-$countryCode';
    }

    options.headers['Accept-Language'] = acceptLanguage;

    final accessToken = await container
        .read(localRepositoryProvider)
        .getAccessToken();
    if (options.path != 'auth/refresh' && accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';

      if (options.method == 'GET' && options.path == 'files/download') {
        options.responseType = ResponseType.bytes;
        options.headers['Content-Type'] = 'application/octet-stream';
      } else if (options.method == 'GET' &&
          options.path.startsWith('trip/export')) {
        options.responseType = ResponseType.bytes;
        options.headers['Content-Type'] = 'application/pdf';
      } else {
        options.headers['Content-Type'] = 'application/json';
      }
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
