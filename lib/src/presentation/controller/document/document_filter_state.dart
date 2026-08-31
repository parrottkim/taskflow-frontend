part of '../controller.dart';

@freezed
abstract class DocumentFilterState with _$DocumentFilterState {
  factory DocumentFilterState({
    @Default([1]) List<int> folders,
    @Default(DocumentSortOption.recent) DocumentSortOption sort,
    @Default(SortDirection.desc) SortDirection order,
    String? search,
  }) = _DocumentFilterState;
}

extension DocumentFilterStateExtension on DocumentFilterState {
  int get folderId => folders.last;
}
