part of '../controller.dart';

@riverpod
class ErrorController extends _$ErrorController {
  @override
  ErrorState build() {
    return const ErrorInitial();
  }

  FutureOr<void> onError(Object? error, StackTrace stackTrace) async {
    if (error is Exception) {
      return await throwException(exception: error, trace: stackTrace);
    } else {
      state = ErrorNotDefined(message: Intl.message('error_unexpected'));
    }
  }

  Future<Null> throwException(
      {required Exception exception, StackTrace? trace}) async {
    if (exception is DioException) {
      final toast = ref.watch(toastProvider);
      final message = (exception.response?.data['message'] is List)
          ? (exception.response?.data['message'] as List).join(', ')
          : (exception.response?.data['message'] ?? 'bad_response').toString();

      switch (exception.type) {
        case DioExceptionType.connectionError:
          toast.showToast(
            child: Toast(
              type: ToastType.error,
              message: Intl.message('connection_error'),
            ),
          );
        case DioExceptionType.connectionTimeout:
          toast.showToast(
            child: Toast(
              type: ToastType.error,
              message: Intl.message('connection_timeout'),
            ),
          );
        case DioExceptionType.sendTimeout:
          toast.showToast(
            child: Toast(
              type: ToastType.error,
              message: Intl.message('send_timeout'),
            ),
          );
        case DioExceptionType.receiveTimeout:
          toast.showToast(
            child: Toast(
              type: ToastType.error,
              message: Intl.message('receive_timeout'),
            ),
          );
        case DioExceptionType.badCertificate:
          toast.showToast(
            child: Toast(
              type: ToastType.error,
              message: Intl.message('bad_certificate'),
            ),
          );
        case DioExceptionType.badResponse:
          switch (exception.response?.statusCode) {
            // bad request
            case 400:
              state = ErrorBadRequest(message: message);
            // unauthorized
            case 401:
              if (message == 'refresh_token_expired') {
                toast.showToast(
                  child: Toast(
                    type: ToastType.standard,
                    message: Intl.message(message),
                  ),
                );
              }
              // state = ErrorNotify(
              //   code: exception.response?.statusCode,
              //   message: Intl.message(message),
              //   exception: exception,
              // );
              state = ErrorUnauthorized(message: message);
            // forbidden
            case 403:
              state = ErrorForbidden(message: message);
              break;
            // not found
            case 404:
              state = ErrorNotFound(message: message);
              break;
            // conflict
            case 409:
              toast.showToast(
                child: Toast(
                  type: ToastType.error,
                  message: Intl.message(message),
                ),
              );
              state = ErrorConflict(message: message);
              break;
            default:
              state = ErrorNotDefined(message: message);
              break;
          }
        default:
          state = ErrorNotDefined(message: message);
      }
    }
  }
}
