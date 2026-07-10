part of '../controller.dart';

@freezed
abstract class DocumentFilterState with _$DocumentFilterState {
  factory DocumentFilterState({
    @Default(1) int folderId,
    @Default(DocumentSort.recent) DocumentSort sort,
    @Default(Order.desc) Order order,
    String? search,
  }) = _DocumentFilterState;
}
