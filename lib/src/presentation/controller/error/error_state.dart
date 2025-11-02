part of '../controller.dart';

@freezed
class ErrorState with _$ErrorState {
  const factory ErrorState.initial() = ErrorInitial;
  const factory ErrorState.badRequest({required String message}) =
      ErrorBadRequest;
  const factory ErrorState.unauthorized({required String message}) =
      ErrorUnauthorized;
  const factory ErrorState.forbidden({required String message}) =
      ErrorForbidden;
  const factory ErrorState.notFound({required String message}) = ErrorNotFound;
  const factory ErrorState.conflict({required String message}) = ErrorConflict;
  const factory ErrorState.notDefined({required String message}) =
      ErrorNotDefined;
  // const factory ErrorState.notify({
  //   int? code,
  //   required String message,
  //   Exception? exception,
  // }) = ErrorNotify;
}
