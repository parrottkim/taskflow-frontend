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

  dio.httpClientAdapter = BrowserHttpClientAdapter(
    withCredentials: true,
    // The API explicitly supports credentialed CORS and OPTIONS requests.
    // Dio 5.11 otherwise logs the same informational warning per request.
    enableCORSWarning: false,
  );

  dio.interceptors.add(HttpInterceptor(dio: dio, container: ref.container));

  return dio;
}

class HttpInterceptor extends Interceptor {
  final Dio dio;
  final ProviderContainer container;

  HttpInterceptor({required this.dio, required this.container});

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

    final requestPath = err.requestOptions.path;
    final isAuthRequest =
        requestPath.endsWith('auth/login') ||
        requestPath.endsWith('auth/refresh') ||
        requestPath.endsWith('auth/logout');

    // 로그인 실패나 시작 시 refresh 쿠키가 없는 경우는 호출자가 처리할
    // 정상적인 인증 결과이므로 logout 재호출이나 전역 오류로 전달하지 않습니다.
    if (statusCode == 401 && isAuthRequest) {
      return handler.next(err);
    }

    if (statusCode == 401) {
      if (message == 'unauthorized_access_token_expired') {
        try {
          final response = await dio.post('auth/refresh');
          final accessToken = response.data['accessToken'] as String;

          container.read(tokenControllerProvider.notifier).set(accessToken);

          err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
          return handler.resolve(await dio.fetch(err.requestOptions));
        } on DioException {
          container.read(authControllerProvider.notifier).expireSession();
          return handler.next(err);
        }
      }

      container.read(authControllerProvider.notifier).expireSession();
      return handler.next(err);
    }

    // 401이 아니거나 갱신 실패 후 최종 오류 처리
    container
        .read(errorControllerProvider.notifier)
        .handleException(err, StackTrace.current);
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

    final accessToken = container.read(tokenControllerProvider).token;
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
