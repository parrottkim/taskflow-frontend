part of '../controller.dart';

@freezed
abstract class DocumentFilterState with _$DocumentFilterState {
  factory DocumentFilterState({
    @Default([1]) List<int> folders,
    @Default(DocumentSort.recent) DocumentSort sort,
    @Default(Order.desc) Order order,
    String? search,
  }) = _DocumentFilterState;
}

extension DocumentFilterStateExtension on DocumentFilterState {
  int get folderId => folders.last;
}
