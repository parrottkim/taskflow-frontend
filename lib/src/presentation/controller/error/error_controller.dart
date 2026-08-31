part of '../controller.dart';

@riverpod
class ErrorController extends _$ErrorController {
  @override
  ErrorState build() {
    return const ErrorState.initial();
  }

  void handleException(Object? error, StackTrace stackTrace) {
    if (error is DioException) {
      _handleDioError(error, stackTrace);
      return;
    }

    state = ErrorState.notDefined(message: Intl.message('error_unexpected'));
  }

  void _handleDioError(DioException exception, StackTrace stackTrace) {
    final responseData = _parseResponseData(exception);
    final messageKey = _extractMessage(responseData);

    // 필요하면 Sentry, Crashlytics 등에 error와 stackTrace를 전달
    debugPrint('$exception');
    debugPrintStack(stackTrace: stackTrace);

    switch (exception.type) {
      case DioExceptionType.connectionError:
        state = ErrorState.connectionError(
          message: Intl.message('connection_error'),
        );

      case DioExceptionType.connectionTimeout:
        state = ErrorState.connectionTimeout(
          message: Intl.message('connection_timeout'),
        );

      case DioExceptionType.sendTimeout:
        state = ErrorState.notDefined(message: Intl.message('send_timeout'));

      case DioExceptionType.receiveTimeout:
        state = ErrorState.notDefined(message: Intl.message('receive_timeout'));

      case DioExceptionType.badCertificate:
        state = ErrorState.notDefined(message: Intl.message('bad_certificate'));

      case DioExceptionType.badResponse:
        _handleBadResponse(exception.response?.statusCode, messageKey);

      default:
        state = ErrorState.notDefined(
          message: Intl.message('error_unexpected'),
        );
    }
  }

  void _handleBadResponse(int? statusCode, String messageKey) {
    final localizedMessage = _localizeErrorMessage(messageKey);

    switch (statusCode) {
      case 400:
        state = ErrorState.badRequest(message: localizedMessage);

      case 401:
        if (messageKey == 'unauthorized_refresh_token_expired') {
          state = ErrorState.tokenExpired(message: localizedMessage);
        } else {
          state = ErrorState.unauthorized(message: localizedMessage);
        }

      case 403:
        state = ErrorState.forbidden(message: localizedMessage);

      case 404:
        state = ErrorState.notFound(message: localizedMessage);

      case 409:
        state = ErrorState.conflict(message: localizedMessage);

      case 429:
        state = ErrorState.tooManyRequests(message: localizedMessage);

      case 500:
        state = ErrorState.notDefined(message: localizedMessage);

      default:
        state = ErrorState.notDefined(
          message: Intl.message('error_unexpected'),
        );
    }
  }

  String _localizeErrorMessage(String messageKey) {
    final localizedMessage = Intl.message(messageKey, name: messageKey);

    if (localizedMessage == messageKey) {
      return Intl.message('error_unexpected');
    }

    return localizedMessage;
  }

  dynamic _parseResponseData(DioException exception) {
    dynamic responseData = exception.response?.data;

    if (exception.requestOptions.responseType == ResponseType.bytes &&
        responseData is List<int>) {
      try {
        final jsonString = utf8.decode(responseData);
        responseData = jsonDecode(jsonString);
        exception.response?.data = responseData;
      } catch (_) {
        responseData = {'message': 'file_response_parsing_failed'};
        exception.response?.data = responseData;
      }
    }

    return responseData;
  }

  String _extractMessage(dynamic responseData) {
    if (responseData is Map) {
      final message = responseData['message'];

      if (message is List) {
        return message.map((item) => item.toString()).join('\n');
      }

      return (message ?? 'bad_response').toString();
    }

    return 'bad_response';
  }
}
