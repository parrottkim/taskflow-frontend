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
    enableCORSWarning: false,
  );

  dio.interceptors.add(HttpInterceptor(dio: dio, container: ref.container));

  return dio;
}

class HttpInterceptor extends Interceptor {
  final Dio dio;
  final ProviderContainer container;

  // 동시에 여러 요청이 만료되어도 refresh는 한 번만 실행합니다.
  Future<String>? _refreshFuture;

  HttpInterceptor({required this.dio, required this.container});

  bool _isAuthRequest(String path) {
    final requestPath = path.split('?').first;

    return requestPath.endsWith('auth/login') ||
        requestPath.endsWith('auth/refresh') ||
        requestPath.endsWith('auth/logout');
  }

  bool _isRefreshRequest(String path) {
    return path.split('?').first.endsWith('auth/refresh');
  }

  String? _extractErrorMessage(dynamic responseData) {
    dynamic decodedData = responseData;

    if (decodedData is Uint8List) {
      try {
        final jsonString = utf8.decode(decodedData);
        decodedData = json.decode(jsonString);
      } catch (_) {
        return null;
      }
    }

    if (decodedData is! Map<String, dynamic>) {
      return null;
    }

    final rawMessage = decodedData['message'];

    if (rawMessage is String) {
      return rawMessage;
    }

    if (rawMessage is List) {
      return rawMessage.join('\n');
    }

    return null;
  }

  Future<String> _refreshAccessToken() async {
    // 이미 refresh 중이면 동일한 Future를 반환합니다.
    final currentRefresh = _refreshFuture;
    if (currentRefresh != null) {
      return currentRefresh;
    }

    final refreshFuture = dio.post('auth/refresh').then<String>((response) {
      final responseData = response.data;

      if (responseData is! Map<String, dynamic>) {
        throw const FormatException('Invalid refresh response');
      }

      final accessToken = responseData['accessToken'];

      if (accessToken is! String || accessToken.isEmpty) {
        throw const FormatException('Access token is missing');
      }

      container.read(tokenControllerProvider.notifier).set(accessToken);

      return accessToken;
    });

    _refreshFuture = refreshFuture;

    try {
      return await refreshFuture;
    } finally {
      // 완료된 Future만 제거하여 새 refresh 요청과의 충돌을 방지합니다.
      if (identical(_refreshFuture, refreshFuture)) {
        _refreshFuture = null;
      }
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final message = _extractErrorMessage(err.response?.data);
    final requestPath = err.requestOptions.path;
    final isAuthRequest = _isAuthRequest(requestPath);

    // 로그인/refresh/logout 자체의 인증 오류는 호출자가 처리합니다.
    if (statusCode == 401 && isAuthRequest) {
      return handler.next(err);
    }

    if (statusCode == 401) {
      final alreadyRetried =
          err.requestOptions.extra['accessTokenRetried'] == true;

      if (message == 'unauthorized_access_token_expired' && !alreadyRetried) {
        try {
          final accessToken = await _refreshAccessToken();

          err.requestOptions.extra['accessTokenRetried'] = true;
          err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';

          final response = await dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (_) {
          container.read(authControllerProvider.notifier).expireSession();

          return handler.next(err);
        }
      }

      container.read(authControllerProvider.notifier).expireSession();

      return handler.next(err);
    }

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
    final languageCode = PlatformDispatcher.instance.locale.languageCode;
    final countryCode = PlatformDispatcher.instance.locale.countryCode ?? '';

    var acceptLanguage = languageCode;

    if (countryCode.isNotEmpty) {
      acceptLanguage += '-$countryCode';
    }

    options.headers['Accept-Language'] = acceptLanguage;

    final accessToken = container.read(tokenControllerProvider).token;

    // refresh 요청은 HttpOnly refresh 쿠키로 인증합니다.
    if (!_isRefreshRequest(options.path) && accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    if (options.method == 'GET' && options.path == 'files/download') {
      options.responseType = ResponseType.bytes;
      options.headers['Content-Type'] = 'application/octet-stream';
    } else if (options.method == 'GET' &&
        options.path.startsWith('trip/export')) {
      options.responseType = ResponseType.bytes;
      options.headers['Content-Type'] = 'application/pdf';
    } else {
      options.headers['Content-Type'] = Headers.jsonContentType;
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
