part of '../controller.dart';

@riverpod
class DocumentFilterController extends _$DocumentFilterController {
  @override
  DocumentFilterState build() => DocumentFilterState();

  void init({String? folders, String? sort, String? order, String? search}) {
    final nextFolders = folders
        ?.split(',')
        .map((value) => int.tryParse(value))
        .nonNulls
        .toList();

    state = state.copyWith(
      folders: nextFolders == null || nextFolders.isEmpty
          ? state.folders
          : nextFolders,
      sort: sort != null ? DocumentSortOption.fromKey(sort) : state.sort,
      order: order != null ? SortDirection.fromKey(order) : state.order,
      search: search,
    );
  }

  void setFolders({required List<int> folders}) {
    state = state.copyWith(folders: folders);
  }

  void setSort({required DocumentSortOption sort}) {
    state = state.copyWith(sort: sort);
  }

  void setOrder({required SortDirection order}) {
    state = state.copyWith(order: order);
  }

  void setSearch({String? search}) {
    state = state.copyWith(search: search);
  }
}
