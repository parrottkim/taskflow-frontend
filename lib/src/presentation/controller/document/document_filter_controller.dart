part of '../controller.dart';

@riverpod
class DocumentFilterController extends _$DocumentFilterController {
  @override
  FutureOr<DocumentFilterState> build() {
    return DocumentFilterState();
  }

  Future<void> init({
    int? folderId,
    String? sort,
    String? order,
    String? search,
  }) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(
        folderId: folderId ?? value.folderId,
        sort: sort != null ? DocumentSort.fromKey(sort) : value.sort,
        order: order != null ? Order.fromKey(order) : value.order,
        search: search,
      ),
    );
  }

  void setFolderId({required int id}) {
    final value = state.value;
    if (value == null) return;

    state = AsyncData(value.copyWith(folderId: id));
  }

  void setSort({required DocumentSort sort}) {
    final value = state.value;
    if (value == null) return;

    state = AsyncData(value.copyWith(sort: sort));
  }

  void setOrder({required Order order}) {
    final value = state.value;
    if (value == null) return;

    state = AsyncData(value.copyWith(order: order));
  }

  void setSearch({String? search}) {
    final value = state.value;
    if (value == null) return;

    state = AsyncData(value.copyWith(search: search));
  }
}
