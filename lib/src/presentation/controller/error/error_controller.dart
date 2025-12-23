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

      dynamic responseData = exception.response?.data;

      if (exception.requestOptions.responseType == ResponseType.bytes &&
          responseData is List<int>) {
        try {
          // 바이트 데이터를 UTF-8 문자열로 디코딩 후 JSON 파싱
          final jsonString = utf8.decode(responseData);
          responseData = jsonDecode(jsonString); // Map으로 변환하여 responseData에 할당

          // 파싱된 데이터를 Dio response에 다시 할당하여 이후 로직에서 사용할 수 있게 함 (선택적)
          exception.response!.data = responseData;
        } catch (e) {
          // 파싱 실패 시, message 추출을 위한 Map에 기본 오류 메시지를 넣습니다.
          responseData = {'message': 'file_response_parsing_failed'};
          exception.response!.data = responseData;
        }
      }

      final message = (responseData is Map && responseData['message'] is List)
          ? (responseData['message'] as List).join(', ')
          : (responseData is Map
              ? (responseData['message'] ?? 'bad_response').toString()
              : 'bad_response');

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
              toast.showToast(
                child: Toast(
                  type: ToastType.error,
                  message: Intl.message('bad_request'),
                ),
              );
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
              state = ErrorUnauthorized(message: message);
            // forbidden
            case 403:
              state = ErrorForbidden(message: message);
              break;
            // not found
            case 404:
              toast.showToast(
                child: Toast(
                  type: ToastType.error,
                  message: Intl.message(message),
                ),
              );
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
              toast.showToast(
                child: Toast(
                  type: ToastType.error,
                  message: Intl.message('error_unexpected'),
                ),
              );
              state = ErrorNotDefined(message: message);
              break;
          }
        default:
          toast.showToast(
            child: Toast(
              type: ToastType.error,
              message: Intl.message('error_unexpected'),
            ),
          );
          state = ErrorNotDefined(message: message);
      }
    }
  }
}
