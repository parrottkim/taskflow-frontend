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
    } else {
      state = ErrorState.notDefined(message: Intl.message('error_unexpected'));
    }
  }

  void _handleDioError(DioException exception, StackTrace trace) {
    final responseData = _parseResponseData(exception);
    final message = _extractMessage(responseData);

    switch (exception.type) {
      case DioExceptionType.connectionError:
        state = ErrorState.connectionError(
          message: Intl.message('connection_error'),
        );
        break;
      case DioExceptionType.connectionTimeout:
        state = ErrorState.connectionTimeout(
          message: Intl.message('connection_timeout'),
        );
        break;
      case DioExceptionType.sendTimeout:
        state = ErrorState.notDefined(message: Intl.message('send_timeout'));
        break;
      case DioExceptionType.receiveTimeout:
        state = ErrorState.notDefined(message: Intl.message('receive_timeout'));
        break;
      case DioExceptionType.badCertificate:
        state = ErrorState.notDefined(message: Intl.message('bad_certificate'));
        break;
      case DioExceptionType.badResponse:
        _handleBadResponse(exception.response?.statusCode, message);
        break;
      default:
        state = ErrorState.notDefined(
          message: Intl.message('error_unexpected'),
        );
    }
  }

  void _handleBadResponse(int? statusCode, String message) {
    switch (statusCode) {
      case 400:
        state = ErrorState.badRequest(message: Intl.message('bad_request'));
        break;
      case 401:
        // 401 세부 조건에 따라 상태를 완전 분리
        if (message == 'refresh_token_expired') {
          state = ErrorState.tokenExpired(message: Intl.message(message));
        } else {
          state = ErrorState.unauthorized(message: Intl.message(message));
        }
        break;
      case 403:
        state = ErrorState.forbidden(message: Intl.message(message));
        break;
      case 404:
        state = ErrorState.notFound(message: Intl.message(message));
        break;
      case 409:
        state = ErrorState.conflict(message: Intl.message(message));
        break;
      default:
        state = ErrorState.notDefined(
          message: Intl.message('error_unexpected'),
        );
    }
  }

  dynamic _parseResponseData(DioException exception) {
    dynamic responseData = exception.response?.data;

    if (exception.requestOptions.responseType == ResponseType.bytes &&
        responseData is List<int>) {
      try {
        final jsonString = utf8.decode(responseData);
        responseData = jsonDecode(jsonString);
        exception.response!.data = responseData;
      } catch (_) {
        responseData = {'message': 'file_response_parsing_failed'};
        exception.response!.data = responseData;
      }
    }
    return responseData;
  }

  String _extractMessage(dynamic responseData) {
    if (responseData is Map) {
      final msg = responseData['message'];
      if (msg is List) {
        return msg.join(', ');
      }
      return (msg ?? 'bad_response').toString();
    }
    return 'bad_response';
  }
}
