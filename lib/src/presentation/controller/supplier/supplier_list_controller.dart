part of '../controller.dart';

@riverpod
class SupplierListController extends _$SupplierListController {
  @override
  FutureOr<SupplierListState> build(SupplierFilterScope scope) async {
    return _init();
  }

  Future<SupplierListState> _init() async {
    final filter = ref.watch(supplierFilterControllerProvider(scope));

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
    final filter = ref.watch(supplierFilterControllerProvider(scope));
    if (!state.hasValue) return;
    final value = state.requireValue;
    if (value.hasReachEnd) return;

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(supplierRepositoryProvider)
          .getSuppliers(page: value.page + 1, search: filter.search);

      return value.copyWith(
        items: [...value.items, ...result.items],
        page: result.page,
        total: result.total,
        hasReachEnd: value.items.length + result.items.length >= result.total,
      );
    });
  }

  Future<void> addListItem({required Supplier item}) async {
    if (!state.hasValue) return;
    final value = state.requireValue;

    final updatedSuppliers = [item, ...value.items];

    state = AsyncValue.data(value.copyWith(items: updatedSuppliers));
  }

  Future<void> updateListItem({required Supplier item}) async {
    if (!state.hasValue) return;
    final value = state.requireValue;

    final updatedSuppliers = value.items.map((issue) {
      return issue.id == item.id ? item : issue;
    }).toList();

    state = AsyncValue.data(value.copyWith(items: updatedSuppliers));
  }

  Future<void> removeListItem({required int id}) async {
    if (!state.hasValue) return;
    final value = state.requireValue;

    final updatedSuppliers = value.items
        .where((project) => project.id != id)
        .toList();

    state = AsyncValue.data(value.copyWith(items: updatedSuppliers));
  }
}
