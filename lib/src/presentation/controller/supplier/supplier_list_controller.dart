part of '../controller.dart';

@riverpod
class SupplierListController extends _$SupplierListController {
  @override
  FutureOr<SupplierListState> build() async {
    return _init();
  }

  Future<SupplierListState> _init() async {
    final filter = await ref.watch(supplierFilterControllerProvider.future);

    final result = await ref
        .read(supplierRepositoryProvider)
        .getSuppliers(search: filter.search);

    return SupplierListState(
      items: result.items,
      page: result.page,
      total: result.total,
      hasReachEnd: result.items.length >= result.total,
    );
  }

  Future<void> load() async {
    final filter = await ref.watch(supplierFilterControllerProvider.future);
    final keyword = filter.search?.trim();

    if (keyword == null || keyword.isEmpty) return;

    final value = state.value;
    if (value == null) return;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(supplierRepositoryProvider)
          .getSuppliers(page: value.page + 1, search: keyword);

      return value.copyWith(
        items: [...value.items, ...result.items],
        page: result.page,
        total: result.total,
        hasReachEnd: value.items.length + result.items.length >= value.total,
      );
    });
  }

  Future<void> addListItem({required Supplier item}) async {
    final value = state.value;
    if (value == null) return;

    final updatedSuppliers = [item, ...value.items];

    state = AsyncValue.data(value.copyWith(items: updatedSuppliers));
  }

  Future<void> updateListItem({required Supplier item}) async {
    final value = state.value;
    if (value == null) return;

    final updatedSuppliers = value.items.map((issue) {
      return issue.id == item.id ? item : issue;
    }).toList();

    state = AsyncValue.data(value.copyWith(items: updatedSuppliers));
  }

  Future<void> removeListItem({required int id}) async {
    final value = state.value;
    if (value == null) return;

    final updatedSuppliers = value.items
        .where((project) => project.id != id)
        .toList();

    state = AsyncValue.data(value.copyWith(items: updatedSuppliers));
  }
}
