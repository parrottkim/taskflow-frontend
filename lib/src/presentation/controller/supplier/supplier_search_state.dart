part of '../controller.dart';

@freezed
sealed class SupplierSearchState with _$SupplierSearchState {
  factory SupplierSearchState.idle() = SupplierSearchIdle;
  factory SupplierSearchState.waiting({@Default('') String search}) =
      SupplierSearchWaiting;
  factory SupplierSearchState.result({
    @Default('') String search,
    @Default([]) List<Supplier> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasReachEnd,
  }) = SupplierSearchResult;
  factory SupplierSearchState.failure(String message) = SupplierSearchFailure;

  factory SupplierSearchState.fromJson(Map<String, dynamic> json) =>
      _$SupplierSearchStateFromJson(json);
}
