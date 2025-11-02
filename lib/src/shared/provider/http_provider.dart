part of '../provider.dart';

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

  dio.interceptors.add(AuthenticationInterceptor(
    client: dio,
    ref: ref,
  ));

  return dio;
}

class AuthenticationInterceptor extends Interceptor {
  final Dio client;
  final Ref ref;

  AuthenticationInterceptor({
    required this.client,
    required this.ref,
  });

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final message = err.response?.data['message'];
    if (statusCode == 401 && message == 'access_token_expired') {
      final refreshToken =
          await ref.watch(localRepositoryProvider).getRefreshToken();

      if (refreshToken == null) {
        return handler.reject(err);
      }

      final response = await client.post(
        'auth/refresh',
        options: Options(
          headers: {
            'Authorization': 'Bearer $refreshToken',
          },
        ),
      );

      if (response.statusCode == 201) {
        final accessToken = response.data['accessToken'];
        final refreshToken = response.data['refreshToken'];

        ref
            .watch(localRepositoryProvider)
            .setAccessToken(accessToken: accessToken);
        ref
            .watch(localRepositoryProvider)
            .setRefreshToken(refreshToken: refreshToken);

        err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';

        print('refreshed');

        return handler.resolve(await client.fetch(err.requestOptions));
      }
    }

    if (statusCode == 401 && message == 'refresh_token_expired') {
      await ref.read(authControllerProvider.notifier).logout();
    }

    await ref
        .read(errorControllerProvider.notifier)
        .onError(err, StackTrace.current);
    return handler.next(err);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String languageCode = PlatformDispatcher.instance.locale.languageCode;
    final String countryCode =
        PlatformDispatcher.instance.locale.countryCode ?? '';

    String acceptLanguage = languageCode;
    if (countryCode.isNotEmpty) {
      acceptLanguage += '-$countryCode';
    }

    options.headers['Accept-Language'] = acceptLanguage;

    final accessToken =
        await ref.watch(localRepositoryProvider).getAccessToken();
    if (options.path != 'auth/refresh' && accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';

      // if (options.method == 'POST' &&
      //     (options.path == 'file/inline-image' || options.path == 'issue')) {
      //   options.headers['Content-Type'] = 'multipart/form-data';
      // } else {
      options.headers['Content-Type'] = 'application/json';
      // }
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
