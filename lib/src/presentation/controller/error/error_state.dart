part of '../controller.dart';

@freezed
sealed class ErrorState with _$ErrorState {
  const factory ErrorState.initial() = ErrorInitial;
  const factory ErrorState.badRequest({required String message}) =
      ErrorBadRequest;
  const factory ErrorState.unauthorized({required String message}) =
      ErrorUnauthorized;
  const factory ErrorState.tokenExpired({required String message}) =
      ErrorTokenExpired;
  const factory ErrorState.forbidden({required String message}) =
      ErrorForbidden;
  const factory ErrorState.notFound({required String message}) = ErrorNotFound;
  const factory ErrorState.conflict({required String message}) = ErrorConflict;
  const factory ErrorState.connectionError({required String message}) =
      ErrorConnectionError;
  const factory ErrorState.connectionTimeout({required String message}) =
      ErrorConnectionTimeout;
  const factory ErrorState.notDefined({required String message}) =
      ErrorNotDefined;
}
